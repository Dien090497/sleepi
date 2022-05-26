import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/resources/resources.dart';

class ModalTransferBetween extends StatelessWidget {
  const ModalTransferBetween({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List keyList = [
      Keys.avax,
      Keys.slft,
      Keys.slgt,
      Keys.bed,
      Keys.jewels,
      Keys.bedBox
    ];
    List urlImages = [
      Imgs.avax,
      Imgs.slft,
      Imgs.slgt,
      Imgs.beds,
      Imgs.jewels,
      Imgs.beds
    ];
    return ListView.builder(
        itemCount: keyList.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int index) {
          return SFCard(
            child: ListTile(
              leading: SFIcon(urlImages[index]),
              title: SFText(
                  keyText: keyList[index], style: TextStyles.lightWhite16),
              // trailing: SFText(keyText: "xxxxxxxxx", style: TextStyles.lightWhite16,),
            ),
          );
        });
  }
}
