import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/sf_logo.dart';
import 'package:slee_fi/presentation/screens/login_signup/widgets/account_login_widget.dart';
import 'package:slee_fi/presentation/screens/login_signup/widgets/login_box.dart';

class LoginSignUpScreen extends StatelessWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  void _initJiffy(BuildContext context) async {
    await Jiffy.locale(context.locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    _initJiffy(context);
    return BackgroundWidget(
      child: DismissKeyboardWidget(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            SizedBox(height: 122.h),
            const SFLogo(),
            const SizedBox(height: 50),
            const LoginBox(
              child:  AccountLoginWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
