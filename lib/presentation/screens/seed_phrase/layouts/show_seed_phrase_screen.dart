import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:slee_fi/usecase/wallet/get_current_mnemonic_usecasse.dart';

class ShowSeedPhraseScreen extends StatefulWidget {
  const ShowSeedPhraseScreen({Key? key}) : super(key: key);

  @override
  State<ShowSeedPhraseScreen> createState() => _ShowSeedPhraseScreenState();
}

class _ShowSeedPhraseScreenState extends State<ShowSeedPhraseScreen> {
  bool hide = true;

  List<String> seedPhrase = [];

  late final _currentMnemonic = getIt<GetCurrentMnemonicUsecase>();

  @override
  Widget build(BuildContext context) {
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
              Expanded(
                  child: SFCard(
                child: FutureBuilder<dartz.Either<FailureMessage, String>>(
                  future: _currentMnemonic.call(NoParams()),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!.isRight()) {
                      snapshot.data!.foldRight(
                          String, (r, previous) => seedPhrase = r.split(' '));
                      return ListView.separated(
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
                                  keyText: hide ? "-----" : seedPhrase[index],
                                  stringCase: StringCase.lowerCaseCase,
                                  style: TextStyles.lightGrey14,
                                ),
                              ));
                    } else if (snapshot.hasData && snapshot.data!.isRight()) {
                      String messages = '';
                      snapshot.data!.foldLeft(
                          FailureMessage, (previous, r) => messages = r);
                      return Center(
                          child: SFText(
                              keyText: messages, style: TextStyles.white12));
                    }

                    return const Center(child: CircularProgressIndicator());
                  },
                ),
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
