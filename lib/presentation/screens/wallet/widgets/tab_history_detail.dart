import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class TabHistoryDetail extends StatelessWidget {
  const TabHistoryDetail ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12.0),
      children: [
        SFCard(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.cloud_download_outlined, color: AppColors.blue),
              const SizedBox(width: 4.0,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SFText(keyText: Keys.confirm, style: TextStyles.bold16Blue,),
                    const SizedBox(height: 4.0,),
                    SFText(keyText: "27/04/2022  14:08", style: TextStyles.lightGrey12,)
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SFText(keyText: "+1 NFT", style: TextStyles.bold16Blue,),
                    const SizedBox(height: 4.0,),
                    SFText(keyText: "53LqDpU...wihRe3", style: TextStyles.lightGrey12,)
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
