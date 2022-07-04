import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class ModalTransferBetween extends StatefulWidget {
  const ModalTransferBetween({this.onSelect, this.selected, Key? key})
      : super(key: key);
  final ValueChanged<Object>? onSelect;
  final String? selected;

  @override
  State<ModalTransferBetween> createState() => _ModalTransferBetweenState();
}

class _ModalTransferBetweenState extends State<ModalTransferBetween> {
  int selectedIndex = 0;

  List keyList = [
    "AVAX",
    "SLFT",
    "SLGT",
    LocaleKeys.beds,
    LocaleKeys.jewels,
    LocaleKeys.bed_box,
    LocaleKeys.item
  ];
  List urlImages = [
    Ics.icAvax,
    Ics.icSlft,
    Ics.icSlgt,
    Ics.bed,
    Ics.jewel,
    Ics.icBedBoxes,
    Ics.item,
  ];

  @override
  initState() {
    selectedIndex = keyList.indexOf(widget.selected);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: keyList.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(24.0),
        itemBuilder: (BuildContext context, int index) {
          return SFCard(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            margin: const EdgeInsets.only(top: 8.0),
            radius: 8,
            child: SFListTile(
                leading: Padding(
                  padding: EdgeInsets.only(
                      left: urlImages[index] == Ics.icAvax ? 4.0 : 0),
                  child: SFIcon(
                    urlImages[index],
                    width: urlImages[index] == Ics.icAvax ? 32 : 40,
                    height: urlImages[index] == Ics.icAvax ? 32 : 40,
                  ),
                ),
                text: keyList[index],
                textStyle: TextStyles.lightWhite16,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    index > 2
                        ? const Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.lightGrey,
                          )
                        : const SizedBox(),
                    selectedIndex == index && index < 3
                        ? const Icon(
                            Icons.check,
                            color: AppColors.green,
                            size: 32,
                          )
                        : const SizedBox(),
                  ],
                )),
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              if (index < 3) {
                widget.onSelect!(
                    {"text": keyList[index], "urlImage": urlImages[index]});
                Navigator.pop(context);
              }
            },
          );
        });
  }
}
