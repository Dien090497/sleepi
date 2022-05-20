import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/pop_up_buy_market_place.dart';

class ItemBedBuyWidget extends StatelessWidget {
  const ItemBedBuyWidget(
      {required this.index,
      Key? key,
      this.width,
      this.height,
      this.checkJewelsOrItems = false})
      : super(key: key);

  final int index;
  final double? width;
  final double? height;
  final bool checkJewelsOrItems;

  @override
  Widget build(BuildContext context) {
    bool isMarketPlace = true;
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: width ?? 180,
      height: height ?? 220,
      decoration: const BoxDecoration(
        color: AppColors.greyBottomNavBar,
      ),
      margin: EdgeInsets.only(right: index % 2 == 0 ? 24 : 0, bottom: 15),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            checkJewelsOrItems
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          SFText(
                            keyText: 'Level 3',
                            style: TextStyles.bold15black,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: SFText(
                              keyText: '+ 25%',
                              style: TextStyles.bold15black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.black),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 20),
                      child: SFText(
                        keyText: 'Short Beds',
                        style: TextStyles.black10Bold,
                      ),
                    ),
                  ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, R.nftInfo, arguments: isMarketPlace);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: size.width,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.black),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                child: SFText(
                  keyText: 'IDIDIDID',
                  style: TextStyles.black10Bold,
                ),
              ),
            ),
            checkJewelsOrItems ? const SizedBox() : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SFText(
                  keyText: 'Mint: 0',
                  style: TextStyles.black10Bold,
                ),
                SFText(
                  keyText: 'LV 0',
                  style: TextStyles.black10Bold,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.black),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SFText(
                      keyText: '10AVAX',
                      style: TextStyles.black10Bold,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SFButton(
                      text: 'Buy',
                      height: 20,
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
          ],
        ),
      ),
    );
  }
}
