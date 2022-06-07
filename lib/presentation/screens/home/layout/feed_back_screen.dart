import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_drop_down.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<String> topics = [LocaleKeys.suggestion, LocaleKeys.bug, LocaleKeys.other_];
    List<String> subTopics = [LocaleKeys.running_gps, LocaleKeys.marketplace, LocaleKeys.wallet, LocaleKeys.nft, LocaleKeys.display, LocaleKeys.earning, LocaleKeys.other_];
    List<DropdownMenuItem<String>> topicItems = List.generate(topics.length, (index) => DropdownMenuItem(
      value: topics[index],
      child: SFText(
        keyText: topics[index],
        style: TextStyles.white16,
      ),
    ),
    );
    List<DropdownMenuItem<String>> subTopicItems = List.generate(subTopics.length, (index) => DropdownMenuItem(
      value: subTopics[index],
      child: SFText(
        keyText: subTopics[index],
        style: TextStyles.white16,
      ),
    ),
    );
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
                        width: size.width / 3,
                        height: 48,
                        child: SFDropDown(
                            value: topics[2],
                            dropdownWidth: size.width / 3,
                            icon: const Icon(Icons.keyboard_arrow_down, size: 24,),
                            dropdownItems:  topicItems)),
                    const SizedBox(width: 10),
                    Expanded(
                        child: SizedBox(
                          child: SFDropDown(
                              value: subTopics[6],
                              dropdownWidth: size.width * 0.55,
                              dropdownHeight: size.width * 0.75,
                              icon: const Icon(Icons.keyboard_arrow_down, size: 24,),
                              dropdownItems: subTopicItems),
                        )),
                  ],
                ),
                const SFTextField(
                  maxLine: 15,
                  maxLength: 100,
                  hintText: LocaleKeys.hint_feedback,
                  hintStyle: TextStyles.lightGrey16,
                ),
                const Spacer(),
                SFButton(
                  text: LocaleKeys.submit,
                  width: size.width,
                  gradient: AppColors.gradientBlueButton,
                  textStyle: TextStyles.w600WhiteSize16,
                ),
                const SizedBox(height: 24,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}