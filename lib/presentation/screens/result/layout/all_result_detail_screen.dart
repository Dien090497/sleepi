import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class AllResultDetailArguments {
  final String image;

  AllResultDetailArguments(this.image);
}

class AllResultDetailScreen extends StatelessWidget {
  const AllResultDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as AllResultDetailArguments?;

    return BackgroundWidget(
      appBar: SFAppBar(
        context: context,
        title: LocaleKeys.all_result,
        textStyle: TextStyles.bold18LightWhite,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              ListView(
                physics: const ClampingScrollPhysics(),
                padding:  EdgeInsets.fromLTRB(32,MediaQuery.of(context).size.height * 0.1, 32, 0),
                children: [
                  SFCard(
                    height: 260,
                    radius: 8,
                    padding: const EdgeInsets.all(16),
                    border: Border.all(color: AppColors.white.withOpacity(0.1)),
                    child: args != null ?  SFIcon(args.image) : const SizedBox(),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SFButtonOutLined(
                  title: LocaleKeys.return_,
                  fixedSize: const Size(double.infinity, 48),
                  textStyle: TextStyles.blue16,
                  borderColor: AppColors.blue,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
