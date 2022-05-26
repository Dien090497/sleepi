import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class SeedPhraseList extends StatelessWidget {
  const SeedPhraseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SFCard(
      margin: const EdgeInsets.all(16.0),
      child: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, R.showSeedPhrase),
                  child: SFListTile(
                    text: "${index + 1}",
                    trailing: SFText(
                      keyText: "-----",
                      style: TextStyles.lightGrey14,
                    ),
                  ),
                ),
                Divider(
                  color: AppColors.lightWhite.withOpacity(0.05),
                  height: 1,
                ),
              ],
            );
          }),
    );
  }
}
