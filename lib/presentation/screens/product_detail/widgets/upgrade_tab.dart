import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/cached_image.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/jewel_entity/jewel_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/upgrade_jewel_info_response/upgrade_info_response.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_bloc.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_event.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_state.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/atribute_process.dart';
import 'package:slee_fi/resources/resources.dart';

import 'modal_jewel_list.dart';

class UpGradeTab extends StatelessWidget {
  const UpGradeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 30),
        child: BlocBuilder<JewelBloc, JewelState>(
          builder: (context, state) {
            final UpgradeInfoResponse? info =
                state is JewelStateLoaded && state.upgradeInfoResponse != null
                    ? state.upgradeInfoResponse
                    : null;
            return Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: AppColors.purple.withOpacity(0.035),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ], borderRadius: BorderRadius.circular(20)),
                      child: Stack(
                        children: [
                          Image.asset(
                            width: 238,
                            height: 238,
                            Imgs.upgrade,
                            fit: BoxFit.cover,
                          ),
                          JewelSocket(
                              top: 28,
                              left: 0,
                              right: 0,
                              jewelEntity: state is JewelStateLoaded &&
                                      state.jewelsUpgrade.isNotEmpty
                                  ? state.jewelsUpgrade.first
                                  : null),
                          JewelSocket(
                              bottom: 60,
                              right: 40,
                              jewelEntity: state is JewelStateLoaded &&
                                      state.jewelsUpgrade.isNotEmpty
                                  ? state.jewelsUpgrade[1]
                                  : null),
                          JewelSocket(
                              bottom: 60,
                              left: 40,
                              jewelEntity: state is JewelStateLoaded &&
                                      state.jewelsUpgrade.isNotEmpty
                                  ? state.jewelsUpgrade[2]
                                  : null),
                        ],
                      ),
                    ),
                    SFLabelValue(
                      label: LocaleKeys.token_consumptions,
                      value:
                          '${info != null ? info.slft : 0} SLFT + ${info != null ? info.slgt ?? 0 : 0} SLGT',
                      styleLabel: TextStyles.lightGrey16,
                      styleValue: TextStyles.textColorSize16,
                    ),
                    const SizedBox(height: 24),
                    SFText(
                      keyText: LocaleKeys.success_rate,
                      style: TextStyles.lightWhite14,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteOpacity5,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AttributeProcessWidget(
                            linkImage: Ics.efficiency,
                            title:
                                '${LocaleKeys.level.tr()} ${info != null ? info.level : 0} ${LocaleKeys.jewel}',
                            totalValue: 100,
                            valueActive: (info?.percent ?? 0).toDouble(),
                            isUpGrade: true,
                          ),
                          AttributeProcessWidget(
                            linkImage: Ics.efficiency,
                            title: LocaleKeys.failure,
                            totalValue: 100,
                            valueActive: 100 - (info?.percent ?? 0).toDouble(),
                            isUpGrade: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 26),
                    SFButton(
                      disabled: !(state is JewelStateLoaded &&
                          state.jewelsUpgrade.isNotEmpty),
                      text: LocaleKeys.upgrade,
                      color: AppColors.blue,
                      textStyle: TextStyles.w600WhiteSize16,
                      onPressed: () {
                        context.read<JewelBloc>().add(const UpgradeJewel());
                      },
                      width: MediaQuery.of(context).size.width,
                    )
                  ],
                ),
                if (state is JewelStateLoaded && state.loading)
                  const LoadingScreen()
              ],
            );
          },
        ),
      ),
    );
  }
}

class JewelSocket extends StatelessWidget {
  const JewelSocket({
    Key? key,
    this.top,
    this.left,
    this.bottom,
    this.right,
    this.jewelEntity,
  }) : super(key: key);
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final JewelEntity? jewelEntity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: GestureDetector(
        onTap: () {
          SFModalBottomSheet.show(context, 0.8,
              ModalJewelList(jewelBloc: context.read<JewelBloc>()));
        },
        child: jewelEntity == null
            ? const SFIcon(Ics.icPlus)
            : Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundDialog,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.lightGrey)),
                child: CachedImage(
                    image: jewelEntity!.image, width: 35, height: 35)),
      ),
    );
  }
}
