import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/pop_with_result.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_infoIndividual/bottom_bar_infoIndividual_cubit.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_infoIndividual/bottom_bar_infoIndividual_state.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_state.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_cancel_sell.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_repair.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_transfer.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/pop_up_level_up.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/pop_up_sell.dart';
import 'package:slee_fi/presentation/screens/wallet_creation_warning/widgets/pop_up_avalanche_wallet.dart';
import 'package:slee_fi/resources/resources.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget(
      {Key? key, required this.bedEntity, required this.onBackIndividual})
      : super(key: key);
  final BedEntity bedEntity;
  final VoidCallback onBackIndividual;

  @override
  State<BottomBarWidget> createState() => BottomBarWidgetState();
}

class BottomBarWidgetState extends State<BottomBarWidget> {
  int index = -1;

  late BedEntity bedEntity = widget.bedEntity;

  final cubit = BottomBarInfoIndividualCubit()..init();

  void updateBed(bed) {
    bedEntity = bed;
    setState(() {});
  }

  Widget itemBottomBar(int i, BuildContext context, String icon, String key,
      VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SFIcon(
              icon,
              color: index == i
                  ? AppColors.blue
                  : i == 0 && bedEntity.level == 30 ||
                          i == 2 && bedEntity.bedMint == 7 ||
                          i == 1 && bedEntity.durability == 100
                      ? AppColors.lightGrey
                      : AppColors.greyBottomIndividual,
            ),
            const SizedBox(height: 6),
            SFText(
              keyText: key,
              style: index == i
                  ? TextStyles.blue12
                  : i == 0 && bedEntity.level == 30 ||
                          i == 2 && bedEntity.bedMint == 7 ||
                          i == 1 && bedEntity.durability == 100
                      ? TextStyles.lightGrey12
                      : TextStyles.w400LightWhite12,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final stateWalletCubit = context.read<WalletCubit>().state;
    return Material(
      color: AppColors.dark,
      child: SafeArea(
        top: false,
        child: Container(
          decoration: const BoxDecoration(
              color: AppColors.dark,
              border: Border(
                  top: BorderSide(
                width: 1,
                color: AppColors.lightDark,
              ))),
          height: 80,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: BlocProvider(
            create: (_) => cubit,
            child: BlocConsumer<BottomBarInfoIndividualCubit,
                BottomBarInfoIndividualState>(
              listener: (context, state) {
                if (state is BottomBarInfoIndividualError) {
                  showMessageDialog(context, state.message);
                }

                if (state is BottomBarInfoIndividualLoaded) {
                  if (state.successTransfer) {
                    Navigator.pop(context);
                    showSuccessfulDialog(context, null, onBackPress: () {
                      Navigator.pop(context, true);
                    });
                  }
                }
              },
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    itemBottomBar(0, context, Ics.levelUp, LocaleKeys.level_up,
                        () {
                      if (bedEntity.level < 30) {
                        index = 0;
                        showCustomAlertDialog(
                          context,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 32),
                          children: PopUpLevelUp(
                            bedEntity: bedEntity,
                            cubit: cubit,
                          ),
                        ).then((value) {
                          widget.onBackIndividual();
                          index = -1;
                          setState(() {});
                        });
                      }
                    }),
                    itemBottomBar(1, context, Ics.repair, LocaleKeys.repair,
                        () {
                      index = 1;
                      cubit.getRepair(nftId: bedEntity.nftId);
                      showCustomDialog(
                        context,
                        children: [
                          PopUpRepair(
                            bedEntity: bedEntity,
                            cubit: cubit,
                          ),
                        ],
                      ).then((value) {
                        widget.onBackIndividual();
                        index = -1;
                        setState(() {});
                      });
                    }),
                    itemBottomBar(2, context, Ics.heart, LocaleKeys.mint, () {
                      index = 2;
                      Navigator.pushNamed(context, R.mint, arguments: bedEntity)
                          .then((value) {
                        widget.onBackIndividual();
                        index = -1;
                        setState(() {});
                      });
                    }),
                    itemBottomBar(3, context, Ics.shopping, LocaleKeys.sell,
                        () {
                      setState(() {
                        index = 3;
                      });
                      if (bedEntity.isLock == 1) {
                        showCustomDialog(context, children: [
                          CancelSell(
                            bedEntity: bedEntity,
                            cubit: cubit,
                          ),
                        ]).then((value) => setState(() {
                              index = -1;
                            }));
                      } else {
                        showCustomDialog(context, children: [
                          PopUpSell(
                            bedEntity: bedEntity,
                            cubit: cubit,
                          ),
                        ]).then((value) => setState(() {
                              index = -1;
                            }));
                      }
                    }),
                    itemBottomBar(4, context, Ics.recycling, LocaleKeys.recycle,
                        () {
                      index = 4;
                      Navigator.pushNamed(context, R.recycle).then((value) {
                        index = -1;
                        setState(() {});
                      });
                    }),
                    itemBottomBar(5, context, Ics.transfer, LocaleKeys.transfer,
                        () async {
                      index = 5;
                      if (stateWalletCubit is WalletNotExisted) {
                        showCreateOrImportWallet().then(
                            (value) => _showWarningDialog(value, context));
                      } else {
                        cubit.estimateGas(contractAddress: bedEntity.contractAddress);
                        showCustomDialog(
                          context,
                          children: [
                            PopUpTransfer(
                              onCancel: () {
                                Navigator.pop(context);
                              },
                              valueTransfer: 1,
                              bedEntity: bedEntity,
                              cubit: cubit,
                            )
                          ],
                        ).then((value) {
                          index = -1;
                          setState(() {});
                        });
                      }
                    }),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  showCreateOrImportWallet() async {
    return showCustomAlertDialog(
      context,
      barrierDismissible: false,
      children: const PopUpAvalancheWallet(),
    );
  }

  void _showWarningDialog(dynamic value, BuildContext context) {
    if (value is PopWithResults) {
      final cubit = context.read<WalletCubit>();
      cubit.importWallet(value.results);
    }
  }
}
