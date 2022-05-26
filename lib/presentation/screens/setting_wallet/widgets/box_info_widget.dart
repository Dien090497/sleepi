import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class BoxInfoWidget extends StatelessWidget {
  const BoxInfoWidget(
      {this.title, this.textStyle, this.info, this.urlIcon, this.onTap, Key? key})
      : super(key: key);

  final String? title;
  final TextStyle ? textStyle;
  final String? urlIcon;
  final String? info;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SFCard(
        margin: const EdgeInsets.only(top: 16.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        height: 141,
        child: Column(
          children: [
            SFListTile(
              leading: SvgPicture.asset(urlIcon ?? "", color: AppColors.blue),
              text: title,
              textStyle: textStyle ?? TextStyles.bold16Blue,
              trailing: const Icon(
                Icons.chevron_right, color: AppColors.lightGrey,),
            ),
            Divider(color: AppColors.lightWhite.withOpacity(0.05), height: 1,),
            const SizedBox(height: 12.0,),
            SFText(keyText: info ?? "", style: TextStyles.lightGrey14,),
          ],
        ),
      ),
    );
  }
}
