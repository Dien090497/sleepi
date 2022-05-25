import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class BoxIndexInfo extends StatelessWidget {
  const BoxIndexInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.greyBottomNavBar
      ),
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SFText(keyText: 'Attributes', style: TextStyles.bold15black,),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 80,child: SFText(keyText: 'Efficiency', style: TextStyles.bold15black), ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.black),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        height: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SFText(keyText: '9999', style: TextStyles.bold15black)
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox( width: 80, child: SFText(keyText: 'Luck', style: TextStyles.bold15black),),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.black),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        height: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SFText(keyText: '9999', style: TextStyles.bold15black)
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 80, child: SFText(keyText: 'Bonus', style: TextStyles.bold15black),),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.black),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        height: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SFText(keyText: '9999', style: TextStyles.bold15black)
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 80, child: SFText(keyText: 'Special', style: TextStyles.bold15black),),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.black),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        height: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SFText(keyText: '9999', style: TextStyles.bold15black)
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 80, child: SFText(keyText: 'Resilience', style: TextStyles.bold15black),),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.black),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        height: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SFText(keyText: '9999', style: TextStyles.bold15black)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
