import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/di/translations/keys.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BackgroundWidget(
      child: Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: SFAppBar(
              context: context,
              title: Keys.feedback,
              textStyle: TextStyles.bold18LightWhite),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width / 3,
                          child: const SFTextField(),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(child: SFTextField()),
                      ],
                    ),
                  ),
                  const SFTextField(
                    maxLine: 8,
                    maxLength: 100,
                    hintText:
                        Keys.hintFeedback,
                    hintStyle: TextStyles.lightGrey16,
                  ),
                  const Spacer(),
                  const Expanded(child: SFTextField()),

                  SFButton(
                    text: Keys.submit,
                    width: size.width,
                    color: AppColors.blue,
                    textStyle: TextStyles.w600WhiteSize16,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
