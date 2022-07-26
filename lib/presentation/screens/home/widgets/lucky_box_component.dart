import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/entities/lucky_box/lucky_box_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/lucky_box/lucky_box_cubit.dart';
import 'package:slee_fi/presentation/blocs/lucky_box/lucky_box_state.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/popup_staking.dart';
import 'package:slee_fi/resources/resources.dart';

import 'pop_up_confirm_speed_up.dart';
import 'popup_open_lucky_box.dart';

class LuckyBox extends StatefulWidget {
  const LuckyBox({Key? key}) : super(key: key);

  @override
  State<LuckyBox> createState() => _LuckyBoxState();
}

class _LuckyBoxState extends State<LuckyBox> {
  late final Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LuckyBoxCubit, LuckyBoxState>(
      builder: (context, state) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          6,
          (index) => _ViewGif(
            index: index,
            entity: _boxWithIndex(state, index),
            cubit: context.read<LuckyBoxCubit>(),
          ),
        ),
      ),
    );
  }

  LuckyBoxEntity? _boxWithIndex(LuckyBoxState state, int index) {
    return state.luckyBoxes.length > index ? state.luckyBoxes[index] : null;
  }
}

class _ViewGif extends StatelessWidget {
  const _ViewGif(
      {Key? key,
      required this.index,
      required this.entity,
      required this.cubit})
      : super(key: key);
  final LuckyBoxEntity? entity;

  final LuckyBoxCubit cubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_timeLeft(), style: const TextStyle(fontSize: 10)),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () => _onTap(context),
          child: Container(
            width: 48,
            height: 48,
            padding: EdgeInsets.all(entity != null ? 0 : 12),
            decoration: BoxDecoration(
              color: AppColors.darkColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderDarkColor, width: 1),
            ),
            child: SFIcon(
              entity != null ? Const.luckyBoxes[index % 5] : Ics.gift,
              color: entity != null ? null : AppColors.borderDarkColor,
            ),
          ),
        )
      ],
    );
  }

  String _timeLeft() {
    if (entity == null || entity!.isOpen == 1) return '';
    final timeOpen =
        DateTime.fromMillisecondsSinceEpoch(int.parse(entity!.waitingTime));

    final duration = timeOpen.difference(DateTime.now());
    final hour = (duration.inHours).toString().padLeft(2, '0');
    final minute = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final second = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    if (timeOpen.isBefore(DateTime.now())) {
      return '';
    }
    return '$hour:$minute:$second';
  }

  void _onTap(BuildContext context) async {
    if (entity != null) {
      final openTime =
          DateTime.fromMillisecondsSinceEpoch(int.parse(entity!.waitingTime));

      if (openTime.isBefore(DateTime.now())) {
        showCustomDialog(context, children: [
          PopUpStaking(
              message: LocaleKeys.do_you_want_open_the_lucky_box
                  .tr(args: [entity!.openCost]),
              onPressed: () async {
                final message = await cubit.openLuckyBox(entity!);
                showSuccessfulDialog(context, message);
              })
        ]);
      } else {
        _showPopUpInfoLuckyBox(
          context,
          Const.luckyBoxes[index % 5],
          entity!.waitingTime,
          entity!.id,
        );
      }
    }
  }

  void _showPopUpInfoLuckyBox(
      BuildContext context, String image, String waitingTime, int id) {
    final timeOpen =
        DateTime.fromMillisecondsSinceEpoch(int.parse(entity!.waitingTime));
    final timeLeft = timeOpen.difference(DateTime.now());
    final speedUpCost =
        '${timeLeft.inHours > 48 ? timeLeft.inMinutes * 0.0047 : timeLeft.inMinutes * 0.0044}';

    showCustomAlertDialog(context,
        padding: const EdgeInsets.all(24),
        children: PopUpOpenLuckyBox(
            cost: speedUpCost,
            image: image,
            id: id,
            waitingTime: waitingTime,
            onConfirm: () {
              _showConfirmSpeedUp(context, speedUpCost);
            }));
  }

  void _showConfirmSpeedUp(BuildContext context, String amount) {
    showCustomAlertDialog(context,
        padding: const EdgeInsets.all(24),
        children: PupUpConfirmSpeedUp(
          amount: amount,
          onConfirm: () async {
            final message =
                await context.read<LuckyBoxCubit>().speedUpLuckyBox(index);
            showMessageDialog(context, message);
          },
        ));
  }
}