import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class SeedPhraseArgument {
  final String mnemonic;

  SeedPhraseArgument(this.mnemonic);
}

class ShowSeedPhraseScreen extends StatefulWidget {
  const ShowSeedPhraseScreen({Key? key}) : super(key: key);

  @override
  State<ShowSeedPhraseScreen> createState() => _ShowSeedPhraseScreenState();
}

class _ShowSeedPhraseScreenState extends State<ShowSeedPhraseScreen> {
  var hide = true;

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as SeedPhraseArgument?;
    assert(arg != null, 'Empty seed phrase');
    final seedPhrase = arg!.mnemonic.split(' ');
    return BackgroundWidget(
      appBar: SFAppBar(
        context: context,
        title: LocaleKeys.seed_phrase,
        textStyle: TextStyles.bold18LightWhite,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // AvailableWidget(),
              Expanded(
                  child: SFCard(
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    separatorBuilder: (context, index) => Divider(
                          color: AppColors.lightWhite.withOpacity(0.05),
                          height: 1,
                        ),
                    itemCount: seedPhrase.length,
                    itemBuilder: (BuildContext context, int index) =>
                        SFListTile(
                          text: "${index + 1}",
                          trailing: SFText(
                            keyText: hide ? "*******" : seedPhrase[index],
                            style: TextStyles.lightGrey14,
                          ),
                        )),
              )),
              const SizedBox(height: 12.0),
              SFText(
                keyText: LocaleKeys.displays_message_show_seed_phrase,
                style: TextStyles.lightGrey12,
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTapDown: (details) {
                  setState(() => hide = false);
                },
                onTapUp: (detail) {
                  setState(() => hide = true);
                },
                child: SFText(
                  keyText: LocaleKeys.press_and_hold_to_reveal,
                  style: TextStyles.bold18White,
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
