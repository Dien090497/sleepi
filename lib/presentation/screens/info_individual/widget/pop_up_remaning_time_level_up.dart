// import 'package:flutter/material.dart';
// import 'package:slee_fi/common/style/app_colors.dart';
// import 'package:slee_fi/common/style/text_styles.dart';
// import 'package:slee_fi/common/widgets/sf_buttons.dart';
// import 'package:slee_fi/common/widgets/sf_icon.dart';
// import 'package:slee_fi/common/widgets/sf_label_value.dart';
// import 'package:slee_fi/common/widgets/sf_text.dart';
// import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
// import 'package:slee_fi/l10n/locale_keys.g.dart';
// import 'package:slee_fi/schema/level_up/level_up_schema.dart';
//
// class PopUpRemainingTimeLevelUp extends StatelessWidget {
//   const PopUpRemainingTimeLevelUp({Key? key, required this.bedEntity})
//       : super(key: key);
//   final BedEntity bedEntity;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Column(
//           children: [
//             SFText(
//               keyText: LocaleKeys.level_up,
//               style: TextStyles.white1w700size16,
//             ),
//             SFIcon(
//               bedEntity.image,
//               height: 160,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 color: AppColors.blue.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(100),
//               ),
//               padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//               child: SFText(
//                   keyText: 'Lv ${bedEntity.level}', style: TextStyles.blue14),
//             ),
//             const SizedBox(height: 32),
//             Row(
//               children: [
//                 SFText(
//                   keyText: LocaleKeys.level_up_to,
//                   style: TextStyles.lightGrey14,
//                 ),
//                 SFText(
//                     keyText: ' Lv ${bedEntity.level + 1}',
//                     style: TextStyles.bold14Blue)
//               ],
//             ),
//             const SizedBox(height: 8),
//             SFLabelValue(
//               label: LocaleKeys.rema,
//               value: '${state.levelUp.cost} SLFT',
//               styleValue: TextStyles.textColorSize16,
//             ),
//             const SizedBox(height: 8),
//             const SizedBox(height: 24),
//             Row(
//               children: [
//                 Expanded(
//                   child: SFButton(
//                     text: LocaleKeys.cancel,
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     textStyle: TextStyles.lightGrey16,
//                     color: AppColors.light4,
//                     width: double.infinity,
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: SFButton(
//                     text: LocaleKeys.confirm,
//                     width: double.infinity,
//                     onPressed: () {
//                       // cubit.postLevelUp(
//                       //   LevelUpSchema(
//                       //     bedId: bedEntity.nftId,
//                       //     cost: state.levelUp.cost!,
//                       //   ),
//                       // );
//                     },
//                     textStyle: TextStyles.white16,
//                     gradient: AppColors.gradientBlueButton,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
