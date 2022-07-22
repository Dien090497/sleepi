import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/gacha_probability_config_response/config_bed.dart';
import 'package:slee_fi/presentation/blocs/gacha/gacha_spin_cubit.dart';
import 'package:slee_fi/presentation/blocs/gacha/gacha_spin_state.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/items_probability.dart';
import 'package:slee_fi/resources/resources.dart';

import 'package:slee_fi/models/gacha_probability_config_response/gacha_probability_config_response.dart';

import 'bed_probability.dart';

class ProbabilityDialog extends StatefulWidget {
  final bool normalGacha;

  const ProbabilityDialog({required this.normalGacha, Key? key})
      : super(key: key);

  @override
  State<ProbabilityDialog> createState() => _ProbabilityDialogState();
}

class _ProbabilityDialogState extends State<ProbabilityDialog> {
  GachaProbabilityConfigResponse? _configResponse;
  ConfigBed? beds;
  @override
  Widget build(BuildContext context) {

    final List<ListRowData> listToken = [
      ListRowData(title: 'SLFT', parameter: '100%'),
      ListRowData(title: 'SLGT', parameter: '90%'),
    ];
    return BlocProvider(
      create: (context) =>
      GachaSpinCubit()
        ..gachaProbabilityConfig(),
      child: BlocConsumer<GachaSpinCubit, GachaSpinState>(
        listener: (context, state) {
          if(state is GachaProbabilityConfigSuccess){
            _configResponse = state.gachaProbabilityConfigResponse;
            // beds  = state.gachaProbabilityConfigResponse.data.first.config.bed;
            // print(state.gachaProbabilityConfigResponse.data.first.config);
            //
            // print(beds?.epicBed);
            setState((){});
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SFText(
                    keyText: LocaleKeys.probability,
                    style: TextStyles.bold18LightWhite,
                  ),
                ),
                const SizedBox(height: 24),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SFText(keyText: LocaleKeys.product_line_up,
                        style: TextStyles.bold14LightWhiteWithOpacity,),
                      const SizedBox(height: 16),
                      BedProbability(
                        iconPath: Ics.icBedsProbability,
                        title: LocaleKeys.bed,
                        beds: beds,
                        colorBgIcon: [
                          AppColors.blue.withOpacity(0.1),
                          AppColors.blue.withOpacity(0.1)
                        ],
                      ),
                      const SizedBox(height: 12),
                      ItemsProbability(
                        iconPath: Ics.icPillows,
                        listData: listToken,
                        title: LocaleKeys.jewels,
                        colorBgIcon: [
                          AppColors.green.withOpacity(0.1),
                          AppColors.blue.withOpacity(0.1)
                        ],
                      ),
                      const SizedBox(height: 12),
                      ItemsProbability(
                        iconPath: Ics.item,
                        listData: listToken,
                        title: LocaleKeys.item,
                        colorBgIcon: [
                          AppColors.blue.withOpacity(0.1),
                          AppColors.purple.withOpacity(0.1)
                        ],
                        width: 45,
                        height: 45,
                      ),
                      const SizedBox(height: 12),
                      ItemsProbability(
                        iconPath: Imgs.doubleIcon,
                        listData: listToken,
                        title: LocaleKeys.token,
                        width: 40,
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

//TODO: Just For Test Delete when have real data
class ListRowData {
  String title;
  String parameter;

  ListRowData({required this.title, required this.parameter});
}
