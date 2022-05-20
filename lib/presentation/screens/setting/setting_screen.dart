import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/setting/widgets/average_info_widget.dart';
import 'package:slee_fi/presentation/screens/setting/widgets/general_widget.dart';
import 'package:slee_fi/presentation/screens/setting/widgets/profile_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children:  [
            SFAppBar(
              title: Keys.setting,
              textStyle: TextStyles.bold32black,
              onPressedBack: () => Navigator.pop(context),
            ),
            const AverageInfoWidget(),
            const GeneralWidget(),
            const ProfileWidget(),
          ],
        ),
      ),
    );
  }
}
