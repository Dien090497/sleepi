import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';

class WirePopUpStaking extends StatelessWidget {
  const WirePopUpStaking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SFDialog(
      children: [
        const Text(
          "Do you really want to (Deposit,Wuthdraw,Compound) XXXX SLFT?",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SFButton(
                text: 'YES', width: size.width / 3,
                onPressed: () {},
              ),
              SFButton(
                text: 'NO', width: size.width / 3,
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ],
    );
  }
}
