import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/cached_image.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/minting/nft_attribute_minting.dart';

class PopUpMintSuccess extends StatefulWidget {
  const PopUpMintSuccess(
      {Key? key, required this.nftAttributeMinting})
      : super(key: key);

  final NftAttributeMinting? nftAttributeMinting;

  @override
  State<PopUpMintSuccess> createState() => _PopUpMintSuccessState();
}

class _PopUpMintSuccessState extends State<PopUpMintSuccess> with TickerProviderStateMixin{
  late AnimationController animationController;
  bool loading = false;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this);
    animationController.addStatusListener((status) async {
      if (animationController.isCompleted) {
        animationController.reverse();
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
          alignment: Alignment.center,
          children: [
            Lottie.asset(Const.successAnimation,
              controller: animationController,
              fit: BoxFit.cover,
              // width: 238,
              // height: 238,
              // repeat: false,
              onLoaded: (composition) {
                // Configure the AnimationController with the duration of the
                // Lottie file and start the animation.
                animationController..duration = composition.duration
                  ..forward();
              },
            ),
            CachedImage(
              image: widget.nftAttributeMinting != null ? widget.nftAttributeMinting!.image : '',
              width: 150,
              height: 150,
            ),
          ],
        ),
        const SizedBox(height: 20),
        SFText(
          keyText:
          widget.nftAttributeMinting != null ? widget.nftAttributeMinting!.quality.reCase(StringCase.titleCase) : '',
          style: TextStyles.white1w700size16,
        ),
        const SizedBox(height: 24),
        Container(
          decoration: BoxDecoration(
            color: AppColors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.all(8),
          child: SFText(
            keyText: widget.nftAttributeMinting != null ? widget.nftAttributeMinting!.name : '',
            style: TextStyles.blue14,
          ),
        ),
         SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        SFButton(
          text: LocaleKeys.click_to_collect,
          width: double.infinity,
          textStyle: TextStyles.bold14LightWhite,
          color: AppColors.blue,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
