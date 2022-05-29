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
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipPath(
                clipper: _DefectClipper(24),
                child: Container(
                  width: 12,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                ),
                child: CustomPaint(
                  foregroundPainter: DashedLinePainter(),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width -56,
                    height: 1,
                  ),
                ),
              ),
              RotationTransition(
                turns: const AlwaysStoppedAnimation(0.5),
                child: ClipPath(
                  clipper: _DefectClipper(24),
                  child: Container(
                    width: 12,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 4,
              bottom: 20,
              left: 18,
              right: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              color: Colors.white.withOpacity(0.05),
            ),
            child: Row(
              children: [
                const SFLogo(),
                const Spacer(),
                QrImage(
                  data: value,
                  version: QrVersions.auto,
                  size: 52.0,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class _DefectClipper extends CustomClipper<Path> {
  final double space;

  _DefectClipper(this.space);

  @override
  Path getClip(Size size) {
    final path = Path();
    final halfSpace = space / 2;
    final curve = space /10;

    path.lineTo(0, 0);
    path.cubicTo(
        0,
        0,
        halfSpace,
        curve,
        halfSpace,
        halfSpace);

    path.cubicTo(halfSpace, halfSpace, halfSpace,
        space - curve, 0, space);

    path.lineTo(halfSpace, space);
    path.lineTo(halfSpace, halfSpace);
    path.lineTo(halfSpace, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5, dashSpace = 5, startX = 0, startY = 0;
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(
          Offset(startX, startY), Offset(startX + dashWidth, startY), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
