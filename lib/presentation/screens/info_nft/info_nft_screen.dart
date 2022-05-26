import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/presentation/screens/info_nft/widget/bottom_bar.dart';
import 'package:slee_fi/presentation/screens/info_nft/widget/bottom_bar_market_place.dart';
import 'package:slee_fi/presentation/screens/info_nft/widget/box_index_info.dart';
import 'package:slee_fi/presentation/screens/info_nft/widget/box_info_nft.dart';
import 'package:slee_fi/presentation/screens/info_nft/widget/mint_from_widget.dart';
import 'package:slee_fi/presentation/screens/info_nft/widget/text_info.dart';

class InfoNftScreen extends StatelessWidget {
  const InfoNftScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as bool;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const TopBarCommon(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  BoxInfoNft(
                    isMarketPlace: args,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: TextInfo(
                      text: 'IDIDIDID',
                      color: AppColors.greyBottomNavBar,
                    ),
                  ),
                  SFText(keyText: 'Time: 6-8h'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: TextInfo(
                                text: 'IDIDIDID',
                                color: AppColors.greyBottomNavBar,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: TextInfo(
                                text: 'IDIDIDID',
                                color: AppColors.greyBottomNavBar,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: TextInfo(
                                text: 'IDIDIDID',
                                color: AppColors.greyBottomNavBar,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextInfo(
                            text: 'IDIDIDID',
                            color: AppColors.greyBottomNavBar,
                            width: size.width,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextInfo(
                            text: 'IDIDIDID',
                            color: AppColors.greyBottomNavBar,
                            width: size.width,
                          ),
                        ),
                        const BoxIndexInfo()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const MintFromWidget(
                    text: 'Minted From',
                  ),
                  const MintFromWidget(
                    text: 'Mints',
                  ),
                ],
              ),
            ),
          ),
          args ? const BottomBarMarketPlaceWidget() : const BottomBarWidget(),
        ],
      ),
    );
  }
}
