import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/items_gacha.dart';

class GachaScreen extends StatefulWidget {
  const GachaScreen({Key? key}) : super(key: key);

  @override
  State<GachaScreen> createState() => _GachaScreenState();
}

class _GachaScreenState extends State<GachaScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopBarCommon(),
          const SizedBox(height: 16),
          Expanded(
            child: SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              header: const WaterDropHeader(),
              onRefresh: _onRefresh,
              child: ListView(
                physics: const ScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  ItemsGacha(
                    title: LocaleKeys.normal_gacha,
                    singleGacha: 12,
                    timesGacha: 100,
                    typeReward: LocaleKeys.uncommon_beds_chance,
                  ),
                  ItemsGacha(
                    title: LocaleKeys.special_gacha,
                    singleGacha: 120,
                    timesGacha: 1000,
                    typeReward: LocaleKeys.rare_beds_chance,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
