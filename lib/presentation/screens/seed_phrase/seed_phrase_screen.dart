import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/presentation/screens/seed_phrase/widgets/seed_phrase_list.dart';

class SeedPhraseScreen extends StatelessWidget {
  const SeedPhraseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: SFAppBar(
          context: context,
          title: "Seed Phrase",
          textStyle: TextStyles.bold18LightWhite,
        ),
        body: SafeArea(
            child: Column(children: const [
              // AvailableWidget(),
              Expanded(child: SeedPhraseList()),
              // ActivationCodeList(),
            ])),
      ),
    );
  }
}
