import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slee_fi/common/extensions/string_x.dart';

class OpenBedBoxAnimation extends StatefulWidget {
  const OpenBedBoxAnimation(
      {Key? key, required this.bedBoxType, required this.isCompletedAnimation})
      : super(key: key);

  final String bedBoxType;
  final Function(bool) isCompletedAnimation;

  @override
  State<OpenBedBoxAnimation> createState() => _OpenBedBoxAnimationState();
}

class _OpenBedBoxAnimationState extends State<OpenBedBoxAnimation> with TickerProviderStateMixin{
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this);
    animationController.addStatusListener((status) async {
      if (animationController.isCompleted) {
        Navigator.pop(context, true);
        widget.isCompletedAnimation(true);
      }
      // if(animationController.isDismissed){
      //   animationController.forward();
      // }

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
        Lottie.asset(widget.bedBoxType.bedBoxAnimation(),
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
    );
  }
}
