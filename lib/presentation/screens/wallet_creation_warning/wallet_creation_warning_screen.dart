import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

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
                  SFText(keyText: LocaleKeys.yourWalletIsBeingMadeRightNow),
                  const SizedBox(height: 12),
                  SFText(
                    keyText: LocaleKeys.cautionPleaseCheckYourSeedPhrase,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SFButton(
              text: LocaleKeys.next,
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
