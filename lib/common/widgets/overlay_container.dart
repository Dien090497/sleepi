import 'dart:async';

import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class OverlayContainer extends StatefulWidget {
  /// The child to render inside the container.
  final Widget? child;

  /// By default, the child will be rendered right below (if the parent is `Column`)
  /// the widget which is defined alongside the OverlayContainer.
  /// It would appear as though the Overlay is inside its parent
  /// but in reality it would be outside and above
  /// the original widget hierarchy.
  /// It's position can be altered and the overlay can
  /// be moved to any part of the screen by supplying a `position`
  /// argument.
  final OverlayContainerPosition position;

  /// Controlling whether the overlay is current showing or not.
  final bool show;

  /// Whether the overlay is wide as its enclosing parent.
  final bool asWideAsParent;

  /// `color` attribute for the `Material` component that wraps `child`.
  final Color materialColor;

  final String message;
  final double? height;
  final double? width;

  const OverlayContainer({
    Key? key,
    required this.show,
    this.height,
    this.width,
     this.child,
    required this.message,
    this.asWideAsParent = false,
    this.position = const OverlayContainerPosition(0, 0),
    this.materialColor = Colors.transparent,
  }) : super(key: key);

  @override
  _OverlayContainerState createState() => _OverlayContainerState();
}

class _OverlayContainerState extends State<OverlayContainer>
    with WidgetsBindingObserver {
  late OverlayEntry _overlayEntry;
  bool _opened = false;

  @override
  void initState() {
    super.initState();
    if (widget.show) {
      _show();
    }
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    // We would want to re render the overlay if any metrics
    // ever change.
    if (widget.show) {
      _show();
    } else {
      _hide();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // We would want to re render the overlay if any of the dependencies
    // ever change.
    if (widget.show) {
      _show();
    } else {
      _hide();
    }
  }

  @override
  void didUpdateWidget(OverlayContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.show) {
      _show();
    } else {
      _hide();
    }
  }

  @override
  void dispose() {
    if (widget.show) {
      _hide();
    }
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _show() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 280));
      if (_opened) {
        _overlayEntry.remove();
      }
      _overlayEntry = _buildOverlayEntry();
      if (!mounted) return;
      Overlay.of(context)?.insert(_overlayEntry);
      _opened = true;
    });
    // Timer(const Duration(seconds: 5), () {
    //   _hide();
    // });
  }

  void _hide() {
    if (_opened) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _overlayEntry.remove();
        _opened = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Listen to changes in media query such as when a device orientation changes
    // or when the keyboard is toggled.
    MediaQuery.of(context);
    return Container();
  }

  OverlayEntry _buildOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          left: offset.dx + widget.position.left,
          top: offset.dy - widget.position.bottom,
          width: widget.asWideAsParent ? size.width : null,
          child: Material(
            color: widget.materialColor,
            child: widget.child ?? Container(
              height: widget.height ?? 90,
              width: widget.width ?? 184,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: AppColors.darkColor1,
                borderRadius: BorderRadius.circular(2),
              ),
              child: SFText(
                keyText: widget.message,
                style: TextStyles.w400LightWhite12,),
            ),
          ),
        );
      },
    );
  }
}

/// Class to help position the overlay on the screen.
/// By default it will be rendered right below (if the parent is `Column`)
/// the widget which is alongside the OverlayContainer.
/// The Overlay can however be moved around by giving a left value
/// and a bottom value just like in the case of a `Positioned` widget.
/// The default values for `left` and `bottom` are 0 and 0 respectively.
class OverlayContainerPosition {
  final double left;
  final double bottom;

  const OverlayContainerPosition(this.left, this.bottom);
}