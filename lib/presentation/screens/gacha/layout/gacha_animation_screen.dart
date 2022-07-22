import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/utils/random_utils.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/models/gacha_spin_response/gacha_attributes_item.dart';
import 'package:slee_fi/models/gacha_spin_response/gacha_spin_response.dart';
import 'package:slee_fi/presentation/screens/result/layout/all_result_screen.dart';
import 'package:slee_fi/resources/resources.dart';

import 'gacha_result_bed_screen.dart';

class GachaAnimationArguments {
  final GachaSpinResponse? spinInfo;
  final String? route;
  final String audio;
  final String animation;

  GachaAnimationArguments(
      {required this.spinInfo, required this.animation, required this.audio, this.route});
}

class GachaAnimationScreen extends StatefulWidget {
  const GachaAnimationScreen({Key? key}) : super(key: key);

  @override
  State<GachaAnimationScreen> createState() => _GachaAnimationScreenState();
}

class _GachaAnimationScreenState extends State<GachaAnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  final audioPlayer = AudioPlayer();
  GachaAttributesItem? attributesItem;
  final randomUtils = getIt<RandomUtils>();
  String image = '';
  bool isShowResult = false;
  bool isNavigatorResult = false;

  Future setAudio() async {
    final args =
        ModalRoute.of(context)?.settings.arguments as GachaAnimationArguments?;
    audioPlayer.setAsset(args?.audio ?? Const.normalGachaAudio);
    audioPlayer.setLoopMode(LoopMode.all);
    audioPlayer.setVolume(1);
    audioPlayer.play();
  }

  @override
  void initState() {
    super.initState();
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
            if(args.spinInfo!.gift.first['type'] == 'SLFT'){
              setState(() {
                isShowResult = true;
                image = Ics.icSlft;
              });
            }else{
              attributesItem = GachaAttributesItem.fromJson(args.spinInfo!.gift.first as Map<String, dynamic>);
              setState(() {
                isShowResult = true;
                isNavigatorResult = true;
                image = attributesItem != null ? attributesItem!.image : '';
              });
            }


            Future.delayed(const Duration(seconds: 3), () async {
              Navigator.pop(context);
              if(isNavigatorResult) {
                Navigator.pushNamed(context, R.gachaResultBed,
                  arguments: GachaResultBedArguments(
                      attributesItem: attributesItem, image: image));
              }
            });
          } else {
            List<String> images = [];
            Navigator.pop(context);
            for (var i = 0; i > args.spinInfo!.gift.length; i++) {
              images.add(randomUtils.gachaItem());
            }
            Navigator.pushNamed(context, R.allResult,
                arguments: GachaAllResultBedArguments(
                    gachaSpinInfo: args.spinInfo, images: images));
          }
        }else {
          Navigator.pushNamed(context, args!.route!);
        }
        animationController.reset();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    audioPlayer.stop();
    audioPlayer.dispose();
    super.dispose();
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
          isShowResult ?  Scaffold(
            backgroundColor: AppColors.transparent,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SFIcon(image, width: 50, height: 50,),
                  // isNavigatorResult ? Image.network(image) : SFIcon(image, width: 50, height: 50,),
                  const SizedBox(height: 12,),
                  if(isNavigatorResult == false) SFText(keyText: '${args?.spinInfo!.gift.first['amount']}', style: TextStyles.bold30White,),
                ],
              ),
            ),
          ) : const SizedBox(),
        ]
      ),
    );
  }
}
