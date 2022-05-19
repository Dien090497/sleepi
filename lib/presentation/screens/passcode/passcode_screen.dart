import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_logo.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/passcode/widgets/passcode_numpad.dart';
import 'package:slee_fi/presentation/screens/passcode/widgets/pin_code_widget.dart';

class PasscodeArguments {
  final String route;

  PasscodeArguments(this.route);
}

class PasscodeScreen extends StatelessWidget {
  const PasscodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as PasscodeArguments?;

    final TextEditingController passcodeController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: const [
                Positioned(left: 10, top: 0, child: SFBackButton()),
                Align(alignment: Alignment.center, child: SFLogo()),
              ],
            ),
            const SizedBox(height: 8),
            SFText(keyText: Keys.enterYourPasscode, style: TextStyles.white12),
            const SizedBox(height: 12),
            PinCodeWidget(controller: passcodeController),
            SizedBox(height: 4.h),
            PasscodeNumPad(
              passcodeController: passcodeController,
              onCompleted: (String passcode) {
                if (args != null) {
                  Navigator.pushNamed(context, args.route);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SFDialog(
                        backgroundColor: AppColors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 24),
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 24),
                              const Spacer(),
                              SFText(
                                keyText: Keys.wallet,
                                prefix: 'SOLANA ',
                                toUpperCase: true,
                              ),
                              const Spacer(),
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.green,
                                ),
                                padding: const EdgeInsets.all(6),
                                child: const Icon(Icons.close, size: 16),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                const SizedBox(height: 24),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, R.createWallet);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      border:
                                          Border.all(color: AppColors.black),
                                    ),
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: SFText(
                                      keyText: Keys.createANewWallet,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, R.importWallet);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      border:
                                          Border.all(color: AppColors.black),
                                    ),
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: SFText(
                                      keyText:
                                          Keys.importAWalletUsingSeedPhrase,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  );
                }
              },
            ),
            SizedBox(height: 8.h),
            SFText(keyText: Keys.forgotPasscode, style: TextStyles.white12),
          ],
        ),
      ),
    );
  }
}
