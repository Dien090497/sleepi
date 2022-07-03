import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/utils/appsflyer_custom.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/common/widgets/sf_textfield_password.dart';
import 'package:slee_fi/common/widgets/textfield_verification.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/sign_in_sign_up/sign_up_cubit.dart';
import 'package:slee_fi/presentation/blocs/sign_in_sign_up/sign_up_state.dart';
import 'package:slee_fi/presentation/screens/create_password/create_password_screen.dart';
import 'package:slee_fi/presentation/screens/enter_activation_code/enter_activation_code_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountLoginWidget extends StatefulWidget {
  const AccountLoginWidget({Key? key}) : super(key: key);

  @override
  State<AccountLoginWidget> createState() => _AccountLoginState();
}

class _AccountLoginState extends State<AccountLoginWidget> {
  bool isLoginSignup = true;

  void changeStatus() {
    setState(() {
      isLoginSignup = !isLoginSignup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigInSignUpCubit, SignInSignUpState>(
      listener: (context, state) {
        if (state is SignInSignUpStateSignUpSuccess) {
          final cubit = context.read<SigInSignUpCubit>();
          'setting active code is  ${state.enableActiveCode}'.log;
          if (state.enableActiveCode) {
            Navigator.pushNamed(context, R.enterActivationCode,
                arguments: EnterActiveCodeArg(
                  int.parse(cubit.otp),
                  state.userInfoModel,
                ));
          } else {
            Navigator.pushNamed(context, R.createPassword,
                arguments: CreatePasswordArg(
                    '', int.parse(cubit.otp), state.userInfoModel));
          }
        } else if (state is SignInSignUpStateSignInSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context, R.bottomNavigation, (_) => false);
        }
      },
      builder: (context, state) {
        final cubit = context.read<SigInSignUpCubit>();
        return Column(
          children: [
            SFText(
              keyText: isLoginSignup
                  ? LocaleKeys.signup.tr()
                  : LocaleKeys.account_login.tr(),
              style: TextStyles.bold18LightWhite,
              stringCase: StringCase.upperCase,
            ),
            const SizedBox(height: 25),
            SFTextField(
                labelText: LocaleKeys.email_address,
                onChanged: (email) => cubit.email = email),
            const SizedBox(height: 5),
            if (state is SignInSignUpStateErrorEmail)
              Align(
                  alignment: Alignment.centerLeft,
                  child: SFText(
                      keyText: state.message, style: TextStyles.w400Red12)),
            const SizedBox(height: 12),
            isLoginSignup
                ? TextfieldVerificationEmail(
                    maxLength: 6,
                    onPressed: () => cubit.senOtp(),
                    valueChanged: (otp) => cubit.otp = otp)
                : SFTextFieldPassword(
                    labelText: LocaleKeys.password,
                    valueChanged: (password) => cubit.password = password,
                  ),
            const SizedBox(height: 5),
            if (state is SignInSignUpStateError)
              Align(
                  alignment: Alignment.centerLeft,
                  child: SFText(
                    keyText: state.message,
                    style: TextStyles.w400Red12,
                    maxLines: 1,
                  )),
            isLoginSignup
                ? const SizedBox()
                : Align(
                    alignment: Alignment.centerRight,
                    child: SFTextButton(
                      text: LocaleKeys.forgot_password,
                      textStyle: TextStyles.w400lightGrey12,
                      onPressed: () {},
                    ),
                  ),
            SizedBox(height: isLoginSignup ? 24 : 8),
            SFButton(
              text: isLoginSignup ? LocaleKeys.signup.tr() : LocaleKeys.login,
              color: AppColors.blue,
              textStyle: TextStyles.w600WhiteSize16,
              onPressed: () {
                getIt<AppFlyerCustom>().signIn();
                FocusScope.of(context).unfocus();
                if (isLoginSignup) {
                  cubit.signUp();
                } else {
                  cubit.signIn();
                }
              },
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(height: 16),
            SFTextButton(
              text: isLoginSignup
                  ? LocaleKeys.account_login
                  : LocaleKeys.verification_login,
              textStyle: TextStyles.blue14,
              onPressed: () {
                cubit.init();
                changeStatus();
              },
            ),
            const SizedBox(height: 16),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: LocaleKeys.registration_means_that_you_agree_to.tr(),
                style: TextStyles.w400lightGrey12,
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: LocaleKeys.user_agreement.tr(),
                    style: TextStyles.w400Red12,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final url = Uri.parse(Const.sleeFiUrl);
                        if (await canLaunchUrl(url)) {
                          launchUrl(url);
                        }
                      },
                  ),
                  TextSpan(text: ' ${"&".tr()} '),
                  TextSpan(
                    text: LocaleKeys.user_privacy.tr(),
                    style: TextStyles.w400Red12,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final url = Uri.parse(Const.sleeFiUrl);
                        if (await canLaunchUrl(url)) {
                          launchUrl(url);
                        }
                      },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
