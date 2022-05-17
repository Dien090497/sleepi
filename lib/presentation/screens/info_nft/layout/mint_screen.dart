import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';

class MintScreen extends StatelessWidget {
  const MintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Colors.cyanAccent, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                    ),
                    SFText( keyText: 'Mint Bed',),
                    const SizedBox(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child:  Column(
                  children: [
                    Container(
                      height: size.height * 0.23,
                      width: size.width,
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/mint_shoe.png'),
                    ),
                    const SizedBox(height: 20,),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SFTextField(hintText: 'Token',),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      height: size.height * 0.22,
                      width: size.width,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      height: size.height * 0.18,
                      width: size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.grey.withOpacity(0.8),
                      ),
                      child: SFText( keyText: 'Text',),
                    ),
                    const SizedBox(height: 20,),
                    SFButton(
                      text: 'mint',
                      onPressed: () {},
                      color: AppColors.grey.withOpacity(0.5),
                      width: size.width,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
