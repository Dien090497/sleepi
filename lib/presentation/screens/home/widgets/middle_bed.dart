import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/info_individual/info_individual_screen.dart';

class MiddleBed extends StatefulWidget {
  const MiddleBed({Key? key}) : super(key: key);

  @override
  State<MiddleBed> createState() => _MiddleBedState();
}

class _MiddleBedState extends State<MiddleBed> {
  late int i = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final beds = List.generate(BedType.values.length * 5,
        (i) => BedType.values[i % BedType.values.length]);
    return Column(
      children: [
        SFText(
          keyText: LocaleKeys.main_bed,
          style: TextStyles.white18,
        ),
        const SizedBox(height: 16),
        Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 16,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              SizedBox(
                width: size.width,
                height: 200,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return   Column(
                      children: [
                        SFText(keyText: beds[index].name, style: TextStyles.blue14),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, R.nftInfo,
                                arguments: InfoIndividualParams(buy: true));
                          },
                          child: SFIcon(
                            beds[index].image,
                            height: 180,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ],
                    );
                  },

                  // indicatorLayout: PageIndicatorLayout.COLOR,
                  // autoplay: true,
                  itemCount: beds.length,
                  // pagination:  const SwiperPagination(),
                  control:  const SwiperControl(),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  SFButton(
                    text: 'B1768',
                    textStyle: TextStyles.blue14,
                    color: Colors.white.withOpacity(0.05),
                    radius: 50,
                    height: 36,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SFButton(
                    text: '100/100',
                    textStyle: TextStyles.green14,
                    color: Colors.white.withOpacity(0.05),
                    radius: 50,
                    height: 36,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SFButton(
                    text: 'Lv50',
                    textStyle: TextStyles.yellow14,
                    color: Colors.white.withOpacity(0.05),
                    radius: 50,
                    height: 36,
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 24),
              SFText(
                keyText: '${LocaleKeys.time.tr()}: 6h - 8h',
                style: TextStyles.lightGrey12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
