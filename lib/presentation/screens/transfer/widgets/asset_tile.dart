import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';


class AssetTile extends StatefulWidget {
  const AssetTile({Key? key, required this.tokenName, required this.img}) : super(key: key);
  final String tokenName;
  final String img;
  @override
  State<AssetTile> createState() => _AssetTileState();
}

class _AssetTileState extends State<AssetTile> {

  @override
  Widget build(BuildContext context) {
    return SFCard(
      /*onTap: () => SFModalBottomSheet.show(
          context,
          0.6,
          ModalTransferBetween(
            selected: selected,
            onSelect: (Object object) {
              final value = object as Map<String, dynamic>;
              selected = value['text'];
              image = value['urlImage'];
              setState(() {});
            },
          )),*/
      child: SFListTile(
        leading: SFIcon(widget.img),
        text: widget.tokenName,
        textStyle: TextStyles.lightWhite16,
      ),
    );
  }
}
