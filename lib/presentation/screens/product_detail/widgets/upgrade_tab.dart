import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_bloc.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/atribute_process.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/pop_up_beds_detail.dart';
import 'package:slee_fi/resources/resources.dart';

import 'modal_jewel_list.dart';

class UpGradeTab extends StatelessWidget {
  const UpGradeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
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
                  offset: const Offset(0, 3), // changes position of shadow
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
                  const JewelSocket(top: 28, left: 0, right: 0),
                  const JewelSocket(bottom: 60, right: 40),
                  const JewelSocket(bottom: 60, left: 40),
                ],
              ),
            ),
            const SFLabelValue(
              label: LocaleKeys.token_consumptions,
              value: '0 SLFT + 0 SLGT',
              styleLabel: TextStyles.lightGrey16,
              styleValue: TextStyles.textColorSize16,
            ),
            const SizedBox(
              height: 24,
            ),
            SFText(
              keyText: LocaleKeys.success_rate,
              style: TextStyles.lightWhite14,
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteOpacity5,
                borderRadius: BorderRadius.circular(8),
              ),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AttributeProcessWidget(
                    linkImage: Ics.efficiency,
                    title: '${LocaleKeys.level.tr()} 2 Jewel',
                    totalValue: 10,
                    valueActive: 3.5,
                    isUpGrade: true,
                  ),
                  const AttributeProcessWidget(
                    linkImage: Ics.efficiency,
                    title: LocaleKeys.failure,
                    totalValue: 10,
                    valueActive: 6.5,
                    isUpGrade: true,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 26,
            ),
          ],
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
  }) : super(key: key);
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

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
          // showCustomDialog(context, children: [
          //   PopUpBedsDetail(
          //       icon: Imgs.jewelGreen,
          //       level: 20,
          //       cost: 1,
          //       time: 2,
          //       onCancel: () {
          //         Navigator.pop(context);
          //       },
          //       onConfirm: () {})
          // ]);
        },
        child: const SFIcon(Ics.icPlus),
      ),
    );
  }
}
