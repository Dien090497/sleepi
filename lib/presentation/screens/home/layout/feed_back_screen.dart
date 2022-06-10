import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dropdown_rotation.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  bool isDisabled = true;
  int indexTopic = 2;
  int indexSubTopic = 6;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DismissKeyboardWidget(
      child: BackgroundWidget(
        resizeToAvoidBottomInset: false,
        appBar: SFAppBar(
            context: context,
            title: LocaleKeys.feedback,
            centerTitle: true,
            textStyle: TextStyles.bold18LightWhite),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: size.width / 2.8,
                        height: 48,
                        child: SFDropDownRotation<String>(
                          value: topics[indexTopic],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          dropdownWidth: size.width / 2.8,
                          selectedItemHighlightColor: AppColors.lightDark,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 24,
                          ),
                          spinnerItems: topics,
                          onChange: (int value, int index) {
                            setState(() {
                              indexTopic = index;
                            });
                          },
                        )),
                    const SizedBox(width: 10),
                    Expanded(
                        child: SizedBox(
                      height: 48,
                      child: SFDropDownRotation<String>(
                        value: subTopics[indexSubTopic],
                        dropdownWidth: size.width * 0.55,
                        dropdownHeight: size.width * 0.75,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        selectedItemHighlightColor: AppColors.lightDark,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 24,
                        ),
                        spinnerItems: subTopics,
                        onChange: (int value, int index) {
                          setState(() {
                            indexSubTopic = index;
                          });
                        },
                      ),
                    )),
                  ],
                ),
                SFTextField(
                  maxLine: 15,
                  maxLength: 100,
                  hintText: LocaleKeys.hint_feedback,
                  hintStyle: TextStyles.lightGrey16,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        isDisabled = false;
                      });
                    } else {
                      setState(() {
                        isDisabled = true;
                      });
                    }
                  },
                ),
                const Spacer(),
                SFButton(
                  text: LocaleKeys.submit,
                  width: size.width,
                  gradient: AppColors.gradientBlueButton,
                  textStyle: TextStyles.w600WhiteSize16,
                  disabled: isDisabled,
                ),
                const SizedBox(
                  height: 24,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> topics = [
  LocaleKeys.suggestion,
  LocaleKeys.bug,
  LocaleKeys.other_
];
List<String> subTopics = [
  LocaleKeys.running_gps,
  LocaleKeys.marketplace,
  LocaleKeys.wallet,
  LocaleKeys.nft,
  LocaleKeys.display,
  LocaleKeys.earning,
  LocaleKeys.others
];
