import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/show_more_text_group.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class PopupInfoStaking extends StatefulWidget {
  const PopupInfoStaking({Key? key}) : super(key: key);

  @override
  State<PopupInfoStaking> createState() => _PopupInfoStakingState();
}

class _PopupInfoStakingState extends State<PopupInfoStaking> {
  GlobalKey key = GlobalKey();

  void _toggleDropdown() {
    showMoreText(LocaleKeys.staking_not_only_allows_you_to_increase_your_tokens);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _toggleDropdown,
          child: SFIcon(
            Ics.icQuestion,
            color: AppColors.lightGrey,
            width: 18,
            key: key,
          ),
        ),
      ],
    );
  }
  void showMoreText(String text) {
    ShowMoreTextPopup popup = ShowMoreTextPopup(
      context,
      text: text,
      width: 200,
      height: 138,
      textStyle: TextStyles.w400LightWhite12,
      backgroundColor: AppColors.darkColor1,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      borderRadius: BorderRadius.circular(2),
      isLeftArrow: false,
    );

    /// show the popup for specific widget
    popup.show(
      widgetKey: key,
    );
  }
}
