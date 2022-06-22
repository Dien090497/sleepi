import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SFText(keyText: '${LocaleKeys.filter.tr()}(0)'),
                SFText(keyText: LocaleKeys.clear_filter),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SFText(keyText: LocaleKeys.type),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                SizedBox(
                  width: 110,
                  child: SFButton(text: LocaleKeys.efficiency),
                ),
                SizedBox(
                  width: 110,
                  child: SFButton(text: LocaleKeys.luck),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                SizedBox(
                  width: 110,
                  child: SFButton(text: 'Comfort'),
                ),
                SizedBox(
                  width: 110,
                  child: SFButton(text: LocaleKeys.resilience),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SFText(keyText: LocaleKeys.quality),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
