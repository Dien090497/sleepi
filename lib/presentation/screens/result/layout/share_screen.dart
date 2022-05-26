import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/result/widgets/category_header.dart';
import 'package:slee_fi/presentation/screens/result/widgets/chart_statistic.dart';
import 'package:slee_fi/presentation/screens/result/widgets/community_share.dart';
import 'package:slee_fi/presentation/screens/result/widgets/sleepfi_qr.dart';

class ShareScreen extends StatefulWidget {
  const ShareScreen({Key? key}) : super(key: key);

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Scaffold(
            backgroundColor: AppColors.transparent,
            appBar: SFAppBar(
              context: context,
              title: Keys.share,
              textStyle: TextStyles.bold18LightWhite,
            ),
            body: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const CategoryHeader(
                    earning: 1000,
                    score: 99,
                    sleepDuration: '7h35min',
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ChartStatistic(),
                  const SizedBox(
                    height: 32,
                  ),
                  const SleepFiQrCode(value: 'SleepFi'),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
        const Positioned(
          bottom: 0,
          child: Material(child: CommunityShare()),
        ),
      ],
    ));
  }
}
