import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/email_textfield.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield_password.dart';
import 'package:slee_fi/common/widgets/textfield_verification.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/sign_in_sign_up/sign_up_cubit.dart';
import 'package:slee_fi/presentation/blocs/sign_in_sign_up/sign_up_state.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:slee_fi/presentation/screens/create_password/create_password_screen.dart';
import 'package:slee_fi/presentation/screens/enter_activation_code/enter_activation_code_screen.dart';
import 'package:slee_fi/presentation/screens/enter_activation_code/widgets/checkbox_letter_widget.dart';
import 'package:slee_fi/presentation/screens/setting_permission/widgets/healthcare_screen.dart';
import 'package:slee_fi/presentation/screens/tracking/tracking_screen.dart';

enum Action { signUp, signIn, forgotPassword }

class AccountLoginWidget extends StatefulWidget {
  const AccountLoginWidget({Key? key}) : super(key: key);

  @override
  State<AccountLoginWidget> createState() => _AccountLoginState();
}

class _AccountLoginState extends State<AccountLoginWidget> {
  Action action = Action.signIn;

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
          BlocProvider.of<UserBloc>(context).add(UpdateUserOrListToken(
              userInfoEntity: state.userInfoEntity,
              listTokens: state.listToken));
          final cubit = context.read<SigInSignUpCubit>();
          Navigator.pushNamed(context, R.enterActivationCode,
              arguments: EnterActiveCodeArg(
                int.parse(cubit.otp),
                state.userInfoEntity,
                state.enableActiveCode,
              )).then((locale) {
            if (locale is Locale) {
              final currentLocale = context.locale;
              if (currentLocale != locale) {
                action = Action.signIn;
                _showPopUpSignUpSuccess().then((_) {
                  context.setLocale(locale);
                });
              } else {
                _changeState(Action.signIn);
                _showPopUpSignUpSuccess();
              }
            }
          });
        } else if (state is SignInSignUpStateSignInSuccess) {
          BlocProvider.of<UserBloc>(context).add(UpdateUserOrListToken(
              userInfoEntity: state.userInfoEntity,
              listTokens: state.listToken));
          if (!state.isFirstOpenApp) {
            if (state.userStatusTrackingModel.tracking != null) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                R.tracking,
                (r) => false,
                arguments: TrackingParams(
                  timeStart:
                      state.userStatusTrackingModel.tracking!.startSleep! *
                          1000,
                  timeWakeUp:
                      state.userStatusTrackingModel.tracking!.wakeUp! * 1000,
                  tokenEarn:
                      state.userStatusTrackingModel.tracking!.estEarn == null
                          ? 0
                          : double.parse(
                              state.userStatusTrackingModel.tracking!.estEarn!),
                  fromRoute: R.splash,
                  imageBed: state.userStatusTrackingModel.tracking?.bedImage,
                  enableAlarm:
                      state.userStatusTrackingModel.tracking?.alrm ?? true,
                ),
              );
            } else {
              Navigator.pushNamedAndRemoveUntil(
                  context, R.bottomNavigation, (_) => false);
            }
          } else {
            Navigator.pushNamedAndRemoveUntil(
                context, R.healthcarePermission, (_) => false,
                arguments: HealthcareArg(true, state.userInfoEntity.email));
          }
        } else if (state is SignInSignUpStateVerifySuccess) {
          Navigator.pushNamed(context, R.createPassword,
                  arguments: CreatePasswordArg(
                      '', state.otp, state.email, false, context.locale))
              .then((value) => _checkChangePasswordSuccess(value));
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
            EmailTextField(
              onTextChange: (email) {
                cubit.onChangeEmail(email);
              },
            ),
            const SizedBox(height: 5),
            if (state is SignInSignUpStateErrorEmail)
              Align(
                  alignment: Alignment.centerLeft,
                  child: SFText(
                      maxLines: 2,
                      keyText: state.message,
                      style: TextStyles.w400Red12)),
            const SizedBox(height: 5),
            _isActiveCode
                ? TextfieldVerificationEmail(
                    maxLength: 6,
                    validate: () => cubit.validateEmail(),
                    onPressed: () => cubit.senOtp(action),
                    errorText:
                        state is SignInSignUpStateError ? state.message : '',
                    valueChanged: (otp) => cubit.onChangeOTP(otp))
                : SFTextFieldPassword(
                    labelText: LocaleKeys.password,
                    valueChanged: (password) =>
                        cubit.onPasswordChange(password),
                    errorText:
                        state is SignInSignUpStateError ? state.message : '',
                  ),
            SizedBox(height: _isActiveCode ? 12 : 0),
            if (action == Action.signUp) const CheckBoxLetterWidget(),
            SizedBox(height: _isActiveCode ? 12 : 0),
            if (!_isActiveCode && action == Action.signIn)
              Container(
                alignment: Alignment.centerRight,
                height: 50,
                child: SFTextButton(
                  text: "${LocaleKeys.forgot_password.tr()}?",
                  textStyle: TextStyles.white1w400size12,
                  onPressed: () {
                    _changeState(Action.forgotPassword);
                    cubit.init();
                  },
                ),
              ),
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
              text:
                  _isActiveCode ? LocaleKeys.account_login : LocaleKeys.signup,
              textStyle: TextStyles.blue14,
              onPressed: () {
                cubit.init();
                _changeState(_isActiveCode ? Action.signIn : Action.signUp);
              },
            ),
            const SizedBox(height: 16),
            if (action == Action.signUp)
              Localizations.localeOf(context).toLanguageTag().isJapanese
                  ? Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: LocaleKeys.registration_means_that_you_agree_to
                            .tr(),
                        style: TextStyles.w400lightGrey12,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            // final url = Uri.parse(Const.sleeFiUrl);
                            // if (await canLaunchUrl(url)) {
                            //   launchUrl(url);
                            // }
                          },
                        children: [
                          const TextSpan(text: ' '),
                          TextSpan(
                            text: LocaleKeys.user_agreement.tr(),
                            style: TextStyles.w400Red12,
                          ),
                          TextSpan(text: ' ${"と".tr()} '),
                          TextSpan(
                            text: LocaleKeys.user_privacy.tr(),
                            style: TextStyles.w400Red12,
                          ),
                          const TextSpan(text: ' '),
                          TextSpan(
                            text: LocaleKeys
                                .registration_means_that_you_agree_to_ja
                                .tr(),
                            style: TextStyles.w400lightGrey12,
                          ),
                        ],
                      ),
                    )
                  : Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: LocaleKeys.registration_means_that_you_agree_to
                            .tr(),
                        style: TextStyles.w400lightGrey12,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            // final url = Uri.parse(Const.sleeFiUrl);
                            // if (await canLaunchUrl(url)) {
                            //   launchUrl(url);
                            // }
                          },
                        children: [
                          const TextSpan(text: ' '),
                          TextSpan(
                            text: LocaleKeys.user_agreement.tr(),
                            style: TextStyles.w400Red12,
                          ),
                          TextSpan(text: ' ${"&".tr()} '),
                          TextSpan(
                            text: LocaleKeys.user_privacy.tr(),
                            style: TextStyles.w400Red12,
                          ),
                        ],
                      ),
                    )
          ],
        );
      },
    );
  }

  Future<void> _showPopUpSignUpSuccess() async {
    await showSignUpSuccess(context, null);
  }

  void _checkChangePasswordSuccess(dynamic value) {
    if (value == true) {
      _changeState(Action.signIn);
      showSuccessfulDialog(context, LocaleKeys.reset_password_successfully,
          style: TextStyles.bold14White, padding: const EdgeInsets.all(10));
    }
  }
}
