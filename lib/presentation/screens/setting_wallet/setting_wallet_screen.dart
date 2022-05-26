import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/setting_wallet/widgets/box_info_widget.dart';
import 'package:slee_fi/resources/resources.dart';

class SettingWalletScreen extends StatelessWidget {
  const SettingWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: SFAppBar(context: context,
          title: Keys.setting,
          textStyle: TextStyles.bold18LightWhite,),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: [
              BoxInfoWidget(
                urlIcon: Ics.icShieldLock,
                title: Keys.backup,
                info: Keys.displaysBackupInfo,
                onTap: () {},
              ),
              BoxInfoWidget(
                urlIcon: Ics.lock,
                title: Keys.resetWithPasscode,
                info: Keys.displaysResetWithPasscodeInfo,
                onTap: () {},
              ),
              BoxInfoWidget(
                urlIcon: Ics.icRefresh,
                title: Keys.restoreWallet,
                info: Keys.displaysRestoreWalletInfo,
                onTap: () => Navigator.pushNamed(context, R.restoreWallet),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
