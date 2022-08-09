import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slee_fi/common/const/const.dart';

class MintingBrokenDialog extends StatefulWidget {
  const MintingBrokenDialog(
      {Key? key})
      : super(key: key);

  @override
  State<MintingBrokenDialog> createState() => _MintingBrokenDialogState();
}

class _MintingBrokenDialogState extends State<MintingBrokenDialog> with TickerProviderStateMixin{
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
            Lottie.asset(Const.bedBrokenAnimation,
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
