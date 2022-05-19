import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class PopUpStaking extends StatelessWidget {
  const PopUpStaking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SFDialog(
      children: [
        SFText(keyText: Keys.displaysMessageFromPopUpStaking,style: TextStyles.bold20black,
          textAlign: TextAlign.center,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SFButton(
                text: Keys.yes, width: size.width / 3,
                onPressed: () {},
              ),
              SFButton(
                text: Keys.no, width: size.width / 3,
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ],
    );
  }
}
