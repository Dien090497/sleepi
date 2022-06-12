import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class TransactionDetailList extends StatelessWidget {
  const TransactionDetailList({this.isTransactionRecord = false, Key? key})
      : super(key: key);

  final bool isTransactionRecord;

  @override
  Widget build(BuildContext context) {
    List keyList = [
      "AVAX",
      "SLFT",
      "SLGT",
      LocaleKeys.beds,
      LocaleKeys.jewels,
      LocaleKeys.bed_box,
    ];
    List icons = [
      Ics.icSolanaCircle,
      Ics.icSlgt,
      Ics.icSlgt,
      Ics.icBeds,
      Ics.icJewels,
      Ics.icBedBoxes
    ];
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      height: MediaQuery.of(context).size.height * 0.55,
      padding: const EdgeInsets.only(top: 20),
      child: isTransactionRecord
          ? SafeArea(
              top: false,
              child: ListView.builder(
                  itemCount: keyList.length,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                  itemBuilder: (BuildContext context, int index) {
                    return SFCard(
                      child: ListTile(
                        leading: SFIcon(
                          icons[index],
                          width: 32,
                        ),
                        title: SFText(
                            keyText: keyList[index],
                            style: TextStyles.lightWhite16),
                        trailing: SFText(
                          keyText: "xxxxxxxxx",
                          style: TextStyles.lightWhite16,
                        ),
                      ),
                    );
                  }),
            )
          : Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SFIcon(Ics.emptyBox),
                const SizedBox(height: 24),
                SFText(
                  keyText: LocaleKeys.no_transaction_record,
                  style: TextStyles.lightGrey14,
                )
              ],
            )),
    );
  }
}
