import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/setting/widgets/modal_multi_chain_switch.dart';
import 'package:slee_fi/presentation/screens/setting/widgets/modal_pop_up_language.dart';

class GeneralWidget extends StatelessWidget {
  const GeneralWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const icon = Icon(Icons.chevron_right, color: AppColors.lightGrey);
    Divider divider =
        Divider(color: AppColors.lightWhite.withOpacity(0.05), height: 1);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SFText(
          keyText: LocaleKeys.general,
          style: TextStyles.lightGrey14,
        ),
        SFCard(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SFListTile(
                text: LocaleKeys.permissions,
                trailing: icon,
                onPressed: () => Navigator.pushNamed(context, R.permission),
              ),
              divider,
              SFListTile(
                text: LocaleKeys.alarm,
                trailing: icon,
                onPressed: () => Navigator.pushNamed(context, R.alarm),
              ),
              divider,
              SFListTile(
                text: LocaleKeys.activation_code
                    .tr()
                    .reCase(StringCase.titleCase),
                trailing: icon,
                onPressed: () => Navigator.pushNamed(context, R.activationCode),
              ),
              divider,
              SFListTile(
                text: LocaleKeys.language,
                trailing: icon,
                onPressed: () => SFModalBottomSheet.show(
                    context, 0.5, const ModalPopUpLanguage()),
              ),
              divider,
              SFListTile(
                text: LocaleKeys.multi_chain_switch,
                trailing: icon,
                onPressed: () => SFModalBottomSheet.show(
                    context, 0.5, const ModalMultiChainSwitch()),
              ),
              divider,
              SFListTile(
                text: LocaleKeys.version,
                trailing:
                    SFText(keyText: "0.01", style: TextStyles.lightGrey14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
