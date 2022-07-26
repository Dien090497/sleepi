import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class ItemAttribute extends StatelessWidget {
  const ItemAttribute({
    Key? key,
    required this.title,
    required this.valueActive,
    required this.totalValue,
    required this.linkImage,
    required this.colorIcon,
  }) : super(key: key);

  final String title;
  final double valueActive;
  final double totalValue;
  final String linkImage;
  final Color colorIcon;

  Color checkColor(int i) {
    double range = totalValue/5;
    if (valueActive > 0 && i == 0) {
      return colorIcon.withOpacity(0.5);
    } else if (valueActive > range && i == 1) {
      return colorIcon.withOpacity(0.6);
    } else if (valueActive > (range*2) && i == 2) {
      return colorIcon.withOpacity(0.7);
    } else if (valueActive > (range*3) && i == 3) {
      return colorIcon.withOpacity(0.8);
    } else if (valueActive > (range*4) && i == 4) {
      return colorIcon;
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
            borderRadius: BorderRadius.circular(1),
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
              valueActive.formatBalanceToken,
              style: TextStyles.w700TextColorSize14,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
