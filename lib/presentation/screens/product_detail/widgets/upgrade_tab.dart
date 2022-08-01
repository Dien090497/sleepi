import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/cached_image.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/upgrade_jewel_info_response/upgrade_info_response.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_bloc.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_event.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_state.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/atribute_process.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/jewel_dialog_body_upgrade_success.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/jewel_dialog_detail.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/upgrade_broken_dialog.dart';
import 'package:slee_fi/resources/resources.dart';

import 'modal_jewel_list.dart';

class UpGradeTab extends StatefulWidget {
  const UpGradeTab({Key? key, required this.isJewel}) : super(key: key);
  final bool isJewel;

  @override
  State<UpGradeTab> createState() => _UpGradeTabState();
}

class _UpGradeTabState extends State<UpGradeTab> with TickerProviderStateMixin {
  late AnimationController animationController;
  bool loading = false;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this);
    animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        setState(() => loading = false);
        animationController.reset();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JewelBloc, JewelState>(
      listener: (context, state) {
        if (state is JewelStateLoaded) {
          if (state.errorMessage?.isNotEmpty == true) {
            showMessageDialog(context, state.errorMessage!).then((value) {
              context.read<JewelBloc>().add(const ClearJewelSuccess());
            });
          }
          if (state.upgradeSuccess != null) {

            if(state.upgradeSuccess!.status && state.upgradeSuccess!.nftAttribute != null) {
              /// add animation upgrade success in here
              showCustomDialog(
              context,
              padding: const EdgeInsets.all(24),
              backgroundColor: AppColors.transparent,
              children: [
                JewelDialogBodyUpgradeSuccess(
                  jewel: state.upgradeSuccess!.nftAttribute!.toEntity(),
                  isJewel: widget.isJewel,
                ),
              ],
            );
            }else {
              /// add animation upgrade failed in here
              showCustomDialog(
                context,
                padding: const EdgeInsets.all(24),
                backgroundColor: AppColors.transparent,
                children: [
                  UpgradeBrokenDialog(
                    animation: widget.isJewel ? Const.jewelBrokenAnimation : Const.itemBrokenAnimation,
                  ),
                ],
              );
            }

            context.read<JewelBloc>().add(const ClearJewelSuccess());
          }
        }
      },
      builder: (context, state) {
        final UpgradeInfoResponse? info =
        state is JewelStateLoaded && state.upgradeInfoResponse != null
            ? state.upgradeInfoResponse
            : null;
        return Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 30),
                  child: Column(
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
                            offset: const Offset(0, 3),
                          ),
                        ], borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          children: [
                            Visibility(
                              visible: loading,
                              child: Lottie.asset(
                                widget.isJewel
                                    ? 'assets/json/jewel_upgrade.json'
                                    : 'assets/json/item_upgrade.json',
                                controller: animationController,
                                // fit: BoxFit.cover,
                                width: 238,
                                height: 238,
                                // repeat: false,
                                onLoaded: (composition) {
                                  // Configure the AnimationController with the duration of the
                                  // Lottie file and start the animation.
                                  animationController
                                    ..duration = composition.duration
                                    ..forward();
                                },
                              ),
                            ),
                            const SFIcon(Imgs.upgrade, width: 238, height: 238),
                            JewelSocket(
                                isJewel: widget.isJewel,
                                top: 28,
                                left: 0,
                                right: 0,
                                jewelEntity: state is JewelStateLoaded &&
                                    state.jewelsUpgrade.isNotEmpty
                                    ? state.jewelsUpgrade.first
                                    : null),
                            JewelSocket(
                                isJewel: widget.isJewel,
                                bottom: 60,
                                right: 40,
                                jewelEntity: state is JewelStateLoaded &&
                                    state.jewelsUpgrade.isNotEmpty
                                    ? state.jewelsUpgrade[1]
                                    : null),
                            JewelSocket(
                                isJewel: widget.isJewel,
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
                        '${info != null ? info.slft : 0} SLFT ${info != null && info.slgt != null ? ' + ${info.slft} SLGT' : ''} ',
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
                              '${LocaleKeys.level.tr()} ${info != null ? info.level + 1 : 0} ${widget.isJewel ? LocaleKeys.jewel.tr() : LocaleKeys.item.tr()}',
                              totalValue: 100,
                              valueActive: (info?.percent ?? 0).toDouble(),
                              isUpGrade: true,
                            ),
                            AttributeProcessWidget(
                              linkImage: Ics.efficiency,
                              title: LocaleKeys.failure,
                              totalValue: 100,
                              valueActive:
                              100 - (info?.percent ?? 0).toDouble(),
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
                          setState(() => loading = true);
                          context.read<JewelBloc>().add(const UpgradeJewel());
                        },
                        width: MediaQuery.of(context).size.width,
                      )
                    ],
                  )),
            ),
            if (state is JewelStateLoaded && state.loading)
              Container(
                width: double.infinity,
                height: double.infinity,
                color: AppColors.transparent,
                alignment: Alignment.center,
                child: const SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(),
                ),
              )
          ],
        );
      },
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
    required this.isJewel,
  }) : super(key: key);
  final bool isJewel;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final BedEntity? jewelEntity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: GestureDetector(
        onTap: () {
          if (jewelEntity != null) {
            _showJewelDialog(context, jewelEntity!);

            return;
          }
          SFModalBottomSheet.show(
              context,
              0.8,
              ModalJewelList(
                isJewel: isJewel,
                jewelBloc: context.read<JewelBloc>(),
              ));
        },
        child: jewelEntity == null
            ? const SFIcon(Ics.icPlus)
            : Container(
            decoration: BoxDecoration(
                color: AppColors.backgroundDialog,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.borderDarkColor)),
            child: CachedImage(
                image: jewelEntity!.image, width: 35, height: 35)),
      ),
    );
  }

  void _showJewelDialog(BuildContext context, BedEntity jewel) {
    showCustomDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: [
        JewelDialogDetail(
          isJewel: isJewel,
          jewel: jewel,
          textOnSell: LocaleKeys.remove,
          textOnTransfer: LocaleKeys.ok,
          onSellTap: () {
            Navigator.pop(context);
            context.read<JewelBloc>().add(const ClearJewel());
          },
          onTransferTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
