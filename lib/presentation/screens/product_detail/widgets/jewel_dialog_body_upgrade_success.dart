import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class JewelDialogBodyUpgradeSuccess extends StatefulWidget {
  const JewelDialogBodyUpgradeSuccess(
      {Key? key, required this.jewel, required this.isJewel})
      : super(key: key);

  final BedEntity jewel;
  final bool isJewel;

  @override
  State<JewelDialogBodyUpgradeSuccess> createState() => _JewelDialogBodyUpgradeSuccessState();
}

class _JewelDialogBodyUpgradeSuccessState extends State<JewelDialogBodyUpgradeSuccess> with TickerProviderStateMixin{
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
    final qualityColor = widget.jewel.quality?.qualityBedColor ?? AppColors.commonBed;
    return Column(
      children: [
        Stack(
          children: [
            Lottie.asset('assets/json/success.json',
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
        SFText(
          keyText:
          '${widget.jewel.jewelType?.tr() ?? widget.jewel.itemType?.tr() ?? ''} ${widget.isJewel ? LocaleKeys.jewel.tr() : LocaleKeys.item.tr()} (Lv.${widget.jewel.level})',
          style: TextStyles.white1w700size16,
        ),
        const SizedBox(height: 24),
        Container(
          decoration: BoxDecoration(
            color: qualityColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.all(8),
          child: SFText(
            keyText: widget.jewel.nftId.toString(),
            style: TextStyles.blue14.copyWith(color: qualityColor),
          ),
        ),
        const SizedBox(height: 32),
        SFText(
          keyText: widget.jewel.type,
          style: TextStyles.blue16,
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 8),
        SFText(
          keyText: '+${widget.jewel.percentEffect??0}%',
          style: TextStyles.blue16,
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 24),
        // SizedBox(
        //     width: MediaQuery.of(context).size.width / 2.5,
        //     child: SFButton(
        //       text: LocaleKeys.ok,
        //       onPressed: () => Navigator.pop(context),
        //       textStyle: TextStyles.white16,
        //       gradient: AppColors.blueGradient,
        //       width: double.infinity,
        //     )
        // ),
      ],
    );
  }
}
