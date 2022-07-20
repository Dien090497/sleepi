import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_tab_bar.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/beds_probability.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/item_probability.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/jewels_probability.dart';
import 'package:slee_fi/resources/resources.dart';

class ProbabilityScreen extends StatelessWidget {
  const ProbabilityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 16,
                  right: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const SFIcon(
                        Ics.arrowLeft,
                        width: 32,
                        height: 32,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SFText(
                        keyText: LocaleKeys.probability,
                        style: TextStyles.boldWhite18,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Expanded(
                child: SFTabBar(
                  isScrollable: true,
                  texts: [
                    LocaleKeys.bed,
                    LocaleKeys.jewels,
                    LocaleKeys.item,
                    LocaleKeys.trophy
                  ],
                  children: [
                    BedsProbability(),
                    JewelsProbability(),
                    ItemProbability(),
                    SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
