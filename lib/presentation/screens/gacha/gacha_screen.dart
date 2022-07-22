import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/gacha_history_response/gacha_history_response.dart';
import 'package:slee_fi/presentation/blocs/gacha/gacha_spin_cubit.dart';
import 'package:slee_fi/presentation/blocs/gacha/gacha_spin_state.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/items_gacha.dart';
import 'package:slee_fi/resources/resources.dart';

class GachaScreen extends StatefulWidget {
  const GachaScreen({Key? key}) : super(key: key);

  @override
  State<GachaScreen> createState() => _GachaScreenState();
}

class _GachaScreenState extends State<GachaScreen> {
  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);
   GachaHistoryResponse? _gachaHistoryResponse;

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

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
              onRefresh: _onRefresh,
              child: BlocProvider(
                create: (context) => GachaSpinCubit()..init(),
                child: BlocListener<GachaSpinCubit,GachaSpinState>(
                  listener: (context, state) {
                   if(state is GachaHistorySuccess){
                     _gachaHistoryResponse = state.response;
                     setState((){});
                   }
                  },
                  child: ListView(
                    physics: const ScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children:  [
                      ItemsGacha(
                        title: LocaleKeys.normal_gacha,
                        singleGachaImages: Localizations.localeOf(context).toLanguageTag().isJapanese ? Imgs.normalGacha1Ja :Imgs.normalGacha1En,
                        timesGachaImages: Localizations.localeOf(context).toLanguageTag().isJapanese ? Imgs.normalGacha10Ja :Imgs.normalGacha10En,
                        singleProbability: Const.one,
                        timesProbability: Const.two,
                        numberOfSpin: _gachaHistoryResponse != null ? _gachaHistoryResponse!.data!.commonTimes! : 0,
                        typeReward: LocaleKeys.uncommon_beds_chance,
                        imagePath: Imgs.normalGacha,
                        normalGacha: true,
                      ),
                      ItemsGacha(
                        title: LocaleKeys.special_gacha,
                        singleGachaImages: Localizations.localeOf(context).toLanguageTag().isJapanese ? Imgs.specialGacha1Ja :Imgs.specialGacha1En,
                        timesGachaImages: Localizations.localeOf(context).toLanguageTag().isJapanese ? Imgs.specialGacha10Ja :Imgs.specialGacha10En,
                        singleProbability: Const.three,
                        timesProbability: Const.four,
                        numberOfSpin: _gachaHistoryResponse != null ? _gachaHistoryResponse!.data!.specialTimes! : 0,
                        typeReward: LocaleKeys.rare_beds_chance,
                        imagePath: Imgs.specialGacha,
                        normalGacha: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
