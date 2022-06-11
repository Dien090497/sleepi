import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class SFDropDownRotation<T> extends StatelessWidget {
  const SFDropDownRotation(
      {Key? key,
      required this.value,
      required this.spinnerItems,
      this.icon,
      this.dropdownWidth,
      this.dropdownHeight,
      this.selectedItemHighlightColor,
      this.mainAxisAlignment,
      this.constraints,
      this.onChange})
      : super(key: key);

  final T value;
  final List<T> spinnerItems;
  final Widget? icon;
  final double? dropdownWidth;
  final double? dropdownHeight;
  final MainAxisAlignment? mainAxisAlignment;
  final BoxConstraints? constraints;
  final void Function(int, int)? onChange;
  final Color? selectedItemHighlightColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dropdownHeight ?? 40,
      width: dropdownWidth,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.darkColor1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CustomDropdown(
        icon: const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: AppColors.lightGrey,
        ),
        onChange: onChange,
        dropdownButtonStyle: DropdownButtonStyle(
          elevation: 4,
          backgroundColor: Colors.white,
          primaryColor: AppColors.dark,
          mainAxisAlignment: mainAxisAlignment,
        ),
        dropdownStyle: DropdownStyle(
          // constraints: constraints,
          borderRadius: BorderRadius.circular(8),
          elevation: 5,
          color: AppColors.dark,
        ),
        items: spinnerItems
            .asMap()
            .entries
            .map(
              (item) => DropdownItem<int>(
                value: item.key + 1,
                child: Container(
                  color: item.value == value
                      ? selectedItemHighlightColor
                      : Colors.transparent,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: SFText(
                    keyText: '${item.value ?? ''}',
                    maxLines: 1,
                    style: TextStyles.lightWhite16,
                  ),
                ),
              ),
            )
            .toList(),
        itemValues: spinnerItems
            .asMap()
            .entries
            .map(
              (item) => DropdownItem<int>(
                value: item.key + 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SFText(
                    keyText: '${item.value ?? ' '}',
                    maxLines: 1,
                    style: TextStyles.lightWhite16,
                  ),
                ),
              ),
            )
            .toList(),
        listValue: spinnerItems,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SFText(
            keyText: '${value ?? ' '}',
            maxLines: 1,
            style: TextStyles.lightWhite16,
          ),
        ),
      ),
    );
  }
}

class CustomDropdown<T> extends StatefulWidget {
  /// the child widget for the button, this will be ignored if text is supplied
  final Widget child;

  /// onChange is called when the selected option is changed.;
  /// It will pass back the value and the index of the option.
  final void Function(T, int)? onChange;

  /// list of DropdownItems
  final List<DropdownItem<T>> items;
  final List<dynamic> listValue;
  final List<DropdownItem<T>> itemValues;
  final DropdownStyle dropdownStyle;

  /// dropdownButtonStyles passes styles to OutlineButton.styleFrom()
  final DropdownButtonStyle dropdownButtonStyle;

  /// dropdown button icon defaults to caret
  final Icon? icon;
  final bool hideIcon;

  /// if true the dropdown icon will as a leading icon, default to false
  final bool leadingIcon;

