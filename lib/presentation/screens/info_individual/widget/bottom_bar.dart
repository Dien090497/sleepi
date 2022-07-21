import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/pop_up_level_up.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_infoIndividual/bottom_bar_infoIndividual_cubit.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_infoIndividual/bottom_bar_infoIndividual_state.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_repair.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_transfer.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/pop_up_sell.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/schema/level_up/level_up_schema.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key, required this.bedEntity}) : super(key: key);
  final BedEntity bedEntity;

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int index = -1;

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
              color:
                  index == i ? AppColors.blue : AppColors.greyBottomIndividual,
            ),
            const SizedBox(
              height: 6,
            ),
            SFText(
              keyText: key,
              style: index == i ? TextStyles.blue12 : TextStyles.lightGrey12,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BottomBarInfoIndividualCubit()..init();

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
                    showSuccessfulDialog(context, null, onBackPress: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        R.bottomNavigation,
                        (r) => false,
                      );
                    });
                  }
                }

                if (state is UpLevelSuccess) {
                  Navigator.pop(context);
                  showSuccessfulDialog(context, null);
                }

                if (state is GetLevelSuccess) {
                  // Navigator.pop(context);
                  index = 0;
                  showCustomDialog(
                    context,
                    children: [
                      PopUpLevelUp(
                          icon: widget.bedEntity.image,
                          level: widget.bedEntity.level,
                          cost: state.levelUp.cost!,
                          requiredTime: state.levelUp.requireTime,
                          sleepTime: state.levelUp.sleepTime,
                          onConfirm: () {
                            showLoadingDialog(context, "Loading");
                            cubit.postLevelUp(
                              LevelUpSchema(
                                bedId: widget.bedEntity.nftId,
                                cost: state.levelUp.cost!,
                              ),
                            );
                          }),
                    ],
                  ).then((value) {
                    cubit.init();
                    index = -1;
                  });
                }
              },
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    itemBottomBar(0, context, Ics.levelUp, LocaleKeys.level_up,
                        () {
                          // showLoadingDialog(context, "Loading");
                          cubit.getLevelUp(widget.bedEntity.nftId);
                        }),
                    itemBottomBar(1, context, Ics.repair, LocaleKeys.repair,
                        () {
                      setState(() {
                        index = 1;
                      });
                      showCustomDialog(
                        context,
                        children: [
                          PopUpRepair(
                            bedEntity: widget.bedEntity,
                            cubit: cubit,
                          ),
                        ],
                      ).then((value) => setState(() {
                            index = -1;
                          }));
                    }),
                    itemBottomBar(2, context, Ics.heart, LocaleKeys.mint, () {
                      setState(() {
                        index = 2;
                      });
                      Navigator.pushNamed(context, R.mint,
                              arguments: widget.bedEntity)
                          .then((value) => setState(() {
                                index = -1;
                              }));
                    }),
                    itemBottomBar(3, context, Ics.shopping, LocaleKeys.sell,
                        () {
                      setState(() {
                        index = 3;
                      });
                      showCustomDialog(context, children: [
                        PopUpSell(
                          bedEntity: widget.bedEntity,
                          cubit: cubit,
                        ),
                      ]).then((value) => setState(() {
                            index = -1;
                          }));
                    }),
                    itemBottomBar(4, context, Ics.recycling, LocaleKeys.recycle,
                        () {
                      setState(() {
                        index = 4;
                      });
                      Navigator.pushNamed(context, R.recycle)
                          .then((value) => setState(() {
                                index = -1;
                              }));
                    }),
                    itemBottomBar(5, context, Ics.transfer, LocaleKeys.transfer,
                        () {
                      setState(() {
                        index = 5;
                      });
                      showCustomDialog(
                        context,
                        children: [
                          PopUpTransfer(
                            onCancel: () {
                              Navigator.pop(context);
                            },
                            valueTransfer: 1,
                            bedEntity: widget.bedEntity,
                            cubit: cubit,
                          )
                        ],
                      ).then((value) => setState(() {
                            index = -1;
                          }));
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
}
