import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class WalletCreationWarningScreen extends StatelessWidget {
  const WalletCreationWarningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SFText(keyText: Keys.yourWalletIsBeingMadeRightNow),
                  const SizedBox(height: 12),
                  SFText(
                    keyText: Keys.cautionPleaseCheckYourSeedPhrase,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SFButton(
              text: Keys.next,
              onPressed: () {
                Navigator.pushReplacementNamed(context, R.createPasscode);
              },
            ),
          ],
        ),
      ),
    );
  }
}
