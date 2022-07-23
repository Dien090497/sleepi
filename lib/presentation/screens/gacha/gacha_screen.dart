import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/gacha_history_response/gacha_history_response.dart';
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
                if(state is GachaHistorySuccess){
                  BlocProvider.of<UserBloc>(context).add(const UpdateUserOrListToken());
                  _gachaHistoryResponse = state.response;
                }
                if(state is GachaProbabilityConfigSuccess){
                  var common = state.gachaProbabilityConfigResponse.data.where((i) => i.key == "COMMON").toList().first.config;
                  commonData = ProbabilityConfig.fromJson(common as Map<String, dynamic>);
                  var special = state.gachaProbabilityConfigResponse.data.where((i) => i.key == "SPECIAL").toList().first.config;
                  specialData = ProbabilityConfig.fromJson(special as Map<String, dynamic>);
                  var commonTime = state.gachaProbabilityConfigResponse.data.where((i) => i.key == "COMMON_RESET_TIME").toList().first.config;
                  commonTimes = commonTime['times'];
                  var specialTime = state.gachaProbabilityConfigResponse.data.where((i) => i.key == "SPECIAL_RESET_TIME").toList().first.config;
                  specialTimes = specialTime['times'];
                }
              },
              builder: (context, state) {
                final cubit = context.read<GachaSpinCubit>();
                return Expanded(
                  child: ListView(
                    physics: const ScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children:  [
                      ItemsGacha(
                        dialogData: commonData,
                        title: LocaleKeys.normal_gacha,
                        singleGachaImages: Localizations.localeOf(context).toLanguageTag().isJapanese ? Imgs.normalGacha1Ja :Imgs.normalGacha1En,
                        timesGachaImages: Localizations.localeOf(context).toLanguageTag().isJapanese ? Imgs.normalGacha10Ja :Imgs.normalGacha10En,
                        singleProbability: Const.one,
                        timesProbability: Const.two,
                        numberOfSpin: _gachaHistoryResponse != null ? _gachaHistoryResponse!.data!.commonTimes! : 0,
                        typeReward: LocaleKeys.uncommon_beds_chance,
                        imagePath: Imgs.normalGacha,
                        totalValue: commonTimes,
                        normalGacha: true,
                        onPressed: () => cubit.init(),
                      ),
                      ItemsGacha(
                        dialogData: specialData,
                        title: LocaleKeys.special_gacha,
                        singleGachaImages: Localizations.localeOf(context).toLanguageTag().isJapanese ? Imgs.specialGacha1Ja :Imgs.specialGacha1En,
                        timesGachaImages: Localizations.localeOf(context).toLanguageTag().isJapanese ? Imgs.specialGacha10Ja :Imgs.specialGacha10En,
                        singleProbability: Const.three,
                        timesProbability: Const.four,
                        numberOfSpin: _gachaHistoryResponse != null ? _gachaHistoryResponse!.data!.specialTimes! : 0,
                        typeReward: LocaleKeys.rare_beds_chance,
                        imagePath: Imgs.specialGacha,
                        totalValue: specialTimes,
                        normalGacha: false,
                        onPressed: () => cubit.init(),
                      ),
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
