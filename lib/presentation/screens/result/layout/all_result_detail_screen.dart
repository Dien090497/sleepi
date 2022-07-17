import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/gacha_spin_response/gacha_gift.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/attributes_widget.dart';
import 'package:slee_fi/resources/resources.dart';

class AllResultDetailArguments {
  final String image;
  final GachaGift? gift;

  AllResultDetailArguments({required this.image, required this.gift});
}

class AllResultDetailScreen extends StatelessWidget {
  const AllResultDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as AllResultDetailArguments?;

    return BackgroundWidget(
      appBar: SFAppBar(
        context: context,
        title: LocaleKeys.all_result,
        textStyle: TextStyles.bold18LightWhite,
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                    Imgs.borderBed,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.purple.withOpacity(0.02),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20)),
                            width: 180,
                            height: 180,
                            child: SizedBox(
                              child: args != null
                                  ? SFIcon(args.image)
                                  : const SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SFButton(
                                text: LocaleKeys.legendary,
                                textStyle: TextStyles.blue14,
                                color: Colors.white.withOpacity(0.1),
                                radius: 50,
                                height: 36,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              SFButton(
                                text: 'D1283',
                                textStyle: TextStyles.lightWhite14,
                                color: Colors.white.withOpacity(0.1),
                                radius: 50,
                                height: 36,
                              ),
                            ],
                          ),
                          const SizedBox(height: 28),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SFText(
                                  keyText: LocaleKeys.attributes,
                                  style: TextStyles.boldWhite18,
                                ),
                                SFButtonOutLined(
                                  title: LocaleKeys.base,
                                  onPressed: () {},
                                  borderColor: AppColors.blue,
                                  textStyle: TextStyles.blue14,
                                  fixedSize: const Size(72, 32),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 13),
                          Column(
                            children:  [
                              AttributesWidget(
                                bonus: args?.gift?.attributes.bonus ?? 0,
                                efficiency: args?.gift?.attributes.efficiency ?? 0,
                                luck: args?.gift?.attributes.luck ?? 0,
                                resilience: args?.gift?.attributes.resilience ?? 0,
                                special: args?.gift?.attributes.special ?? 0,
                              ),
                             const SizedBox(height: 76),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Material(
                color: Colors.transparent,
                child: SafeArea(
                  top: false,
                  child: Container(
                    padding: const EdgeInsets.only(
                        bottom: 20, left: 24, right: 24, top: 12),
                    child: SFButtonOutLined(
                      title: LocaleKeys.return_,
                      fixedSize: const Size(double.infinity, 48),
                      textStyle: TextStyles.blue16,
                      borderColor: AppColors.blue,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
