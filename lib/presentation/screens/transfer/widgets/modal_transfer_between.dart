import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class ModalTransferBetween extends StatefulWidget {
  const ModalTransferBetween({this.onSelect, this.selected, Key? key}) : super(key: key);
  final ValueChanged<Object>? onSelect;
  final String? selected;

  @override
  State<ModalTransferBetween> createState() => _ModalTransferBetweenState();
}

class _ModalTransferBetweenState extends State<ModalTransferBetween> {

  int selectedIndex = 0 ;
  List keyList = [
    LocaleKeys.avax,
    LocaleKeys.slft,
    LocaleKeys.slgt,
    LocaleKeys.beds,
    LocaleKeys.jewels,
    LocaleKeys.bed_box
  ];
  List urlImages = [
    Ics.icSolanaCircle,
    Ics.icSlgt,
    Ics.icSlgt,
    Ics.icBeds,
    Imgs.jewels,
    Ics.icBedBoxes
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
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int index) {
          return SFCard(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: SFIcon(
                urlImages[index],
                width: 32,
              ),
              title: SFText(
                  keyText: keyList[index], style: TextStyles.lightWhite16),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    index > 2 ? const Icon(Icons.keyboard_arrow_down, color: AppColors.lightGrey,) : const SizedBox(),
                    selectedIndex == index && index < 3
                        ? const Icon(
                      Icons.check,
                      color: AppColors.green,
                      size: 32,
                    )
                        : const SizedBox(),
                  ],
                )
            ),
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              if(index < 3) {
                widget.onSelect!({"text" : keyList[index], "urlImage" : urlImages[index]});
                Navigator.pop(context);
              }
            },
          );
        });
  }
}
