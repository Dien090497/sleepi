import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/share_screen/share_cubit.dart';
import 'package:slee_fi/presentation/blocs/share_screen/share_state.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/top_left_banner.dart';
import 'package:slee_fi/presentation/screens/result/layout/pre_result_screen.dart';
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
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    final shareArgs =
        ModalRoute.of(context)?.settings.arguments as PreResultParams;
    return BlocProvider(
      create: (_) => ShareCubit(),
      child: BlocConsumer<ShareCubit, ShareState>(
        listener: (context, state) {
          if (state is ShareStateLoaded) {
            showSuccessfulDialog(context, null);
          }
        },
        builder: (context, state) {
          final cubit = context.read<ShareCubit>();
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
                          _bodyShare(
                              imgBed: shareArgs.imageBed ?? '',
                              args: shareArgs),
                          const SizedBox(height: 32),
                          SFButton(
                            text: LocaleKeys.return_to_home,
                            textStyle: TextStyles.w600WhiteSize16,
                            gradient: AppColors.gradientBlueButton,
                            width: double.infinity,
                            onPressed: () {
                              if (shareArgs.fromRoute == R.splash) {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, R.bottomNavigation, (r) => false);
                              } else {
                                Navigator.popUntil(
                                    context,
                                    (r) =>
                                        r.settings.name == R.bottomNavigation);
                              }
                            },
                          ),
                          const SizedBox(
                            height: 150,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: CommunityShare(
                    controller: screenshotController,
                    widget: _bodyShare(
                        imgBed: shareArgs.imageBed ?? '', args: shareArgs),
                    cubit: cubit,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _bodyShare({required String imgBed, required PreResultParams args}) {
    return Column(
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
                          SFIcon(
                            imgBed,
                            height: 160,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: AppColors.white.withOpacity(0.1)),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 16),
                            child: SFText(
                              keyText: args.resultModel.bed?.name ?? '',
                              style: TextStyles.white1w700size12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CategoryHeaderShare(
                    preResultParams: args,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Platform.isAndroid
                      ? ((args.dataChart.isNotEmpty &&
                              args.dataChart.first.maxX != -1)
                          ? ChartStatisticShare(
                              maxValue: 360,
                              data: args.dataChart.first,
                              typeTimeChart: TypeTimeChart.chartDay,
                            )
                          : const SizedBox())
                      : const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: SFIcon(Ics.commingSoon),
                        ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Positioned(
              top: 14,
              left: -30,
              child: TopLeftBanner(
                text: args.resultModel.bed?.classNft ?? 'Short',
                textColor: AppColors.red,
              ),
            ),
          ],
        ),
        const SleepFiQrCode(value: 'SLeepFi'),
      ],
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
