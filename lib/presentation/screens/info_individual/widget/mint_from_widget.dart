import 'package:flutter/material.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/item_bed.dart';

class MintFromWidget extends StatelessWidget {
  const MintFromWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beds = List.generate(BedType.values.length,
        (i) => BedType.values[i % BedType.values.length]);
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SFText(
                keyText: LocaleKeys.mint_from,
                style: TextStyles.bold18LightWhite,
              ),
            ),
          ),
          // const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SFGridView(
              count: beds.length,
              isScroll: false,
              childAspectRatio: 1,
              itemBuilder: (context, i) {
                return ItemBed(beds: beds, i: i);
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
