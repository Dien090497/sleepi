// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_if_null_operators, unnecessary_this, avoid_print, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names

library cool_dropdown;

import 'package:cool_dropdown/drop_down_body.dart';
import 'package:cool_dropdown/utils/animation_util.dart';
import 'package:cool_dropdown/utils/extension_util.dart';
import 'package:flutter/material.dart';

class CoolDropdown extends StatefulWidget {
  final List dropdownList;
  final Function onChange;
  final Function? onOpen;
  final String placeholder;
  late Map defaultValue;
  final bool isTriangle;
  final bool isAnimation;
  final bool isResultIconLabel;
  final bool isResultLabel;
  final bool isDropdownLabel; // late
  final bool resultIconRotation;
  late Widget resultIcon;
  final double resultIconRotationValue;

  // size
  final double resultWidth;
  final double resultHeight;
  final double? dropdownWidth; // late
  final double dropdownHeight; // late
  final double dropdownItemHeight;
  final double triangleWidth;
  final double triangleHeight;
  final double iconSize;

  // align
  final Alignment resultAlign;
  final String dropdownAlign; // late
  final Alignment dropdownItemAlign;
  final String triangleAlign;
  final double triangleLeft;
  final bool dropdownItemReverse;
  final bool resultReverse;
  final MainAxisAlignment resultMainAxis;
  final MainAxisAlignment dropdownItemMainAxis;

  // padding
  final EdgeInsets resultPadding;
  final EdgeInsets dropdownItemPadding;
  final EdgeInsets dropdownPadding; // late
  final EdgeInsets selectedItemPadding;
  final GlobalKey? globalKey;

  // style
  late BoxDecoration resultBD;
  late BoxDecoration dropdownBD; // late
  late BoxDecoration selectedItemBD;
  late TextStyle selectedItemTS;
  late TextStyle unselectedItemTS;
  late TextStyle resultTS;
  late TextStyle placeholderTS;

  // gap
  final double gap;
  final double labelIconGap;
  final double dropdownItemGap;
  final double dropdownItemTopGap;
  final double dropdownItemBottomGap;
  final double resultIconLeftGap;

  CoolDropdown({
    Key? key,
    required this.dropdownList,
    required this.onChange,
    this.onOpen,
    resultIcon,
    placeholderTS,
    this.dropdownItemReverse = false,
    this.resultReverse = false,
    this.resultIconRotation = true,
    this.isTriangle = true,
    this.isResultLabel = true,
    this.placeholder = '',
    this.resultWidth = 220,
    this.resultHeight = 50,
    this.dropdownWidth,
    this.dropdownHeight = 300,
    this.dropdownItemHeight = 50,
    this.resultAlign = Alignment.centerLeft,
    this.dropdownAlign = 'center',
    this.triangleAlign = 'center',
    this.dropdownItemAlign = Alignment.centerLeft,
    this.dropdownItemMainAxis = MainAxisAlignment.spaceBetween,
    this.resultMainAxis = MainAxisAlignment.spaceBetween,
    this.resultPadding = const EdgeInsets.only(left: 10, right: 10),
    this.dropdownItemPadding = const EdgeInsets.only(left: 10, right: 10),
    this.dropdownPadding = const EdgeInsets.only(left: 10, right: 10),
    this.selectedItemPadding = const EdgeInsets.only(left: 10, right: 10),
    resultBD,
    dropdownBD,
    selectedItemBD,
    selectedItemTS,
    unselectedItemTS,
    resultTS,
    this.labelIconGap = 10,
    this.dropdownItemGap = 5,
    this.dropdownItemTopGap = 10,
    this.dropdownItemBottomGap = 10,
    this.resultIconLeftGap = 10,
    this.gap = 30,
    this.triangleWidth = 20,
    this.triangleHeight = 20,
    this.triangleLeft = 0,
    this.isAnimation = true,
    this.isResultIconLabel = true,
    this.resultIconRotationValue = 0.5,
    this.isDropdownLabel = true,
    this.iconSize = 10,
    defaultValue,
    this.globalKey,
  }) : super(key: key) {
    // ????????? ??????
    if (defaultValue != null) {
      this.defaultValue = defaultValue;
    } else {
      this.defaultValue = {};
    }
    // label unique ??????
    for (int i = 0; i < dropdownList.length; i++) {
      if (dropdownList[i]['label'] == null) {
        // throw '"label" must be initialized.';
      }
      for (int j = 0; j < dropdownList.length; j++) {
        if (i != j) {
          if (dropdownList[i]['label'] == dropdownList[j]['label']) {
            // throw 'label is duplicated. Labels have to be unique.';
          }
        }
      }
    }
    // box decoration ??????
    this.resultBD = resultBD ??
        BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        );
    this.dropdownBD = dropdownBD ??
        BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 1),
            ),
          ],
        );
    this.selectedItemBD = selectedItemBD ??
        BoxDecoration(
          color: const Color(0XFFEFFAF0),
          borderRadius: BorderRadius.circular(10),
        );
    // text style ??????
    this.selectedItemTS = selectedItemTS ??
        const TextStyle(color: Color(0xFF6FCC76), fontSize: 20);
    this.unselectedItemTS = unselectedItemTS ??
        const TextStyle(
          fontSize: 20,
          color: Colors.black,
        );
    this.resultTS = resultTS ??
        const TextStyle(
          fontSize: 20,
          color: Colors.black,
        );
    this.placeholderTS = placeholderTS ??
        TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 20);
    // Icon Container ??????
    this.resultIcon = resultIcon ??
        SizedBox(
          width: iconSize,
          height: iconSize,
          child: CustomPaint(
            size: Size(iconSize * 0.01, (iconSize * 0.01 * 1).toDouble()),
            painter: DropdownArrow(),
          ),
        );
  }

  @override
  CoolDropdownState createState() => CoolDropdownState();
}

