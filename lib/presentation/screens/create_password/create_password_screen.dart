import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/phoenix.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_textfield_password.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/create_password/create_password_cubit.dart';
import 'package:slee_fi/presentation/blocs/create_password/create_password_state.dart';

class CreatePasswordArg {
  final bool isCreate;
  final String activeCode;
  final int otp;
  final String email;
  final Locale locale;

  CreatePasswordArg(
    this.activeCode,
    this.otp,
    this.email,
    this.isCreate,
    this.locale,
  );
}

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  bool isDisabled = true;

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as CreatePasswordArg;
    return BlocProvider<CreatePasswordCubit>(
      create: (context) => CreatePasswordCubit()
        ..init(arg.email, arg.activeCode, arg.otp, arg.isCreate, arg.locale),
      child: BlocConsumer<CreatePasswordCubit, CreatePasswordState>(
        listener: (context, state) {
          if (state is CreatePasswordStateSuccess) {
            context.setLocale(arg.locale);
            Phoenix.rebirth(context);
          } else if (state is CreatePasswordStateChangePasswrodSuccess) {
            Navigator.pop(context, true);
          }
        },
        builder: (context, state) {
          final cubit = context.read<CreatePasswordCubit>();
          return Stack(
            children: [
              DismissKeyboardWidget(
                child: BackgroundWidget(
                  resizeToAvoidBottomInset: false,
                  appBar: SFAppBar(
                    context: context,
                    title: LocaleKeys.create_password,
                    textStyle: TextStyles.bold18LightWhite,
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 23),
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          Expanded(
                            child: ListView(
                              children: [
                                SFCard(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 24),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      SFTextFieldPassword(
                                        labelText: LocaleKeys.new_password,
                                        valueChanged: (value) =>
                                            cubit.onChangePassword(value),
                                        errorText: state
                                                is CreatePasswordStateErrorPassword
                                            ? state.message
                                            : "",
                                      ),
                                      const SizedBox(height: 10),
                                      SFTextFieldPassword(
                                        labelText: LocaleKeys.confirm_password,
                                        valueChanged: (value) => cubit
                                            .onChangeConfirmPassword(value),
                                        errorText: state
                                                is CreatePasswordStateErrorConfirmPassword
                                            ? state.message
                                            : "",
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                state is CreatePasswordStateErrorCreate
                                    ? Center(
                                        child: Text(
                                        state.message,
                                        style: TextStyles.w400Red12,
                                      ))
                                    : const SizedBox()
                              ],
                            ),
                          ),
                          SFButton(
                            text: LocaleKeys.save,
                            textStyle: TextStyles.w600WhiteSize16,
                            gradient: AppColors.gradientBlueButton,
                            width: double.infinity,
                            // disabled: isDisabled,
                            onPressed: () {
                              cubit.process();
                              // Navigator.pushNamedAndRemoveUntil(
                              //     context, R.bottomNavigation, (_) => false);
                            },
                          ),
                          const SizedBox(height: 26)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              state is CreatePasswordStateProcess
                  ? const LoadingScreen()
                  : const SizedBox()
            ],
          );
        },
      ),
    );
  }
}
