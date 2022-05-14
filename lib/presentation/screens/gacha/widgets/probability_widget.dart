import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class ProbabilityWidget extends StatelessWidget {
  const ProbabilityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.greyBottomNavBar,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                _probabilityDialog(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.black),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: SFText(keyText: Keys.probability),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            height: 83,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }

  void _probabilityDialog(BuildContext ctx) {
    final List<String> titles = [
      Keys.bed,
      Keys.jewels,
      Keys.item,
    ];

    final List<String> bedChances = [
      Keys.commonBed,
      Keys.uncommonBed,
      Keys.rareBed,
      Keys.epicBed,
      Keys.legendaryBed,
    ];

    showDialog(
      context: ctx,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Dialog(
              backgroundColor: AppColors.greyBottomNavBar,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.black),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: SFText(keyText: Keys.probability)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: const Icon(Icons.close),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(6)),
                        border: Border.all(color: AppColors.black),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      alignment: Alignment.center,
                      child: SFText(
                        keyText: Keys.productLineUp,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.black),
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(6)),
                      ),
                      child: Column(
                        children: [
                          _Chances(
                              extraTexts: List.generate(
                                  bedChances.length, (i) => ' 9999%'),
                              title: titles[0],
                              texts: bedChances),
                          _Chances(
                              extraTexts: List.generate(
                                  bedChances.length, (i) => ' 9999%'),
                              title: titles[0],
                              texts: bedChances),
                          _Chances(
                              extraTexts: List.generate(
                                  bedChances.length, (i) => ' 9999%'),
                              title: titles[0],
                              texts: bedChances),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _TitleCol extends StatelessWidget {
  const _TitleCol({Key? key, required this.titles}) : super(key: key);

  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: List.generate(
        titles.length,
        (i) {
          return SFText(keyText: titles[i]);
        },
      ),
    );
  }
}

class _ChancesCol extends StatelessWidget {
  const _ChancesCol({Key? key, required this.texts, required this.extraTexts})
      : super(key: key);

  final List<String> texts;
  final List<String> extraTexts;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        texts.length,
        (i) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SFText(
              keyText: texts[i],
              extraText: extraTexts[i],
            ),
          );
        },
      ),
    );
  }
}

class _Chances extends StatelessWidget {
  const _Chances(
      {Key? key,
      required this.texts,
      required this.extraTexts,
      required this.title})
      : super(key: key);

  final String title;
  final List<String> texts;
  final List<String> extraTexts;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: AppColors.black),
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SFText(keyText: title, toUpperCase: true),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(texts.length, (i) {
                return SFText(
                  keyText: texts[i],
                  extraText: extraTexts[i],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
