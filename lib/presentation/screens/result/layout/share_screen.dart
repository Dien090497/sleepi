import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/top_left_banner.dart';
import 'package:slee_fi/presentation/screens/result/widgets/category_header_share.dart';
import 'package:slee_fi/presentation/screens/result/widgets/chart_statistic_share.dart';
import 'package:slee_fi/presentation/screens/result/widgets/community_share.dart';
import 'package:slee_fi/presentation/screens/result/widgets/sleepfi_qr.dart';
import 'package:slee_fi/resources/resources.dart';

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
          Scaffold(
            backgroundColor: AppColors.transparent,
            appBar: SFAppBar(
              context: context,
              title: LocaleKeys.share,
              textStyle: TextStyles.bold18LightWhite,
            ),
            body: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(0.05),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          child: Column(
                            children: [
                              ClipPath(
                                clipper: CurvedBottomClipper(),
                                child: Container(
                                  padding: const EdgeInsets.only(bottom: 26),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.blue.withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    children: [
                                      const SFIcon(
                                        Imgs.shortBed,
                                        height: 160,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          border: Border.all(
                                              color: AppColors.white
                                                  .withOpacity(0.1)),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 16),
                                        child: SFText(
                                          keyText: 'A2347',
                                          style: TextStyles.white1w700size12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const CategoryHeaderShare(),
                              const SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16.0),
                                child: ChartStatisticShare(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        const Positioned(
                          top: 14,
                          left: -30,
                          child: TopLeftBanner(
                            text: 'Short',
                            textColor: AppColors.red,
                          ),
                        ),
                      ],
                    ),
                    const SleepFiQrCode(value: 'SLeepFi'),
                    const SizedBox(height: 20,),
                    SFButton(
                      text: LocaleKeys.return_to_home,
                      textStyle: TextStyles.w600WhiteSize16,
                      gradient: AppColors.gradientBlueButton,
                      width: double.infinity,
                      onPressed: () {
                        Navigator.popUntil(context, (r) => r.settings.name == R.bottomNavigation);
                      },),
                    const SizedBox(height: 150,),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            child: CommunityShare(),
          ),
        ],
      ),
    );
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final filledRectangle = Rect.fromLTRB(0, 0, size.width, size.height - 60);

    final roundingRectangle =
        Rect.fromLTRB(-5, size.height - 60 * 2, size.width + 5, size.height);

    final path = Path();
    path.addRect(filledRectangle);

    path.arcTo(roundingRectangle, 3.14, -3.14, true);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