class CoolDropdownState extends State<CoolDropdown>
    with TickerProviderStateMixin {
  GlobalKey<DropdownBodyState> dropdownBodyChild = GlobalKey();
  GlobalKey inputKey = GlobalKey();
  Offset triangleOffset = const Offset(0, 0);
  late OverlayEntry _overlayEntry;
  late Map selectedItem;
  late AnimationController rotationController;
  late AnimationController sizeController;
  late Animation<double> textWidth;
  AnimationUtil au = AnimationUtil();
  late bool isOpen = false;

  void openDropdown() {
    isOpen = true;
    if (widget.onOpen != null) {
      widget.onOpen!(isOpen);
    }
    _overlayEntry = _createOverlayEntry();
    Overlay.of(inputKey.currentContext!)!.insert(_overlayEntry);
    rotationController.forward();
  }

  void closeDropdown() {
    isOpen = false;
    if (widget.onOpen != null) {
      widget.onOpen!(isOpen);
    }
    _overlayEntry.remove();
    rotationController.reverse();
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (BuildContext context) => DropdownBody(
        key: dropdownBodyChild,
        inputKey: inputKey,
        onChange: widget.onChange,
        dropdownList: widget.dropdownList,
        dropdownItemReverse: widget.dropdownItemReverse,
        isTriangle: widget.isTriangle,
        resultWidth: widget.resultWidth,
        resultHeight: widget.resultHeight,
        dropdownWidth: widget.dropdownWidth,
        dropdownHeight: widget.dropdownHeight,
        dropdownItemHeight: widget.dropdownItemHeight,
        resultAlign: widget.resultAlign,
        dropdownAlign: widget.dropdownAlign,
        triangleAlign: widget.triangleAlign,
        dropdownItemAlign: widget.dropdownItemAlign,
        dropdownItemPadding: widget.dropdownItemPadding,
        dropdownPadding: widget.dropdownPadding,
        selectedItemPadding: widget.selectedItemPadding,
        resultBD: widget.resultBD,
        dropdownBD: widget.dropdownBD,
        selectedItemBD: widget.selectedItemBD,
        selectedItemTS: widget.selectedItemTS,
        unselectedItemTS: widget.unselectedItemTS,
        dropdownItemGap: widget.dropdownItemGap,
        dropdownItemTopGap: widget.dropdownItemTopGap,
        dropdownItemBottomGap: widget.dropdownItemBottomGap,
        gap: widget.gap,
        labelIconGap: widget.labelIconGap,
        triangleWidth: widget.triangleWidth,
        triangleHeight: widget.triangleHeight,
        triangleLeft: widget.triangleLeft,
        isResultLabel: widget.isResultLabel,
        closeDropdown: () {
          closeDropdown();
        },
        getSelectedItem: (selectedItem) async {
          sizeController = AnimationController(
            vsync: this,
            duration: au.isAnimation(
                status: widget.isAnimation,
                duration: const Duration(milliseconds: 150)),
          );
          textWidth = CurvedAnimation(
            parent: sizeController,
            curve: Curves.fastOutSlowIn,
          );
          setState(() {
            this.selectedItem = selectedItem;
          });
          await sizeController.forward();
        },
        selectedItem: selectedItem,
        isAnimation: widget.isAnimation,
        dropdownItemMainAxis: widget.dropdownItemMainAxis,
        bodyContext: context,
        isDropdownLabel: widget.isDropdownLabel,
      ),
    );
  }

  void changeSelectedItem() {
    setState(() {
      selectedItem = widget.defaultValue;
    });
  }

  @override
  void initState() {
    rotationController = AnimationController(
        duration: au.isAnimation(
            status: widget.isAnimation,
            duration: const Duration(milliseconds: 150)),
        vsync: this);
    sizeController = AnimationController(
        vsync: this,
        duration: au.isAnimation(
            status: widget.isAnimation,
            duration: const Duration(milliseconds: 150)));
    textWidth = CurvedAnimation(
      parent: sizeController,
      curve: Curves.fastOutSlowIn,
    );
    // placeholder ??????
    _setDefaultValue();
    super.initState();
  }

  void _setDefaultValue() {
    setState(() {
      sizeController = AnimationController(
        vsync: this,
        duration: au.isAnimation(status: false),
      );
      textWidth = CurvedAnimation(
        parent: sizeController,
        curve: Curves.fastOutSlowIn,
      );
      selectedItem = widget.defaultValue;
      sizeController.forward();
    });
  }

  RotationTransition rotationIcon() {
    return RotationTransition(
        turns: Tween(begin: 0.0, end: widget.resultIconRotationValue).animate(
            CurvedAnimation(parent: rotationController, curve: Curves.easeIn)),
        child: widget.resultIcon);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isOpen) {
          await dropdownBodyChild.currentState!.animationReverse();
          closeDropdown();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: GestureDetector(
        onTap: () {
          openDropdown();
        },
        child: Stack(
          children: [
            Container(
              key: inputKey,
              width: widget.resultWidth,
              height: widget.resultHeight,
              padding: widget.resultPadding,
              decoration: widget.resultBD,
              child: Align(
                alignment: widget.resultAlign,
                child: widget.isResultIconLabel
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        verticalDirection: VerticalDirection.down,
                        children: [
                          Expanded(
                            child: SizeTransition(
                              sizeFactor: textWidth,
                              axisAlignment: -1,
                              child: Row(
                                mainAxisAlignment: widget.resultMainAxis,
                                children: [
                                  if (widget.isResultLabel)
                                    Flexible(
                                      child: Text(
                                        selectedItem['label'] ??
                                            widget.placeholder,
                                        overflow: TextOverflow.ellipsis,
                                        style: selectedItem['label'] != null
                                            ? widget.resultTS
                                            : widget.placeholderTS,
                                      ),
                                    ),
                                  if (widget.isResultLabel)
                                    SizedBox(
                                      width: widget.labelIconGap,
                                    ),
                                  if (selectedItem['icon'] != null)
                                    selectedItem['icon'] as Widget,
                                ].isReverse(widget.dropdownItemReverse),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: widget.resultIconLeftGap,
                          ),
                          widget.resultIconRotation
                              ? rotationIcon()
                              : widget.resultIcon
                        ].isReverse(widget.resultReverse),
                      )
                    : rotationIcon(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class DropdownArrow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4178592, size.height * 0.7748810);
    path_0.cubicTo(
        size.width * 0.4404533,
        size.height * 0.7974752,
        size.width * 0.4702912,
        size.height * 0.8087602,
        size.width * 0.5001371,
        size.height * 0.8087602);
    path_0.cubicTo(
        size.width * 0.5299831,
        size.height * 0.8087602,
        size.width * 0.5598290,
        size.height * 0.7974752,
        size.width * 0.5824151,
        size.height * 0.7748810);
    path_0.lineTo(size.width * 0.9639590, size.height * 0.3933371);
    path_0.cubicTo(
        size.width * 1.008325,
        size.height * 0.3489715,
        size.width * 1.013173,
        size.height * 0.2755667,
        size.width * 0.9704122,
        size.height * 0.2295878);
    path_0.cubicTo(
        size.width * 0.9252400,
        size.height * 0.1803824,
        size.width * 0.8486085,
        size.height * 0.1787691,
        size.width * 0.8018311,
        size.height * 0.2255546);
    path_0.lineTo(size.width * 0.5566105, size.height * 0.4699685);
    path_0.cubicTo(
        size.width * 0.5251593,
        size.height * 0.5014278,
        size.width * 0.4743325,
        size.height * 0.5014278,
        size.width * 0.4428733,
        size.height * 0.4699685);
    path_0.lineTo(size.width * 0.1984593, size.height * 0.2255546);
    path_0.cubicTo(
        size.width * 0.1516657,
        size.height * 0.1787691,
        size.width * 0.07503428,
        size.height * 0.1795757,
        size.width * 0.02987013,
        size.height * 0.2295878);
    path_0.cubicTo(
        size.width * -0.01288215,
        size.height * 0.2755667,
        size.width * -0.008848915,
        size.height * 0.3489715,
        size.width * 0.03632330,
        size.height * 0.3933371);
    path_0.lineTo(size.width * 0.4178592, size.height * 0.7748810);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.grey.withOpacity(0.7);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
