import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class ModalTransferBetween extends StatelessWidget {
  const ModalTransferBetween({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List keyList = [Keys.avax, Keys.slft, Keys.slgt, Keys.bed, Keys.jewels, Keys.bedBox];
    return Container(
        height: MediaQuery.of(context).copyWith().size.height*0.7,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child:  ListView.builder(
            itemCount: keyList.length,
            shrinkWrap: true,
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (BuildContext context,int index){
              return Card(
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: const BorderSide(width: 2, color: AppColors.black),
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width : 148,
                        height: 48,
                        decoration: const BoxDecoration(
                            color: AppColors.greyBottomNavBar),
                        child: Center(child: SFText(keyText: keyList[index], style: TextStyles.bold28black)),
                      ),
                    ],
                  ),
                ),
              );
            }
        ),
    );
  }
}
