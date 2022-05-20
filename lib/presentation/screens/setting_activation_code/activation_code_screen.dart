import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/setting_activation_code/widgets/activation_code_list.dart';
import 'package:slee_fi/presentation/screens/setting_activation_code/widgets/available_widget.dart';

class ActivationCodeScreen extends StatelessWidget {
  const ActivationCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greenAccent.withOpacity(0.75),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.0),
        ),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_left_circle_fill, color: AppColors.green,size: 40,),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: SFText(keyText: Keys.activationCode, style: TextStyles.bold20black,),

       bottom: PreferredSize(
        preferredSize:  Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height * 0.2),
        child: const AvailableWidget(),
      ),
      ),
      body: const SafeArea(
        child: ActivationCodeList()
      ),
    );
  }
}
