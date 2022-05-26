import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class PopUpBuyMarketPlace extends StatelessWidget {
  const PopUpBuyMarketPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SFDialog(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            SFText(keyText: 'buy'),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: Colors.cyanAccent, shape: BoxShape.circle),
              child: const Icon(
                Icons.cancel,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        Image.asset(
          'assets/images/product_detail.png',
          width: 100,
          height: 80,
        ),
        SFText(keyText: '#id'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.greyBottomNavBar,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.black),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.greyBottomNavBar,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.black),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SFButton(
                text: 'button_cancel',
                width: size.width / 3,
              ),
              SFButton(
                text: 'button_confirm',
                width: size.width / 3,
              )
            ],
          ),
        ),
      ],
    );
  }
}
