import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_drop_down.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
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
                  Row(
                    children: [
                      SizedBox(
                          width: size.width / 3,
                          height: 48,
                          child: SFDropDown(
                              value: "Other",
                              dropdownItems: [
                                DropdownMenuItem(
                                  value: 'Other',
                                  child: SFText(
                                    keyText: 'Other',
                                    style: TextStyles.white16,
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'Other1',
                                  child: SFText(
                                    keyText: 'Other',
                                    style: TextStyles.white16,
                                  ),
                                ),
                              ]
                          )
                      ),
                      const SizedBox(width: 10),
                       Expanded(
                          child:  SizedBox(
                            height: 48,
                            child: SFDropDown(
                                value: "Other",
                                dropdownItems: [
                                  DropdownMenuItem(
                                    value: 'Other',
                                    child: SFText(
                                      keyText: 'Other',
                                      style: TextStyles.white16,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Other1',
                                    child: SFText(
                                      keyText: 'Other',
                                      style: TextStyles.white16,
                                    ),
                                  ),
                                ]
                            ),
                          )
                      ),
                    ],
                  ),
                   const Expanded(
                       child: SFTextField(
                         maxLine: 12,
                         maxLength: 100,
                         hintText: Keys.hintFeedback,
                         hintStyle: TextStyles.lightGrey16,
                       ),
                   ),

                  // const Spacer(),
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
