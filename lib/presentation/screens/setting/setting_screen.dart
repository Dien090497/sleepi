import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/presentation/screens/setting/widgets/average_info_widget.dart';
import 'package:slee_fi/presentation/screens/setting/widgets/general_widget.dart';
import 'package:slee_fi/presentation/screens/setting/widgets/profile_widget.dart';

import '../../../common/style/text_styles.dart';
import '../../../common/widgets/sf_text.dart';
import '../../../di/translations/keys.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greyBottomNavBar,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: const BorderSide(color: AppColors.black, width: 1),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_circle_left_outlined, color: AppColors.black,size: 40,),
          onPressed: () {},
        ),
        centerTitle: true,
        title: SFText(keyText: Keys.setting, style: TextStyles.bold32black,),
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            AverageInfoWidget(),
            GeneralWidget(),
            ProfileWidget(),
          ],
        ),
      ),
    );
  }
}
