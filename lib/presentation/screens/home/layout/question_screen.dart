import 'package:flutter/material.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int indexSelect = -1;

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
                  color: AppColors.white.withOpacity(0.07),
                  gradient:
                      indexSelect != 0 ? null : AppColors.gradientBlueButton,
                  onPressed: () => _launchUrl(Const.howToPlayUrl, 0),
                  width: size.width * 0.45,
                  height: 48,
                ),
                const SizedBox(height: 24),
                SFButton(
                  gradient:
                      indexSelect != 1 ? null : AppColors.gradientBlueButton,
                  text: LocaleKeys.whitepaper,
                  textStyle: TextStyles.bold16LightWhite,
                  color: AppColors.white.withOpacity(0.07),
                  onPressed: () => _launchUrl(Const.whitePaperEn, 1),
                  width: size.width * 0.45,
                  height: 48,
                ),
                const SizedBox(height: 24),
                SFButton(
                  gradient:
                      indexSelect != 2 ? null : AppColors.gradientBlueButton,
                  text: LocaleKeys.litepaper,
                  textStyle: TextStyles.bold16LightWhite,
                  color: AppColors.white.withOpacity(0.07),
                  width: size.width * 0.45,
                  onPressed: () => _launchUrl(Const.litePaperUrl, 2),
                  height: 48,
                ),
                const SizedBox(height: 24),
                SFButton(
                  gradient:
                      indexSelect != 3 ? null : AppColors.gradientBlueButton,
                  text: LocaleKeys.linktree,
                  textStyle: TextStyles.bold16LightWhite,
                  color: AppColors.white.withOpacity(0.07),
                  onPressed: () => _launchUrl(Const.linkTreeUrl, 3),
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

  _launchUrl(String url, int index) async {
    setState(() => indexSelect = index);
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }
}
