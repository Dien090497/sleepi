import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/show_more_text_group.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class PopupInfoSpending extends StatefulWidget {
  const PopupInfoSpending({Key? key}) : super(key: key);

  @override
  State<PopupInfoSpending> createState() => _PopupInfoSpendingState();
}

class _PopupInfoSpendingState extends State<PopupInfoSpending> {
  GlobalKey key = GlobalKey();

  void _toggleDropdown() {
    showMoreText(LocaleKeys.displays_message_from_spending_detail);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleDropdown,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Row(
              children: [
                SFText(
                  keyText: LocaleKeys.spending_account,
                  style: TextStyles.blue12,
                  key: key,
                ),
                const SizedBox(
                  width: 5,
                ),
                const SFIcon(Ics.icQuestion),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showMoreText(String text) {
    ShowMoreTextPopup popup = ShowMoreTextPopup(
      context,
      text: text,
      width: 200,
      height: 102,
      textStyle: TextStyles.w400LightWhite12,
      backgroundColor: AppColors.darkColor1,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      borderRadius: BorderRadius.circular(2),
    );

    /// show the popup for specific widget
    popup.show(
      widgetKey: key,
    );
  }
}
