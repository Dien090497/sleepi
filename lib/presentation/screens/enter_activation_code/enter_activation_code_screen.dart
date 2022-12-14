import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_dropdown_rotation.dart';
import 'package:slee_fi/common/widgets/sf_logo.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/entities/user/user_info_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/activation_code/activation_code_cubit.dart';
import 'package:slee_fi/presentation/blocs/activation_code/activation_code_state.dart';
import 'package:slee_fi/presentation/screens/create_password/create_password_screen.dart';
import 'package:slee_fi/presentation/screens/login_signup/widgets/login_box.dart';

class EnterActiveCodeArg {
  final int otp;
  final UserInfoEntity userInfoEntity;
  final bool isEnable;

  EnterActiveCodeArg(this.otp, this.userInfoEntity, this.isEnable);
}

class EnterActivationCodeScreen extends StatelessWidget {
  const EnterActivationCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)?.settings.arguments as EnterActiveCodeArg;
    final locale = context.locale;
    return BlocProvider(
      create: (context) => ActivationCodeCubit()..init(arg, locale),
      child: Stack(
        children: [
          DismissKeyboardWidget(
            child: BackgroundWidget(
              appBar: SFAppBar(
                  context: context,
                  title:
                      "${LocaleKeys.activation_code.tr()}/${LocaleKeys.language.tr()}",
                  textStyle: TextStyles.bold18LightWhite),
              child: SafeArea(
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                    LoginBox(
                      padding: const EdgeInsets.fromLTRB(28, 24, 28, 0),
                      child: BlocConsumer<ActivationCodeCubit,
                          ActivationCodeState>(
                        listener: (context, state) {
                          if (state is ActivationCodeStateActiveSuccess) {
                            _nexStep(
                                context,
                                CreatePasswordArg(
                                    state.activationCode,
                                    arg.otp,
                                    arg.userInfoEntity.email,
                                    true,
                                    state.localeSelected));
                          }
                        },
                        builder: (context, state) {
                          final cubit = context.read<ActivationCodeCubit>();
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SFLogo(),
                              const SizedBox(height: 40),
                              SFTextField(
                                onChanged: (value) {
                                  cubit.activationCode = value;
                                },
                                labelText: LocaleKeys
                                    .please_enter_your_activation_code,
                                textInputType: TextInputType.number,
                                errorText: state is ActivationCodeStateError
                                    ? state.message
                                    : '',
                              ),
                              const SizedBox(height: 20),
                              SFText(
                                  keyText:
                                      LocaleKeys.please_select_your_language,
                                  style: TextStyles.lightGrey14),
                              const SizedBox(height: 4),
                              SizedBox(
                                  width: double.infinity,
                                  height: 48,
                                  child: SFDropDownRotation<String>(
                                    value: context.locale.displayName,
                                    dropdownWidth:
                                        MediaQuery.of(context).size.width * 0.8,
                                    dropdownHeight: 48,
                                    selectedItemHighlightColor:
                                        AppColors.lightDark,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    spinnerItems: List.generate(
                                      Const.locales.length,
                                      (i) => Const.locales[i].displayName,
                                    ),
                                    onChange: (int value, int index) {
                                      cubit.localeSelected =
                                          Const.locales[index];
                                      showChangeLanguageDialog(context, locale: Const.locales[index]);
                                    },
                                  )),
                              const SizedBox(height: 12),
                              SFButton(
                                text: LocaleKeys.start,
                                color: AppColors.blue,
                                textStyle: TextStyles.white1w700size16,
                                onPressed: () {
                                  if (arg.isEnable) {
                                    cubit.checkActiveCode();
                                  } else {
                                    _nexStep(
                                        context,
                                        CreatePasswordArg(
                                            '',
                                            arg.otp,
                                            arg.userInfoEntity.email,
                                            true,
                                            cubit.localeSelected));
                                  }
                                },
                                width: MediaQuery.of(context).size.width,
                              ),
                              const SizedBox(height: 16),
                              Center(
                                child: SFTextButton(
                                  text: LocaleKeys.get_activation_code,
                                  textStyle: TextStyles.blue14,
                                  onPressed: () async {
                                    Navigator.pushNamed(context, R.webView);
                                    // final url = Uri.parse(Const.linkTreeUrl);
                                    // if (await canLaunchUrl(url)) {
                                    //   launchUrl(url);
                                    // }
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
          BlocBuilder<ActivationCodeCubit, ActivationCodeState>(
            builder: (context, state) {
              return state is ActivationCodeStateProcess
                  ? const LoadingScreen()
                  : const SizedBox();
            },
          )
        ],
      ),
    );
  }

  _nexStep(BuildContext context, CreatePasswordArg createPasswordArg) {
    Navigator.pushNamed(context, R.createPassword,
        arguments: createPasswordArg);
  }
}
