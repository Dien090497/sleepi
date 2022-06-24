import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/passcode/passcode_screen.dart';
import 'package:slee_fi/presentation/screens/seed_phrase/layouts/show_seed_phrase_screen.dart';
import 'package:slee_fi/presentation/screens/setting_wallet/widgets/box_info_widget.dart';
import 'package:slee_fi/resources/resources.dart';

class SettingWalletArgument {
  final String  mnemonic;

  SettingWalletArgument(this.mnemonic);
}

class SettingWalletScreen extends StatelessWidget {
  const SettingWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arg =
        ModalRoute.of(context)?.settings.arguments as SettingWalletArgument?;
    return BackgroundWidget(
      appBar: SFAppBar(
        context: context,
        title: LocaleKeys.setting,
        textStyle: TextStyles.bold18LightWhite,
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: [
            BoxInfoWidget(
              urlIcon: Ics.icShieldLock,
              title: LocaleKeys.backup,
              info: LocaleKeys.your_12_word_seed_phrase,
              onTap: () {
                assert(arg != null, "Please send argument");
                Navigator.pushNamed(context, R.passcode).then((value) {
                  if (value == true) {
                    Navigator.pushNamed(context, R.showSeedPhrase,
                        arguments: SeedPhraseArgument(arg!.mnemonic));
                  }
                });
              },
            ),
            BoxInfoWidget(
              urlIcon: Ics.lock,
              title: LocaleKeys.reset_with_passcode,
              info: LocaleKeys.keep_your_assets_safe,
              onTap: () {
                Navigator.pushNamed(context, R.passcode,
                    arguments: PasscodeArguments(R.createPasscode));
              },
            ),
            BoxInfoWidget(
              urlIcon: Ics.icRefresh,
              title: LocaleKeys.restore_wallet,
              info: LocaleKeys.overwrite_your_current_mobile_wallet.tr(),
              onTap: () => Navigator.pushNamed(context, R.restoreWallet),
            ),
          ],
        ),
      ),
    );
  }
}
