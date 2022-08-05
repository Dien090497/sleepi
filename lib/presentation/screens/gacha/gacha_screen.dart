import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/gacha_history_response/gacha_history_response.dart';
import 'package:slee_fi/models/gacha_probability_config_response/config_cost.dart';
import 'package:slee_fi/models/gacha_probability_config_response/probability_config.dart';
import 'package:slee_fi/presentation/blocs/gacha/gacha_spin_cubit.dart';
import 'package:slee_fi/presentation/blocs/gacha/gacha_spin_state.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/items_gacha.dart';
import 'package:slee_fi/resources/resources.dart';

class GachaScreen extends StatefulWidget {
  const GachaScreen({Key? key}) : super(key: key);

  @override
  State<GachaScreen> createState() => _GachaScreenState();
}

class _GachaScreenState extends State<GachaScreen> {
  GachaHistoryResponse? _gachaHistoryResponse;
  ProbabilityConfig? commonData;
  ProbabilityConfig? specialData;
  List<dynamic>? commonInfo;
  List<dynamic>? specialInfo;
  ConfigCost? _configCost;
  int commonTimes = 0;
  int specialTimes = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopBarCommon(),
          const SizedBox(height: 16),
          BlocProvider(
            create: (context) => GachaSpinCubit()..init(),
            child: BlocConsumer<GachaSpinCubit, GachaSpinState>(
              listener: (context, state) {
                if (state is GachaHistorySuccess) {
                  context.read<UserBloc>().add(const RefreshBalanceToken());
                  _gachaHistoryResponse = state.response;
                }
                if (state is GachaProbabilityConfigSuccess) {
                  var common = state.gachaProbabilityConfigResponse.data
                      .where((i) => i.key == "COMMON")
                      .toList()
                      .first
                      .configs;
                  // commonData = ProbabilityConfig.fromJson(common as Map<String, dynamic>);
                  commonInfo = common;
                  var special = state.gachaProbabilityConfigResponse.data
                      .where((i) => i.key == "SPECIAL")
                      .toList()
                      .first
                      .configs;
                  specialInfo = special;
                  // specialData = ProbabilityConfig.fromJson(special as Map<String, dynamic>);
                  var configCost = state.gachaProbabilityConfigResponse.data
                      .where((i) => i.key == "COST_OPEN_GACHA")
                      .toList()
                      .first
                      .configs;
                  _configCost =
                      ConfigCost.fromJson(configCost as Map<String, dynamic>);
                  var commonTime = state.gachaProbabilityConfigResponse.data
                      .where((i) => i.key == "COMMON_RESET_TIME")
                      .toList()
                      .first
                      .configs;
                  commonTimes = commonTime['times'];
                  var specialTime = state.gachaProbabilityConfigResponse.data
                      .where((i) => i.key == "SPECIAL_RESET_TIME")
                      .toList()
                      .first
                      .configs;
                  specialTimes = specialTime['times'];
                }
              },
              builder: (context, state) {
                final cubit = context.read<GachaSpinCubit>();
                return Expanded(
                  child: Stack(
                    children: [
                      ListView(
                        physics: const ScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: [
                          ItemsGacha(
                            dialogData: commonInfo,
                            costSingle: _configCost != null
                                ? _configCost!.normalGachaSingle!
                                : 0,
                            costMultiple: _configCost != null
                                ? _configCost!.normalGachaMultiple!
                                : 0,
                            title: LocaleKeys.normal_gacha,
                            singleGachaImages: Localizations.localeOf(context)
                                    .toLanguageTag()
                                    .isJapanese
                                ? Imgs.timeGachaJa
                                : Imgs.timeGachaEn,
                            timesGachaImages: Localizations.localeOf(context)
                                    .toLanguageTag()
                                    .isJapanese
                                ? Imgs.timesNormalGachaJa
                                : Imgs.timesNormalGachaEn,
                            singleProbability: Const.one,
                            timesProbability: Const.two,
                            numberOfSpin: _gachaHistoryResponse != null &&
                                    _gachaHistoryResponse!.data != null
                                ? _gachaHistoryResponse!.data!.commonTimes!
                                : 0,
                            typeReward: 'Common Bed',
                            imagePath: Imgs.normalGachaBackground,
                            totalValue: commonTimes,
                            normalGacha: true,
                            onPressed: () => cubit.init(),
                          ),
                          ItemsGacha(
                            dialogData: specialInfo,
                            costSingle: _configCost != null
                                ? _configCost!.specialGachaSingle!
                                : 0,
                            costMultiple: _configCost != null
                                ? _configCost!.specialGachaMultiple!
                                : 0,
                            title: LocaleKeys.special_gacha,
                            singleGachaImages: Localizations.localeOf(context)
                                    .toLanguageTag()
                                    .isJapanese
                                ? Imgs.timeGachaJa
                                : Imgs.timeGachaEn,
                            timesGachaImages: Localizations.localeOf(context)
                                    .toLanguageTag()
                                    .isJapanese
                                ? Imgs.timesSpecialGachaJa
                                : Imgs.timesSpecialGachaEn,
                            singleProbability: Const.three,
                            timesProbability: Const.four,
                            numberOfSpin: _gachaHistoryResponse != null &&
                                    _gachaHistoryResponse!.data != null
                                ? _gachaHistoryResponse!.data!.specialTimes!
                                : 0,
                            typeReward: 'Uncommon Bed',
                            imagePath: Imgs.specialGachaBackground,
                            totalValue: specialTimes,
                            normalGacha: false,
                            onPressed: () => cubit.init(),
                          ),
                        ],
                      ),
                      if (state is GachaDataLoading) const LoadingScreen(),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
