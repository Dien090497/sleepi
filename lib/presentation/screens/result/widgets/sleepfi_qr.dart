import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:slee_fi/common/widgets/sf_logo.dart';

class SleepFiQrCode extends StatelessWidget {
  const SleepFiQrCode({Key? key, required this.value}) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                color: Colors.white.withOpacity(0.05),
              ),
              child: Row(
                children: const [
                  SizedBox(
                    width: 22,
                  ),
                  SFLogo(),
                  Spacer(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Column(
              children: [
                ClipPath(
                  clipper: _TopClipper(20),
                  child: Container(
                    width: 20,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                    ),
                  ),
                ),
                CustomPaint(
                  foregroundPainter: DashedLinePainter(),
                  child: Container(
                    width: 20,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: _BottomClipper(20),
                  child: Container(
                    width: 20,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 24.0,
              right: 24,
              bottom: 24,
              left: 42,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              color: Colors.white.withOpacity(0.05),
            ),
            child: QrImage(
              data: value,
              version: QrVersions.auto,
              size: 52.0,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopClipper extends CustomClipper<Path> {
  final double space;

  _TopClipper(this.space);

  @override
  Path getClip(Size size) {
    final path = Path();
    final halfWidth = size.width / 2;
    final halfSpace = space / 2;
    final curve = space / 8;
    final height = halfSpace / 1;

    path.lineTo(halfWidth - halfSpace, 0);

    path.cubicTo(halfWidth - halfSpace, 0, halfWidth - halfSpace + curve,
        height, halfWidth, height);

    path.cubicTo(halfWidth, height, halfWidth + halfSpace - curve, height,
        halfWidth + halfSpace, 0);

    path.lineTo(size.width, 0);
    path.lineTo(size.width, height);
    path.lineTo(0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class _BottomClipper extends CustomClipper<Path> {
  final double space;

  _BottomClipper(this.space);

  @override
  Path getClip(Size size) {
    final path = Path();
    final halfWidth = size.width / 2;
    final halfSpace = space / 2;
    final curve = space / 6;
    final height = halfSpace / 1;

    path.lineTo(halfWidth - halfSpace, size.height);
    path.cubicTo(
        halfWidth - halfSpace,
        size.height,
        halfWidth - halfSpace + curve,
        size.height - height,
        halfWidth,
        size.height - height);

    path.cubicTo(halfWidth, size.height - height, halfWidth + halfSpace - curve,
        size.height - height, halfWidth + halfSpace, size.height);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height - height);
    path.lineTo(0, size.height - height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5, dashSpace = 5, startX = size.width / 2, startY = 0;
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..strokeWidth = 2;
    while (startY < size.height) {
      canvas.drawLine(
          Offset(startX, startY), Offset(startX, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
