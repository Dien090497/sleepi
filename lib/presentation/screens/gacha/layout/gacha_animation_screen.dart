import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/utils/random_utils.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/models/gacha_spin_response/gacha_spin_response.dart';
import 'package:slee_fi/presentation/screens/result/layout/all_result_screen.dart';

import 'gacha_result_bed_screen.dart';

class GachaAnimationArguments {
  final GachaSpinResponse spinInfo;
  final String audio;
  final String animation;

  GachaAnimationArguments({required this.spinInfo, required this.animation, required this.audio});
}

class GachaAnimationScreen extends StatefulWidget {
  const GachaAnimationScreen({Key? key}) : super(key: key);

  @override
  State<GachaAnimationScreen> createState() => _GachaAnimationScreenState();
}

class _GachaAnimationScreenState extends State<GachaAnimationScreen> with TickerProviderStateMixin {
   late AnimationController animationController;
   final audioPlayer = AudioPlayer();
   final randomUtils = getIt<RandomUtils>();
   String image = '';
    bool isShowResult = false;

   Future setAudio() async{
     final args = ModalRoute.of(context)?.settings.arguments as GachaAnimationArguments?;
     audioPlayer.setReleaseMode(ReleaseMode.loop);
     audioPlayer.play(
       AssetSource(args?.audio ?? Const.normalGachaAudio),
     );
   }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setAudio();
    });

    animationController = AnimationController(
        vsync: this);
    animationController.addStatusListener((status) async{
      final args = ModalRoute.of(context)?.settings.arguments as GachaAnimationArguments?;
      if(status == AnimationStatus.completed){
        if(args != null ){
          if(args.spinInfo.gift.first.length == Const.one){
            setState((){
              isShowResult = true;
              image = randomUtils.gachaItem();
            });
            Future.delayed(const Duration(seconds: 3), () async {
              Navigator.pop(context);
              Navigator.pushNamed(context, R.gachaResultBed,
                  arguments: GachaResultBedArguments(gachaSpinInfo: args.spinInfo , image: image));
            });
          }else {
            List<String> images = [];
            Navigator.pop(context);
            for(var i = 0; i > args.spinInfo.gift.first.length; i++){
              images.add(randomUtils.gachaItem());
            }
            Navigator.pushNamed(context, R.allResult,
                arguments: GachaAllResultBedArguments(gachaSpinInfo: args.spinInfo , images: images));
          }

        }
        animationController.reset();
      }
    });
  }

  @override
  void dispose(){
    animationController.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as GachaAnimationArguments?;
    return Stack(
      children : [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Lottie.asset(args?.animation ?? Const.normalGachaAnimation,
            controller: animationController,
            fit: BoxFit.cover,
            onLoaded: (composition) {
              // Configure the AnimationController with the duration of the
              // Lottie file and start the animation.
              animationController
                ..duration = composition.duration
                ..forward();
            },
          ),
        ),
        isShowResult ?  Align(
          alignment: Alignment.center,
          child: SFIcon(image),
        ) : const SizedBox(),
      ] 
    );
  }
}
