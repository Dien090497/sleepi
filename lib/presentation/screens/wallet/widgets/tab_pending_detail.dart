import 'package:flutter/cupertino.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';

class TabPendingDetail extends StatelessWidget {
  const TabPendingDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 12,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            itemBuilder: (BuildContext context, int index) {
              return SFCard(
                onTap: () async {
                  final url = Uri.parse('https://avascan.info/');
                  if (await canLaunchUrl(url)) {
                  launchUrl(url);
                  }
                },
                radius: 8,
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        CupertinoIcons.cloud_download,
                        color: AppColors.blue,
                      ),
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SFText(
                          keyText: LocaleKeys.confirm,
                          style: TextStyles.bold16Blue,
                        ),
                        const SizedBox(height: 4.0),
                        SFText(
                          keyText: "27/04/2022  14:08",
                          style: TextStyles.lightGrey14,
                        ),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SFText(
                          keyText: "+1 NFT",
                          style: TextStyles.bold16Blue,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        SFText(
                          keyText: "53LqDpU...wihRe3",
                          style: TextStyles.lightGrey14,
                        ),
                      ],
                    )),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 75)
      ],
    );
  }
}
