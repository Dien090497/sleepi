import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_tab_bar.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/chart/widgets/tab_day.dart';
import 'package:slee_fi/presentation/screens/chart/widgets/tab_month.dart';
import 'package:slee_fi/presentation/screens/chart/widgets/tab_week.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
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
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(
                child: SFTabBar(
                  isScrollable: true,
                  texts: [LocaleKeys.day, LocaleKeys.week, LocaleKeys.month],
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  children: [TabDay(), TabWeek(), TabMonth()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
