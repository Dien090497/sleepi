import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/passcode/passcode_screen.dart';
import 'package:slee_fi/presentation/screens/setting_wallet/widgets/box_info_widget.dart';
import 'package:slee_fi/resources/resources.dart';

class SettingWalletScreen extends StatelessWidget {
  const SettingWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: SFAppBar(
          context: context,
          title: LocaleKeys.setting,
          textStyle: TextStyles.bold18LightWhite,
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: [
              BoxInfoWidget(
                urlIcon: Ics.icShieldLock,
                title: LocaleKeys.backup,
                info: LocaleKeys.displaysBackupInfo,
                onTap: () {
                  Navigator.pushNamed(context, R.passcode,
                      arguments: PasscodeArguments(R.seedPhrase));
                },
              ),
              BoxInfoWidget(
                urlIcon: Ics.lock,
                title: LocaleKeys.resetWithPasscode,
                info: LocaleKeys.displaysResetWithPasscodeInfo,
                onTap: () {
                  Navigator.pushNamed(context, R.passcode,
                      arguments: PasscodeArguments(R.createPasscode));
                },
              ),
              BoxInfoWidget(
                urlIcon: Ics.icRefresh,
                title: LocaleKeys.restoreWallet,
                info: LocaleKeys.displaysRestoreWalletInfo,
                onTap: () => Navigator.pushNamed(context, R.restoreWallet),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
