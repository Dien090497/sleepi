import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_image_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/attributes_widget.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/bottom_bar.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/bottom_bar_market_place.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/box_info_widget.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/mint_from_widget.dart';
import 'package:slee_fi/resources/resources.dart';

class InfoIndividualScreen extends StatelessWidget {
  const InfoIndividualScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as bool;
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            const TopBarCommon(
              iconBack: true,
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 230,
                      child: Stack(
                        alignment: Alignment.center,
                        children: const [
                          SFIcon(Ics.ellipse),
                          SFIcon(Ics.sleep),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SFImageBorder(
                          icon: Imgs.jewelPurple,
                          onTap: () {},
                          radius: 16,
                          size: const Size(75, 75),
                          padding: 20,
                        ),
                        const SizedBox(width: 10,),
                        SFImageBorder(
                          icon: Imgs.jewelGreen,
                          onTap: () {},
                          radius: 16,
                          size: const Size(75, 75),
                          padding: 20,
                        ),
                        const SizedBox(width: 10,),
                        SFImageBorder(
                          icon: Imgs.jewelBlue,
                          onTap: () {},
                          radius: 16,
                          size: const Size(75, 75),
                          padding: 20,
                        ),
                        const SizedBox(width: 10,),
                        SFImageBorder(
                          icon: Imgs.jewelRed,
                          onTap: () {},
                          radius: 16,
                          size: const Size(75, 75),
                          padding: 20,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16,),
                    const BoxInfoWidget(),
                    const SizedBox(height: 24,),
                    SFText(keyText: Keys.attributes, style: TextStyles.bold18LightWhite,),
                    const SizedBox(height: 15,),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: AttributesWidget(),
                    ),
                    const SizedBox(height: 33,),
                    const MintFromWidget(),
                  ],
                ),
              ),
            ),
            args ? const BottomBarMarketPlaceWidget() : const BottomBarWidget(),
          ],
        ),
      ),
    );
  }
}
