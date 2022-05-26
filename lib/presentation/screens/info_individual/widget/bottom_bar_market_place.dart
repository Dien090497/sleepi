import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/pop_up_buy_market_place.dart';

class BottomBarMarketPlaceWidget extends StatelessWidget {
  const BottomBarMarketPlaceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.greyBottomNavBar,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: AppColors.primary)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SFText(keyText: '12.45 SOL'),
              SFButton(
                text: 'Buy Now',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const PopUpBuyMarketPlace();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
