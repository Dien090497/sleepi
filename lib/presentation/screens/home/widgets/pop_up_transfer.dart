import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class PopUpTransfer extends StatelessWidget {
  const PopUpTransfer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SFDialog(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            SFText(keyText: 'title_confirm_transfer'),
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
        const SizedBox(height: 50,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.black),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Row(
                children: [
                  SFText(keyText: 'from'),
                  const Spacer(),
                  SFText(keyText: 'to'),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  SFText(keyText: 'inventory'),
                  const Spacer(),
                  SFText(keyText: 'wallet'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            SFText(keyText: 'fee'),
            const Spacer(),
            SFText(keyText: '3 GST'),
          ],
        ),
        const SizedBox(height: 15,),
        Row(
          children: [
            SFText(keyText: 'title_transfer'),
            const Spacer(),
            SFText(keyText: '1 NFT'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SFButton(text: 'button_cancel', width: size.width / 3,),
              SFButton(text: 'button_confirm', width: size.width / 3,)
            ],
          ),
        ),
      ],
    );
  }
}
