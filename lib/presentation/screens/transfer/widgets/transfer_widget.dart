import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/setting_activation_code/widgets/container_box_widget.dart';
import 'package:slee_fi/resources/resources.dart';

class TransferWidget extends StatefulWidget {
  const TransferWidget({Key? key}) : super(key: key);

  @override
  State<TransferWidget> createState() => _TransferWidgetState();
}

class _TransferWidgetState extends State<TransferWidget> {
  bool swapText = false;

  @override
  Widget build(BuildContext context) {
    return ContainerBoxWidget(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.2,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child:  Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(Ics.icArrowUpRight, color: AppColors.blue,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SFText(keyText: Keys.from, style: TextStyles.lightGrey12,),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: SFText(keyText: swapText ? Keys.spending : Keys.wallet, style: TextStyles.bold18White),
                  )
                ],
              ),
              Row(
                children:  [
                  Expanded(child: Divider(height: 1, color: AppColors.white.withOpacity(0.05),)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        swapText = !swapText;
                      });
                    },
                    child:  const CircleAvatar(
                      backgroundColor: AppColors.blue,
                      child: Icon(Icons.swap_vert, size: 30, color: AppColors.white,),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(Ics.icWallet, color: AppColors.blue,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SFText(
                            keyText: Keys.to,
                            style: TextStyles.grey14Italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: SFText(keyText: swapText ? Keys.wallet : Keys.spending, style: TextStyles.bold18White,),
                  )
                ],
              ),
            ]
        )
    );
  }
}
