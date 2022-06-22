import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class ModalMultiChainSwitch extends StatefulWidget {
  const ModalMultiChainSwitch({Key? key}) : super(key: key);

  @override
  State<ModalMultiChainSwitch> createState() => _ModalMultiChainSwitchState();
}

class _ModalMultiChainSwitchState extends State<ModalMultiChainSwitch> {
  int selectItem = 0;
  List<String> keyText = ["AVAX", "BNB Smart Chain (BEP20)"];
  List icons = [Ics.icSolanaCircle, Imgs.binance];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 32.0,
        ),
        SFText(
            keyText: LocaleKeys.multi_chain_switch,
            style: TextStyles.bold18White),
        const SizedBox(
          height: 32.0,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: keyText.length,
              shrinkWrap: true,
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              itemBuilder: (BuildContext context, int index) {
                return SFCard(
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    horizontalTitleGap: 4,
                    leading: SFIcon(icons[index]),
                    title: SFText(
                      keyText: keyText[index],
                      style: TextStyles.lightWhite16,
                    ),
                    trailing: selectItem == index
                        ? const Icon(
                            Icons.check,
                            color: AppColors.green,
                            size: 32,
                          )
                        : const SizedBox(),
                  ),
                  onTap: () {
                    setState(() {
                      selectItem = index;
                      Navigator.pop(context);
                    });
                  },
                );
              }),
        )
      ],
    );
  }
}
