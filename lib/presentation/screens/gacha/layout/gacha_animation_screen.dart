import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/utils/random_utils.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/models/gacha_spin_response/gacha_attributes_item.dart';
import 'package:slee_fi/models/gacha_spin_response/gacha_spin_response.dart';
import 'package:slee_fi/presentation/screens/gacha/layout/gacha_chane_500_screen.dart';
import 'package:slee_fi/presentation/screens/result/layout/all_result_screen.dart';
import 'package:slee_fi/resources/resources.dart';

import 'gacha_result_bed_screen.dart';

class GachaAnimationArguments {
  final GachaSpinResponse? spinInfo;
  final bool isGetSpin;
  final String audio;
  final String animation;

  GachaAnimationArguments(
      {required this.spinInfo, required this.animation, required this.audio, this.isGetSpin = false});
}

class GachaAnimationScreen extends StatefulWidget {
  const GachaAnimationScreen({Key? key}) : super(key: key);

  @override
  State<GachaAnimationScreen> createState() => _GachaAnimationScreenState();
}

class _GachaAnimationScreenState extends State<GachaAnimationScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController animationController;
  final audioPlayer = AudioPlayer();
  GachaAttributesItem? attributesItem;
  num? percentEffect;
  dynamic quantitySlft;
  final randomUtils = getIt<RandomUtils>();
  String image = '';
  bool isShowResult = false;

  Future setAudio() async {
    final args =
        ModalRoute.of(context)?.settings.arguments as GachaAnimationArguments?;
    audioPlayer.setAsset(args?.audio ?? Const.normalGachaAudio);
    // audioPlayer.setLoopMode(LoopMode.all);
    audioPlayer.setVolume(1);
    audioPlayer.play();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Future.delayed(Duration.zero, () {
      setAudio();
    });

    animationController = AnimationController(vsync: this);
    animationController.addStatusListener((status) async {
      final args = ModalRoute.of(context)?.settings.arguments
          as GachaAnimationArguments?;
      if (status == AnimationStatus.completed) {
        if (args != null && args.spinInfo != null) {
          if (args.spinInfo!.gift.length == Const.one) {
            if(args.spinInfo!.gift.first['type'] == 'slft'){
              setState(() {
                // isShowResult = true;
                image = Ics.icSlft;
                quantitySlft = args.spinInfo!.gift.first['amount'];
              });
            }else{
              attributesItem = GachaAttributesItem.fromJson(args.spinInfo!.gift.first as Map<String, dynamic>);
              percentEffect = args.spinInfo!.gift.first['${args.spinInfo!.gift.first['type']}'];
              setState(() {
                // isShowResult = true;
                image = attributesItem != null ? attributesItem!.image : '';
              });
            }

            Navigator.pop(context, true);
            Navigator.pushNamed(context, args.isGetSpin ? R.gacha500TimesChance : R.gachaResultBed,
                arguments: args.isGetSpin
                    ? GachaChance500Arguments(
                    attributesItem: attributesItem, image: image )
                    : GachaResultBedArguments(
                    attributesItem: attributesItem, image: image , quantitySlft : quantitySlft , percentEffect: percentEffect));

            // Future.delayed(const Duration(seconds: 0), () async {
            //   Navigator.pop(context, true);
            //   Navigator.pushNamed(context, args.isGetSpin ? R.gacha500TimesChance : R.gachaResultBed,
            //       arguments: args.isGetSpin
            //       ? GachaChance500Arguments(
            //           attributesItem: attributesItem, image: image )
            //       : GachaResultBedArguments(
            //           attributesItem: attributesItem, image: image , quantitySlft : quantitySlft , percentEffect: percentEffect));
            // });
          } else {
            Navigator.pop(context, true);
            Navigator.pushNamed(context, R.allResult,
                arguments: GachaAllResultBedArguments(
                    gachaSpinInfo: args.spinInfo));
          }
        }else {
         return;
        }
        animationController.reset();
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    audioPlayer.stop();
    animationController.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.inactive || state == AppLifecycleState.detached) return;
    if(state == AppLifecycleState.paused){
      audioPlayer.setVolume(0);
    }
    if(state == AppLifecycleState.resumed){
      audioPlayer.setVolume(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as GachaAnimationArguments?;
    return WillPopScope(
      onWillPop: () async => false,
      child: Stack(
          alignment: Alignment.center,
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
          // isShowResult ?  Scaffold(
          //   backgroundColor: AppColors.transparent,
          //   body: Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         SFIcon(image, width: 150, height: 150,),
          //       ],
          //     ),
          //   ),
          // ) : const SizedBox(),
        ]
      ),
    );
  }
}
