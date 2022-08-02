import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UpgradeBrokenDialog extends StatefulWidget {
  const UpgradeBrokenDialog(
      {Key? key, required this.animation})
      : super(key: key);

  final String animation;

  @override
  State<UpgradeBrokenDialog> createState() => _UpgradeBrokenDialogState();
}

class _UpgradeBrokenDialogState extends State<UpgradeBrokenDialog> with TickerProviderStateMixin{
  late AnimationController animationController;
  bool loading = false;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this);
    animationController.addStatusListener((status) async {
      if (animationController.isCompleted) {
        animationController.reset();
      }
      if(animationController.isDismissed){
        animationController.forward();
      }

    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Lottie.asset(widget.animation,
              controller: animationController,
              // fit: BoxFit.cover,
              width: 238,
              height: 238,
              // repeat: false,
              onLoaded: (composition) {
                // Configure the AnimationController with the duration of the
                // Lottie file and start the animation.
                animationController..duration = composition.duration
                  ..forward();
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
