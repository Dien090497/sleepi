import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/di/translations/keys.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BackgroundWidget(
      child: Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: SFAppBar(context: context,),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Center(
                child: Column(
                  children: [
                    SFButton(
                      text: Keys.howToPlay,
                      textStyle: TextStyles.w600WhiteSize16,
                      gradient: AppColors.gradientBlueButton,
                      onPressed: () {},
                      width: size.width * 0.45,
                      height: 48,
                    ),
                    const SizedBox(height: 24,),
                     SFButton(
                      text: Keys.whitePaper,
                      textStyle: TextStyles.bold16LightWhite,
                      color: AppColors.white.withOpacity(0.07),
                      width: size.width * 0.45,
                      height: 48,
                    ),
                    const SizedBox(height: 24,),
                    SFButton(
                      text: Keys.litePaper,
                      textStyle: TextStyles.bold16LightWhite,
                      color: AppColors.white.withOpacity(0.07),
                      width: size.width * 0.45,
                      height: 48,
                    ),
                    const SizedBox(height: 24,),
                    SFButton(
                      text: Keys.linkTree,
                      textStyle: TextStyles.bold16LightWhite,
                      color: AppColors.white.withOpacity(0.07),
                      width: size.width * 0.45,
                      height: 48,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
