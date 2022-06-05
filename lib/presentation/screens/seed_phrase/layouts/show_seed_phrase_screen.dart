import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class ShowSeedPhraseScreen extends StatelessWidget {
  const ShowSeedPhraseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: SFAppBar(
          context: context,
          title: LocaleKeys.seed_phrase,
          textStyle: TextStyles.bold18LightWhite,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // AvailableWidget(),
                Expanded(
                    child: SFCard(
                  child: ListView.builder(
                      itemCount: 15,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            SFListTile(
                              text: "${index + 1}",
                              trailing: SFText(
                                keyText: "-----",
                                style: TextStyles.lightGrey14,
                              ),
                            ),
                            Divider(
                              color: AppColors.lightWhite.withOpacity(0.05),
                              height: 1,
                            ),
                          ],
                        );
                      }),
                )),
                const SizedBox(height: 12.0),
                SFText(
                  keyText: LocaleKeys.displays_message_show_seed_phrase,
                  style: TextStyles.lightGrey12,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, R.exportSeedPhrase);
                  },
                  child: SFText(
                    keyText: LocaleKeys.press_and_hold_to_reveal,
                    style: TextStyles.bold18White,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
