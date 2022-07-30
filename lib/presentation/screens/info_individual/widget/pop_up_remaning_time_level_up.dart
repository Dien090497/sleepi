import 'dart:async';

import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/common/widgets/sf_percent_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/nft_level_up_response/nft_level_up_response.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_infoIndividual/bottom_bar_infoIndividual_cubit.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_infoIndividual/bottom_bar_infoIndividual_state.dart';
import 'package:slee_fi/schema/level_up/level_up_schema.dart';
import 'package:slee_fi/usecase/get_level_up_usecase.dart';

class PopUpRemainingTimeLevelUp extends StatefulWidget {
  const PopUpRemainingTimeLevelUp({
    Key? key,
    required this.bedEntity,
    required this.cubit,
    required this.onLevelUpSuccess,
  }) : super(key: key);
  final BedEntity bedEntity;
  final BottomBarInfoIndividualCubit cubit;
  final Function() onLevelUpSuccess;

  @override
  State<PopUpRemainingTimeLevelUp> createState() =>
      _PopUpRemainingTimeLevelUpState();
}

class _PopUpRemainingTimeLevelUpState extends State<PopUpRemainingTimeLevelUp> {
  late final Timer _time;

  late String remainTime = widget.bedEntity.remainTime!.remainingTime;
  bool isSpeedUp = false;
  final _getLevelUpUC = getIt<GetLevelUpUseCase>();
  double? speedUpCost;

  @override
  void initState() {
    _time = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        remainTime = widget.bedEntity.remainTime!.remainingTime;
      });
      if (remainTime.isEmpty) {
        _time.cancel();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _time.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SFText(
              keyText: LocaleKeys.level_up,
              style: TextStyles.white1w700size16,
            ),
            SFIcon(
              widget.bedEntity.image,
              height: 160,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: SFText(
                  keyText: 'Lv ${widget.bedEntity.level}',
                  style: TextStyles.blue14),
            ),
            const SizedBox(height: 32),
            isSpeedUp
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: SFText(
                      keyText: LocaleKeys.to_speed_up,
                      style: TextStyles.lightGrey14,
                    ),
                  )
                : Row(
                    children: [
                      SFText(
                        keyText: LocaleKeys.level_up_to,
                        style: TextStyles.lightGrey14,
                      ),
                      SFText(
                          keyText: ' Lv ${widget.bedEntity.level + 1}',
                          style: TextStyles.bold14Blue),
                      const Spacer(),
                      Text('${(_percentTime() * 100).toStringAsFixed(2)}%',
                          style: TextStyles.w700LightGreySize14)
                    ],
                  ),
            const SizedBox(height: 8),
            if (!isSpeedUp) ...[
              SFPercentBorderGradient(
                valueActive: _percentTime(),
                totalValue: 1,
                backgroundColor: AppColors.borderDarkColor,
                progressColor: AppColors.green,
                gradient: false,
              ),
              const SizedBox(height: 8),
              SFLabelValue(
                label: LocaleKeys.remaining_time,
                value: remainTime.isNotEmpty ? remainTime : '00:00:00',
                styleValue: TextStyles.textColorSize16,
              ),
            ],
            if (isSpeedUp)
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 24,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: SFText(
                        keyText: LocaleKeys.cost,
                        style: TextStyles.labelStyle,
                      ),
                    ),
                    FutureBuilder<dartz.Either<FailureMessage, NftLevelUp>>(
                      future: _getLevelUpUC.call(widget.bedEntity.nftId),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final data = snapshot.data!
                              .getOrElse(() => NftLevelUp(cost: null));
                          speedUpCost = data.cost;
                          return SFText(
                            keyText: '${speedUpCost ?? ''} SLFT',
                            style: TextStyles.textColorSize16,
                          );
                        }
                        return const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            // if (isSpeedUp)
            //   SFLabelValue(
            //     label: LocaleKeys.cost,
            //     value: '01',
            //     styleValue: TextStyles.textColorSize16,
            //   ),
            const SizedBox(height: 24),
            if (!isSpeedUp)
              SFButton(
                text: remainTime.isEmpty ? LocaleKeys.ok : LocaleKeys.speed_up,
                width: double.infinity,
                onPressed: () {
                  if (remainTime.isEmpty) {
                    Navigator.pop(context);
                    widget.onLevelUpSuccess();
                    return;
                  }
                  _time.cancel();
                  setState(() => isSpeedUp = true);
                },
                textStyle: TextStyles.white16,
                gradient: AppColors.gradientBlueButton,
              ),
            if (isSpeedUp)
              Row(
                children: [
                  Expanded(
                    child: SFButton(
                      text: LocaleKeys.cancel,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      textStyle: TextStyles.lightGrey16,
                      color: AppColors.light4,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: BlocBuilder<BottomBarInfoIndividualCubit,
                        BottomBarInfoIndividualState>(
                      bloc: widget.cubit,
                      builder: (context, state) {
                        if (state is BottomBarInfoIndividualLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return SFButton(
                          text: LocaleKeys.confirm,
                          width: double.infinity,
                          onPressed: () {
                            if (speedUpCost == null) {
                              return;
                            }
                            widget.cubit.speedUpBed(LevelUpSchema(
                              bedId: widget.bedEntity.nftId,
                              cost: speedUpCost!,
                            ));
                          },
                          textStyle: TextStyles.white16,
                          gradient: AppColors.gradientBlueButton,
                        );
                      },
                    ),
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }

  double _percentTime() {
    if (widget.bedEntity.remainTime == null ||
        widget.bedEntity.levelUpTime == null) {
      return 0;
    }
    if (remainTime.isEmpty) {
      return 1;
    }
    final levelUpTime = int.parse(widget.bedEntity.levelUpTime!);
    final totalTime = (int.parse(widget.bedEntity.remainTime!) - levelUpTime);
    final currentTime = DateTime.now().millisecondsSinceEpoch - levelUpTime;
    return currentTime / totalTime;
  }
}
