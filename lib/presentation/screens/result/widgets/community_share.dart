import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class CommunityShare extends StatelessWidget {
  const CommunityShare({Key? key}) : super(key: key);

  Widget itemCommunity(BuildContext context, String icon, String key) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 4,
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SFIcon(
            icon,
            color: AppColors.lightGrey,
          ),
          const SizedBox(
            height: 6,
          ),
          SFText(
            keyText: key,
            style: TextStyles.lightGrey12,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.dark,
          border: Border(
              top: BorderSide(
            width: 1,
            color: AppColors.lightDark,
          ))),
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          itemCommunity(context, Ics.icDownload, LocaleKeys.download),
          itemCommunity(context, Ics.twitter, LocaleKeys.twitter),
          itemCommunity(context, Ics.facebook, LocaleKeys.facebook),
          itemCommunity(context, Ics.telegram, LocaleKeys.telegram),
        ],
      ),
    );
  }
}
