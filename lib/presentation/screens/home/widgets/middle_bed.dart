import 'package:flutter/material.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

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
              SFText(
                keyText: '${beds[i].name} Bed',
                style: TextStyles.blue14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        if (i != 0) {
                          i -= 1;
                        }
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.lightGrey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, R.nftInfo,
                            arguments: false);
                      },
                      child: SFIcon(
                        beds[i].image,
                        height: 180,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (i != beds.length - 1) {
                          i += 1;
                        }
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: AppColors.lightGrey,
                      ),
                    ),
                  ],
                ),
              ),
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
                    text: 'Lv9999',
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
                keyText: 'Time: 6h - 8h',
                style: TextStyles.lightGrey12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
