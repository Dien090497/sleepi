import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/resources/resources.dart';

class MintScreen extends StatefulWidget {
  const MintScreen({Key? key}) : super(key: key);

  @override
  State<MintScreen> createState() => _MintScreenState();
}

class _MintScreenState extends State<MintScreen> {
  bool swCheck = true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          bottom: false,
          child: Column(
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
                        keyText: Keys.bedRecycle,
                        style: TextStyles.boldWhite18,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            width: 188,
                            height: 188,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 13,
                            ),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/borderBed.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: const SFIcon(Ics.sleep),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const SFLabelValue(
                              label: Keys.token, value: '0 SLFT + 0 SLGT'),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${translate(Keys.insurance)}: 5%',
                                style: TextStyles.bold16LightWhite,
                              ),
                              SizedBox(
                                height: 24,
                                child: CupertinoSwitch(
                                  activeColor: AppColors.green,
                                  value: swCheck,
                                  onChanged: (value) {
                                    setState(() {
                                      swCheck = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SFText(
                                keyText: Keys.whatInsurance,
                                style: TextStyles.lightGrey12,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const SFIcon(Ics.icCircleQuestion),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: size.width,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 20,
                        ),
                        decoration: const BoxDecoration(
                          color: AppColors.dark,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SFText(
                              keyText: Keys.withoutCase,
                              style: TextStyles.lightGrey14,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.white.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                children: [
                                  const SFLabelValue(
                                    label: Keys.commonBed,
                                    value: '98%',
                                    colorBorder: Colors.transparent,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Divider(
                                      height: 1,
                                      color: Colors.white.withOpacity(0.05),
                                    ),
                                  ),
                                  const SFLabelValue(
                                    label: Keys.failure,
                                    value: '98%',
                                    colorBorder: Colors.transparent,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            SFText(
                              keyText: Keys.withoutCase,
                              style: TextStyles.lightGrey14,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const SFLabelValue(
                                label: Keys.commonBed, value: '100%'),
                            const SizedBox(
                              height: 24,
                            ),
                            SFButton(
                              text: Keys.mint,
                              width: size.width,
                              gradient: AppColors.gradientBlueButton,
                              textStyle: TextStyles.white16,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
