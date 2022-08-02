import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/extensions/string_x.dart';

class OpenLuckyBoxAnimation extends StatefulWidget {
  const OpenLuckyBoxAnimation(
      {Key? key, required this.luckyBoxType, required this.isCompletedAnimation})
      : super(key: key);

  final String luckyBoxType;
  final Function(bool) isCompletedAnimation;

  @override
  State<OpenLuckyBoxAnimation> createState() => _OpenLuckyBoxAnimationState();
}

class _OpenLuckyBoxAnimationState extends State<OpenLuckyBoxAnimation> with TickerProviderStateMixin{
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

    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.luckyBoxType + "-----------------------------");
    return Column(
      children: [
        Lottie.asset(widget.luckyBoxType.luckyBoxAnimation(),
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
