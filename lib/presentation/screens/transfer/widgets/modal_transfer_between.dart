import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class ModalTransferBetween extends StatelessWidget {
  const ModalTransferBetween({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List keyList = [
      LocaleKeys.avax,
      LocaleKeys.slft,
      LocaleKeys.slgt,
      LocaleKeys.bed,
      LocaleKeys.jewels,
      LocaleKeys.bed_box
    ];
    List urlImages = [
      Ics.icSolanaCircle,
      Ics.icGold,
      Ics.icSilver,
      Ics.icBeds,
      Imgs.jewels,
      Ics.icBedBoxes
    ];
    return ListView.builder(
        itemCount: keyList.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int index) {
          return SFCard(
            child: ListTile(
              leading: SFIcon(
                urlImages[index],
                width: 32,
              ),
              title: SFText(
                  keyText: keyList[index], style: TextStyles.lightWhite16),
            ),
          );
        });
  }
}
