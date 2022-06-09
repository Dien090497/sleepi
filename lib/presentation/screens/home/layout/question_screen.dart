import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BackgroundWidget(
      appBar: SFAppBar(
        context: context,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Center(
            child: Column(
              children: [
                SFButton(
                  text: LocaleKeys.how_to_play,
                  textStyle: TextStyles.w600WhiteSize16,
                  gradient: AppColors.gradientBlueButton,
                  onPressed: () {},
                  width: size.width * 0.45,
                  height: 48,
                ),
                const SizedBox(
                  height: 24,
                ),
                SFButton(
                  text: LocaleKeys.white_paper,
                  textStyle: TextStyles.bold16LightWhite,
                  color: AppColors.white.withOpacity(0.07),
                  width: size.width * 0.45,
                  height: 48,
                ),
                const SizedBox(
                  height: 24,
                ),
                SFButton(
                  text: LocaleKeys.lite_paper,
                  textStyle: TextStyles.bold16LightWhite,
                  color: AppColors.white.withOpacity(0.07),
                  width: size.width * 0.45,
                  height: 48,
                ),
                const SizedBox(
                  height: 24,
                ),
                SFButton(
                  text: LocaleKeys.link_tree,
                  textStyle: TextStyles.bold16LightWhite,
                  color: AppColors.white.withOpacity(0.07),
                  width: size.width * 0.45,
                  height: 48,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
