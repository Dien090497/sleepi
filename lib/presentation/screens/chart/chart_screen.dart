import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/chart/widgets/tab_day.dart';
import 'package:slee_fi/presentation/screens/chart/widgets/tab_month.dart';
import 'package:slee_fi/presentation/screens/chart/widgets/tab_week.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: DefaultTabController(
            length: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SFText(
                  keyText: Keys.statistics,
                  style: TextStyles.header,
                ),
                const SizedBox(height: 16),
                // SFTabBar(
                //   texts: const [Keys.day, Keys.week, Keys.month],
                //   padding: const EdgeInsets.symmetric(horizontal: 40),
                // ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      TabDay(),
                      TabWeek(),
                      TabMonth(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
