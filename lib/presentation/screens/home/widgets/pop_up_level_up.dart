import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';

class PopUpLevelUp extends StatelessWidget {
  const PopUpLevelUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SFDialog(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            SFText(keyText: 'title_level_up'),
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
        Image.asset('assets/images/product_detail.png', width: 100, height: 80,),
        SFText(keyText: 'Lv 30'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SFText(keyText: 'lv up to 31',),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: SFTextField(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: SFTextField(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SFButton(text: 'title_level_up', width: size.width / 3,),
              SFButton(text: 'title_level_up', width: size.width / 3,)
            ],
          ),
        ),
      ],
    );
  }
}
