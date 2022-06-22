import 'dart:core';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class ShowMoreTextPopup {
  late double _popupWidth;
  late double _popupHeight;
  late TextAlign _textAlign = TextAlign.left;
  bool _isDownArrow = false;
  bool _isLeftArrow = true;
  double arrowHeight = 10.0;

  bool _isVisible = false;

  late String _text;

  late OverlayEntry _entry;
  late Offset _offset;
  late Rect _showRect;

  late TextStyle _textStyle;

  VoidCallback? dismissCallback;

  late Size _screenSize;

  BuildContext context;
  late Color _backgroundColor;

  late BorderRadius _borderRadius;
  late EdgeInsetsGeometry _padding;

  ShowMoreTextPopup(this.context,
      {double? height,
      double? width,
      TextAlign? textAlign,
      VoidCallback? onDismiss,
      Color? backgroundColor,
      String? text,
      TextStyle? textStyle,
      bool? isDownArrow,
      bool? isLeftArrow,
      BorderRadius? borderRadius,
      EdgeInsetsGeometry? padding}) {
    dismissCallback = onDismiss;
    _popupHeight = height ?? 82;
    _popupWidth = width ?? 184;
    _text = text ?? '';
    _textAlign = textAlign ?? TextAlign.left;
    _isDownArrow = isDownArrow ?? false;
    _isLeftArrow = isLeftArrow ?? true;
    _textStyle = textStyle ?? TextStyles.w400LightWhite12;
    _backgroundColor = backgroundColor ?? AppColors.dark;
    _borderRadius = borderRadius ?? BorderRadius.circular(2);
    _padding = padding ?? const EdgeInsets.all(8.0);
  }

  /// Shows a popup near a widget with key [widgetKey] or [rect].
  void show({Rect? rect, GlobalKey? widgetKey}) {
    if (rect == null && widgetKey == null) {
      return;
    }

    _showRect = rect ?? _getWidgetGlobalRect(widgetKey!);
    _screenSize = window.physicalSize / window.devicePixelRatio;

    _calculatePosition(context);

    _entry = OverlayEntry(builder: (context) {
      return buildPopupLayout(_offset);
    });

    Overlay.of(context)!.insert(_entry);
    _isVisible = true;
  }

  void _calculatePosition(BuildContext context) {
    _offset = _calculateOffset(context);
  }

  /// Returns globalRect of widget with key [key]
  Rect _getWidgetGlobalRect(GlobalKey key) {
    RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset.zero);
    return Rect.fromLTWH(
        offset.dx, offset.dy, renderBox.size.width, renderBox.size.height);
  }

  /// Returns calculated widget offset using [context]
  Offset _calculateOffset(BuildContext context) {
    double dx = _showRect.left + _showRect.width / 2.0 - _popupWidth / 2.0;
    if (dx < 10.0) {
      dx = 10.0;
    }

    if (dx + _popupWidth > _screenSize.width && dx > 10.0) {
      double tempDx = _screenSize.width - _popupWidth - 10;
      if (tempDx > 10) dx = tempDx;
    }

    double dy = _showRect.top - _popupHeight;
    if (dy <= MediaQuery.of(context).padding.top + 10) {
      // not enough space above, show popup under the widget.
      dy = arrowHeight + _showRect.height + _showRect.top;
      // _isDownArrow = false;
    } else {
      dy -= arrowHeight;
      // _isDownArrow = true;
    }

    return Offset(dx, dy);
  }

  /// Builds Layout of popup for specific [offset]
  LayoutBuilder buildPopupLayout(Offset offset) {
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          dismiss();
        },
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: <Widget>[
              // triangle arrow
              Positioned(
                left: _isLeftArrow ? _showRect.right + 5 : _showRect.left,
                top: _offset.dy + _popupHeight + 30,
                child: CustomPaint(
                  size: Size(15.0, arrowHeight),
                  painter: TrianglePainter(
                      isDownArrow: _isDownArrow, color: _backgroundColor),
                ),
              ),
              // popup content
              Positioned(
                left: _offset.dx + _showRect.width / 2 - 16,
                top: _offset.dy + _popupHeight + 40,
                child: Container(
                    padding: _padding,
                    width: _popupWidth,
                    decoration: BoxDecoration(
                        color: _backgroundColor,
                        borderRadius: _borderRadius,
                        boxShadow: [
                          BoxShadow(
                            color: _backgroundColor,
                            blurRadius: 1.0,
                          ),
                        ]),
                    child: SingleChildScrollView(
                      child: SFText(
                        keyText: _text,
                        style: _textStyle,
                        textAlign: _textAlign,
                      ),
                    )),
              )
            ],
          ),
        ),
      );
    });
  }

  /// Dismisses the popup
  void dismiss() {
    if (!_isVisible) {
      return;
    }
    _entry.remove();
    _isVisible = false;
    dismissCallback?.call();
  }
}

/// [TrianglePainter] is custom painter for drawing a triangle for popup
/// to point specific widget
class TrianglePainter extends CustomPainter {
  bool isDownArrow;
  Color color;

  TrianglePainter({this.isDownArrow = true, required this.color});

  /// Draws the triangle of specific [size] on [canvas]
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    paint.strokeWidth = 2.0;
    paint.color = color;
    paint.style = PaintingStyle.fill;

    if (isDownArrow) {
      path.moveTo(0.0, -1.0);
      path.lineTo(size.width, -1.0);
      path.lineTo(size.width / 2.0, size.height);
    } else {
      path.moveTo(size.width / 2.0, 0.0);
      path.lineTo(0.0, size.height + 1);
      path.lineTo(size.width, size.height + 1);
    }

    canvas.drawPath(path, paint);
  }

  /// Specifies to redraw for [customPainter]
  @override
  bool shouldRepaint(CustomPainter customPainter) {
    return true;
  }
}
