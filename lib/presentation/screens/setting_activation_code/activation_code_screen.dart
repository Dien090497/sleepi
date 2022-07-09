import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/activation_code_setting_cubit/activation_code_setting_cubit.dart';
import 'package:slee_fi/presentation/screens/setting_activation_code/widgets/activation_code_list.dart';
import 'package:slee_fi/presentation/screens/setting_activation_code/widgets/available_widget.dart';

class ActivationCodeScreen extends StatelessWidget {
  const ActivationCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivationCodeSettingCubit()..init(),
      child: BackgroundWidget(
        appBar: SFAppBar(
          context: context,
          title: LocaleKeys.activation_code.reCase(StringCase.titleCase),
          textStyle: TextStyles.bold18LightWhite,
        ),
        child: SafeArea(
          child: Column(
            children: const [
              AvailableWidget(),
              SizedBox(height: 32),
              Expanded(child: ActivationCodeList()),
            ],
          ),
        ),
      ),
    );
  }
}
