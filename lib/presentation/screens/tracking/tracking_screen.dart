import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/di/translations/keys.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: SFAppBar(
            context: context,
            title: Keys.tracking,
            textStyle: TextStyles.bold18LightWhite),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Spacer(),
                SFButton(
                  text: Keys.wakeUp,
                  width: double.infinity,
                  color: AppColors.blue,
                  textStyle: TextStyles.w600WhiteSize16,
                  onPressed: (){
                    Navigator.pushNamed(context, R.result);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
