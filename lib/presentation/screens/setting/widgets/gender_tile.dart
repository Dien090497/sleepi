import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/setting/widgets/modal_pop_up_sex.dart';

class GenderTile extends StatefulWidget {
  const GenderTile({Key? key}) : super(key: key);

  @override
  State<GenderTile> createState() => _GenderTileState();
}

class _GenderTileState extends State<GenderTile> {
  String selectedGender = LocaleKeys.sex_male;

  @override
  Widget build(BuildContext context) {
    const icon = Icon(Icons.chevron_right, color: AppColors.lightGrey);

    return SFListTile(
      text: LocaleKeys.sex,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SFText(keyText: selectedGender, style: TextStyles.lightWhite14),
          icon,
        ],
      ),
      onPressed: () => SFModalBottomSheet.show(
        context,
        0.5,
        ModalPopUpSex(
          selectedGender: selectedGender,
          onSelect: (String value) {
            selectedGender = value;
            setState(() {});
          },
        ),
      ),
    );
  }
}
