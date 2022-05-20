import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/item_bed_buy_widget.dart';

class TabItemsBuy extends StatelessWidget {
  const TabItemsBuy({Key? key, required this.onPress}) : super(key: key);

  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            height: 50,
            decoration: const BoxDecoration(
                color: AppColors.greyBottomNavBar
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SFText(keyText: 'Low Price ', style: TextStyles.bold15black,),
                GestureDetector(
                  child: SFText(
                    keyText: 'Filter',
                    style: TextStyles.bold15black,
                  ),
                    onTap: () {
                      onPress();
                    }),
              ],
            ),
          ),
        ),
        Expanded(
          child: SFGridView(
            count: 20,
            itemBuilder: (context, i) {
              return ItemBedBuyWidget(index: i, checkJewelsOrItems: true,);
            },
          ),
        ),
      ],
    );
  }
}
