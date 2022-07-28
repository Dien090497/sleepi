import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      appBar: AppBar(
        title: SFText(
          keyText: LocaleKeys.statistics,
          style: TextStyles.bold18LightWhite,
        ),
        centerTitle: true,
        backgroundColor: AppColors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.3),
          child: const Center(child: SFIcon(Ics.commingSoon)),
        )

        /// INFORMATION DISPLAY ON CHART
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Expanded(
        //       child: SFTabBar(
        //         isScrollable: true,
        //         texts: const [
        //           LocaleKeys.day,
        //           LocaleKeys.week,
        //           LocaleKeys.month
        //         ],
        //         padding: const EdgeInsets.symmetric(horizontal: 32),
        //         children: [
        //           BlocProvider(
        //             create: (_) => ChartDayCubit()..init(),
        //             child: const TabDay(),
        //           ),
        //           BlocProvider(
        //             create: (_) => ChartWeekCubit()..init(),
        //             child: const TabWeek(),
        //           ),
        //           BlocProvider(
        //             create: (_) => ChartMonthCubit()..init(),
        //             child: const TabMonth(),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        ///----------------------------------------------
      ),
    );
  }
}