  const CustomDropdown({
    Key? key,
    this.hideIcon = false,
    required this.child,
    required this.items,
    required this.itemValues,
    this.dropdownStyle = const DropdownStyle(),
    this.dropdownButtonStyle = const DropdownButtonStyle(),
    this.icon,
    this.leadingIcon = false,
    this.onChange,
    required this.listValue,
  }) : super(key: key);

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>>
    with TickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;
  int _currentIndex = -1;
  AnimationController? _animationController;
  Animation<double>? _expandAnimation;
  Animation<double>? _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _expandAnimation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOut,
    );
    _rotateAnimation = Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var style = widget.dropdownButtonStyle;
    // link the overlay to the button
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: SizedBox(
          width: style.width,
          height: style.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment:
                  style.mainAxisAlignment ?? MainAxisAlignment.center,
              textDirection:
                  widget.leadingIcon ? TextDirection.rtl : TextDirection.ltr,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_currentIndex == -1) ...[
                  widget.child,
                ] else ...[
                  widget.itemValues[_currentIndex],
                ],
                const SizedBox(
                  width: 8,
                ),
                if (!widget.hideIcon)
                  RotationTransition(
                    turns: _rotateAnimation!,
                    child: widget.icon ?? const Icon(Icons.arrow_drop_down),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    // find the size and position of the current widget
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    var size = renderBox!.size;

    var offset = renderBox.localToGlobal(Offset.zero);
    var topOffset = offset.dy + size.height + 5;
    return OverlayEntry(
      // full screen GestureDetector to register when a
      // user has clicked away from the dropdown

      builder: (context) => GestureDetector(
        onTap: () => _toggleDropdown(close: true),
        behavior: HitTestBehavior.translucent,
        // full screen container to register taps anywhere and close drop down
        child: Material(
          elevation: 3,
          color: Colors.black.withOpacity(0.15),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  // left: offset.dx,
                  top: topOffset,
                  width: widget.dropdownStyle.width ?? size.width,
                  child: CompositedTransformFollower(
                    offset: widget.dropdownStyle.offset ??
                        Offset(0, size.height + 5),
                    link: _layerLink,
                    showWhenUnlinked: false,
                    child: Material(
                      elevation: widget.dropdownStyle.elevation ?? 0,
                      borderRadius: widget.dropdownStyle.borderRadius ??
                          BorderRadius.zero,
                      color: widget.dropdownStyle.color,
                      child: SizeTransition(
                        axisAlignment: 1,
                        sizeFactor: _expandAnimation!,
                        child: ConstrainedBox(
                          constraints: widget.dropdownStyle.constraints ??
                              BoxConstraints(
                                maxHeight: MediaQuery.of(context).size.height -
                                    topOffset -
                                    15,
                              ),
                          child: ListView(
                            padding:
                                widget.dropdownStyle.padding ?? EdgeInsets.zero,
                            shrinkWrap: true,
                            children: widget.items.asMap().entries.map((item) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    _currentIndex = item.key;
                                  });
                                  widget.onChange!(
                                      item.value.value as T, item.key);
                                  _toggleDropdown();
                                },
                                child: item.value,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _toggleDropdown({bool close = false}) async {
    if (_isOpen || close) {
      await _animationController?.reverse();
      _overlayEntry?.remove();
      setState(() {
        _isOpen = false;
      });
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context)?.insert(_overlayEntry!);
      setState(() => _isOpen = true);
      _animationController?.forward();
    }
  }
}

/// DropdownItem is just a wrapper for each child in the dropdown list.\n
/// It holds the value of the item.
class DropdownItem<T> extends StatelessWidget {
  final T? value;
  final Widget? child;

  const DropdownItem({Key? key, this.value, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child!;
  }
}

class DropdownButtonStyle {
  final MainAxisAlignment? mainAxisAlignment;
  final ShapeBorder? shape;
  final double? elevation;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;
  final double? width;
  final double? height;
  final Color? primaryColor;

  const DropdownButtonStyle({
    this.mainAxisAlignment,
    this.backgroundColor,
    this.primaryColor,
    this.constraints,
    this.height,
    this.width,
    this.elevation,
    this.padding,
    this.shape,
  });
}

class DropdownStyle {
  final BorderRadius? borderRadius;
  final double? elevation;
  final Color? color;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;

  /// position of the top left of the dropdown relative to the top left of the button
  final Offset? offset;

  ///button width must be set for this to take effect
  final double? width;

  const DropdownStyle({
    this.constraints,
    this.offset,
    this.width,
    this.elevation,
    this.color,
    this.padding,
    this.borderRadius,
  });
}
