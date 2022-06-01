import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/setting/widgets/average_info_widget.dart';
import 'package:slee_fi/presentation/screens/setting/widgets/general_widget.dart';
import 'package:slee_fi/presentation/screens/setting/widgets/profile_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: SFAppBar(
            context: context,
            title: LocaleKeys.setting,
            textStyle: TextStyles.bold18LightWhite,
          ),
          body: SafeArea(
            child: ListView(
              children: const [
                AverageInfoWidget(),
                SizedBox(height: 24,),
                GeneralWidget(),
                SizedBox(height: 24,),
                ProfileWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
