import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/common/widgets/sf_textfield_password.dart';
import 'package:slee_fi/common/widgets/textfield_verification.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/sign_in_sign_up/sign_up_cubit.dart';
import 'package:slee_fi/presentation/blocs/sign_in_sign_up/sign_up_state.dart';
import 'package:slee_fi/presentation/screens/create_password/create_password_screen.dart';
import 'package:slee_fi/presentation/screens/enter_activation_code/enter_activation_code_screen.dart';
import 'package:slee_fi/presentation/screens/setting_permission/widgets/healthcare_screen.dart';
import 'package:url_launcher/url_launcher.dart';

enum Action { signUp, signIn, forgotPassword }

class AccountLoginWidget extends StatefulWidget {
  const AccountLoginWidget({Key? key}) : super(key: key);

  @override
  State<AccountLoginWidget> createState() => _AccountLoginState();
}

class _AccountLoginState extends State<AccountLoginWidget> {
  Action action = Action.signUp;

  _changeState(Action action) {
    setState(() => this.action = action);
  }

  String get _title {
    if (action == Action.forgotPassword) {
      return LocaleKeys.forgot_password;
    }

    if (action == Action.signIn) return LocaleKeys.account_login;

    return LocaleKeys.signup;
  }

  bool get _isActiveCode {
    return action == Action.signUp || action == Action.forgotPassword;
  }

  String get _textButton {
    if (action == Action.forgotPassword) return LocaleKeys.send;

    if (action == Action.signIn) return LocaleKeys.login;

    return LocaleKeys.signup;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigInSignUpCubit, SignInSignUpState>(
      listener: (context, state) {
        if (state is SignInSignUpStateSignUpSuccess) {
          final cubit = context.read<SigInSignUpCubit>();
          Navigator.pushNamed(context, R.enterActivationCode,
              arguments: EnterActiveCodeArg(
                int.parse(cubit.otp),
                state.userInfoEntity,
                state.enableActiveCode,
              ));
        } else if (state is SignInSignUpStateSignInSuccess) {
          'sign success ${state.isFirstOpenApp}'.log;
          if (!state.isFirstOpenApp) {
            Navigator.pushNamedAndRemoveUntil(
                context, R.bottomNavigation, (_) => false);
          } else {
            Navigator.pushNamedAndRemoveUntil(
                context, R.healthcarePermission, (_) => false,
                arguments: HealthcareArg(true));
          }
        } else if (state is SignInSignUpStateVerifySuccess) {
          Navigator.pushNamed(context, R.createPassword,
              arguments: CreatePasswordArg(
                '',
                state.otp,
                state.email,
                false,
              )).then((value) => _checkChangePasswordSuccess(value));
        }
      },
      builder: (context, state) {
        final cubit = context.read<SigInSignUpCubit>();
        return Column(
          children: [
            SFText(
              keyText: _title.tr(),
              style: TextStyles.bold18LightWhite,
              stringCase: StringCase.upperCase,
            ),
            const SizedBox(height: 25),
            SFTextField(
                labelText: LocaleKeys.email_address,
                onChanged: (email) => cubit.email = email),
            const SizedBox(height: 5),
            Container(
                alignment: Alignment.centerLeft,
                height: 15,
                child: state is SignInSignUpStateErrorEmail
                    ? SFText(
                        keyText: state.message, style: TextStyles.w400Red12)
                    : const SizedBox()),
            const SizedBox(height: 5),
            _isActiveCode
                ? TextfieldVerificationEmail(
                    maxLength: 6,
                    validate: () => cubit.validateEmail(),
                    onPressed: () => cubit.senOtp(action),
                    errorText:
                        state is SignInSignUpStateError ? state.message : '',
                    valueChanged: (otp) => cubit.otp = otp)
                : SFTextFieldPassword(
                    labelText: LocaleKeys.password,
                    valueChanged: (password) =>
                        cubit.onPasswordChange(password),
                    errorText:
                        state is SignInSignUpStateError ? state.message : '',
                  ),
            const SizedBox(height: 5),

            Container(
              alignment: Alignment.centerRight,
              height: 50,
              child: _isActiveCode
                  ? const SizedBox()
                  : SFTextButton(
                      text: "${LocaleKeys.forgot_password.tr()}?",
                      textStyle: TextStyles.white1w400size12,
                      onPressed: () => _changeState(Action.forgotPassword),
                    ),
            ),
            // SizedBox(height: isLoginSignup ? 24 : 8),
            SFButton(
              text: _textButton.tr(),
              color: AppColors.blue,
              textStyle: TextStyles.w600WhiteSize16,
              onPressed: () {
                cubit.process(action);
                FocusScope.of(context).unfocus();
              },
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(height: 16),
            SFTextButton(
              text: _isActiveCode
                  ? LocaleKeys.account_login
                  : LocaleKeys.verification_login,
              textStyle: TextStyles.blue14,
              onPressed: () {
                cubit.init();
                _changeState(_isActiveCode ? Action.signIn : Action.signUp);
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

  _checkChangePasswordSuccess(dynamic value) {
    if (value == true) {
      _changeState(Action.signIn);
      showSuccessfulDialog(context, LocaleKeys.reset_password_successfully,
          style: TextStyles.bold14White, padding: const EdgeInsets.all(10));
    }
  }
}
