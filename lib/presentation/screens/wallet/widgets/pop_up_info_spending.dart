import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/overlay_container.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class PopupInfoSpending extends StatefulWidget {
  const PopupInfoSpending({Key? key}) : super(key: key);

  @override
  State<PopupInfoSpending> createState() => _PopupInfoSpendingState();
}

class _PopupInfoSpendingState extends State<PopupInfoSpending> {
  bool _dropdownShown = false;

  void _toggleDropdown() {
    setState(() {
      _dropdownShown = !_dropdownShown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: _toggleDropdown,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Row(
              children: [
                SFText(
                    keyText: LocaleKeys.spending_account, style: TextStyles.blue12),
                const SizedBox(width: 6,),
                const SFIcon(Ics.icQuestion),
              ],
            ),
            OverlayContainer(
              show: _dropdownShown,
              message: LocaleKeys.displays_message_from_spending_detail,
              position: const OverlayContainerPosition(25,-8),
            ),
          ],
        ),
      ),

    );
  }
}
