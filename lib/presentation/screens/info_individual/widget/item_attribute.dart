import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class ItemAttribute extends StatelessWidget {
  const ItemAttribute({
    Key? key,
    required this.title,
    required this.valueActive,
    required this.linkImage,
    this.colorIcon,
  }) : super(key: key);

  final String title;
  final double valueActive;
  final String linkImage;
  final Color? colorIcon;

  Color checkColor(int i) {
    if (valueActive > 0 && i == 0) {
      return AppColors.rank1;
    } else if (valueActive > 2 && i == 1) {
      return AppColors.rank2;
    } else if (valueActive > 4 && i == 2) {
      return AppColors.rank3;
    } else if (valueActive > 6 && i == 3) {
      return AppColors.rank4;
    } else if (valueActive > 8 && i == 4) {
      return AppColors.rank5;
    }
    return AppColors.light4;
  }

  Widget itemValueActive(int i) {
    return Stack(
      children: [
        Container(
          width: 16,
          height: 6,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: checkColor(i),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        // if ((i + 1) * 2 - valueActive < 2)
        //   Container(
        //     width: (valueActive - (i + 1) * 2) >= 0
        //         ? 16
        //         : (valueActive - i * 2) * 8,
        //     height: 6,
        //     decoration: BoxDecoration(
        //       color: checkColor(i),
        //       borderRadius: BorderRadius.circular(3),
        //     ),
        //   )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SFIcon(
            linkImage,
            width: 12,
            height: 12,
            color: colorIcon,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 2,
            child: SFText(
              keyText: title,
              style: TextStyles.lightGrey14,
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                itemValueActive(0),
                itemValueActive(1),
                itemValueActive(2),
                itemValueActive(3),
                itemValueActive(4),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '$valueActive',
              style: TextStyles.w700TextColorSize14,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
