import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

import 'modal_transfer_between.dart';

class AssetTile extends StatefulWidget {
  const AssetTile({Key? key}) : super(key: key);

  @override
  State<AssetTile> createState() => _AssetTileState();
}

class _AssetTileState extends State<AssetTile> {
  String selected = LocaleKeys.avax;
  String image = Ics.icAvax;

  @override
  Widget build(BuildContext context) {
    return SFCard(
      onTap: () => SFModalBottomSheet.show(
          context,
          0.6,
          ModalTransferBetween(
            selected: selected,
            onSelect: (Object object) {
              var value = object as Map<String, dynamic>;
              selected = value['text'];
              image = value['urlImage'];
              setState(() {});
            },
          )),
      child: SFListTile(
        leading: SFIcon(image),
        text: selected,
        textStyle: TextStyles.lightWhite16,
        trailing: const Icon(
          Icons.chevron_right,
          size: 32,
          color: AppColors.lightGrey,
        ),
      ),
    );
  }
}
