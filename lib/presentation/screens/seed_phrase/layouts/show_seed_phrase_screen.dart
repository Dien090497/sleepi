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

class ShowSeedPhraseScreen extends StatelessWidget {
  const ShowSeedPhraseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    final currentMnemonic = getIt<GetCurrentMnemonicUsecase>();
    bool isHiding = true;

    return BackgroundWidget(
      appBar: SFAppBar(
        context: context,
        title: LocaleKeys.seed_phrase,
        textStyle: TextStyles.bold18LightWhite,
      ),
      child: SafeArea(
        child: StatefulBuilder(builder: (context, setState) {
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              SFCard(
                child: FutureBuilder<dartz.Either<FailureMessage, String>>(
                  future: currentMnemonic.call(NoParams()),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!.isRight()) {
                      final List<String> seedPhrase = snapshot.data!
                          .foldRight([], (r, previous) => r.split(' '));
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        separatorBuilder: (context, index) => Divider(
                          color: AppColors.lightWhite.withOpacity(0.05),
                          height: 1,
                        ),
                        itemCount: seedPhrase.length,
                        itemBuilder: (_, i) => SFListTile(
                          text: "${i + 1}",
                          trailing: SFText(
                            keyText: isHiding ? "-----" : seedPhrase[i],
                            stringCase: StringCase.lowerCaseCase,
                            style: TextStyles.lightGrey14,
                          ),
                        ),
                      );
                    } else if (snapshot.hasData && snapshot.data!.isLeft()) {
                      final String messages =
                          snapshot.data!.foldLeft('', (previous, r) => r);
                      return Center(
                          child: SFText(
                              keyText: messages, style: TextStyles.white12));
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              SizedBox(height: sizeHeight * 0.03),
              SFText(
                keyText: LocaleKeys.displays_message_show_seed_phrase,
                style: TextStyles.lightGrey12,
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTapDown: (details) {
                  setState(() => isHiding = false);
                },
                onTapUp: (detail) {
                  setState(() => isHiding = true);
                },
                child: SFText(
                  keyText: LocaleKeys.press_and_hold_to_reveal,
                  style: TextStyles.bold18White,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
