import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
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
        appBar: SFAppBar(
          context: context,
          title: Keys.bedMint,
          textStyle: TextStyles.bold18LightWhite,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 230,
                    child: Stack(
                      alignment: Alignment.center,
                      children: const [
                        SFIcon(Imgs.borderBed),
                        SFIcon(Ics.sleep),
                      ],
                    ),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
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
                    const SFLabelValue(label: Keys.commonBed, value: '100%'),
                    const SizedBox(
                      height: 24,
                    ),
                    SFButton(
                      text: Keys.mint,
                      width: size.width,
                      gradient: AppColors.gradientBlueButton,
                      textStyle: TextStyles.white16,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
