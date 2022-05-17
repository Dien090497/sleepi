import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class MyBedShortWidget extends StatelessWidget {
  const MyBedShortWidget({required this.index, Key? key, this.checkOwner = false, this.width, this.height}) : super(key: key);

  final int index;
  final bool checkOwner;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: width ?? 180,
      height: height ?? 180,
      decoration: const BoxDecoration(
        color: AppColors.greyBottomNavBar,
      ),
      margin: EdgeInsets.only(right: index % 2 == 0 ? 24 : 0, bottom: 24),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.black),
            ),
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            child: SFText(
              keyText: Keys.type,
              style: TextStyles.black10Bold,
            ),
          ),
          checkOwner ? Container(
            width: size.width,
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.black),
            ),
            padding: const EdgeInsets.symmetric(vertical: 3),
          ) : const SizedBox(),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.black),
            ),
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            child: SFText(
              keyText: 'IDIDIDID',
              style: TextStyles.black10Bold,
            ),
          ),
          checkOwner ? const SizedBox() : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SFText(keyText: 'Mint3', style: TextStyles.black10),
                SFText(keyText: 'Level15', style: TextStyles.black10),
              ],
            ),
          ),
          checkOwner ? const SizedBox() : Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.black),
            ),
            padding: const EdgeInsets.symmetric(vertical: 3),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
