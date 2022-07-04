import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/presentation/screens/passcode/passcode_screen.dart';
import 'package:slee_fi/resources/resources.dart';

class NFTDetailArguments {}

class NFTDetailScreen extends StatelessWidget {
  const NFTDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as NFTDetailArguments;

    return BackgroundWidget(
      appBar: AppBar(
          toolbarHeight: 80,
          leading: const Padding(
            padding: EdgeInsets.only(left: 16),
            child: SFBackButton(),
          ),
          actions: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, R.passcode,
                  arguments: PasscodeArguments(R.settingWallet)),
              child: const Padding(
                padding: EdgeInsets.only(right: 16.0, left: 12),
                child: SFIcon(Ics.icSetting),
              ),
            )
          ],
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.transparent,
          leadingWidth: 48,
          elevation: 0,
          centerTitle: true,
          titleSpacing: 14,
          title: SFText(
            keyText: '',
            style: TextStyles.bold14Blue,
            stringCase: StringCase.upperCase,
          )),
    );
  }
}
