import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class MyJewelsShortWidget extends StatelessWidget {
  const MyJewelsShortWidget({required this.index, Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: const BoxDecoration(
        color: AppColors.greyBottomNavBar,
      ),
      margin: EdgeInsets.only(right: index % 2 == 0 ? 24 : 0, bottom: 24),
      padding: const EdgeInsets.only(left: 12, top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SFText(keyText: Keys.level, args: const {'num': '3'}),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: SFText(keyText: '+25%'),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 28),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.black),
            ),
            padding: const EdgeInsets.symmetric(vertical: 6),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
