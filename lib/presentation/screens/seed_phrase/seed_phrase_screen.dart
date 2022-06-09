import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/seed_phrase/widgets/seed_phrase_list.dart';

class SeedPhraseScreen extends StatelessWidget {
  const SeedPhraseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      appBar: SFAppBar(
        context: context,
        title: LocaleKeys.seed_phrase,
        textStyle: TextStyles.bold18LightWhite,
      ),
      child: const SafeArea(child: SeedPhraseList()),
    );
  }
}
