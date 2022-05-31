import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/setting_activation_code/widgets/activation_code_list.dart';
import 'package:slee_fi/presentation/screens/setting_activation_code/widgets/available_widget.dart';

class ActivationCodeScreen extends StatelessWidget {
  const ActivationCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: SFAppBar(
          context: context,
          title: LocaleKeys.activationCode,
          textStyle: TextStyles.bold18LightWhite,
          toUpperCase: true,
        ),
        body: SafeArea(
          child: Column(
            children: const [
              AvailableWidget(),
              SizedBox(
                height: 32,
              ),
              Expanded(child: ActivationCodeList()),
              // ActivationCodeList(),
            ],
          ),
        ),
      ),
    );
  }
}
