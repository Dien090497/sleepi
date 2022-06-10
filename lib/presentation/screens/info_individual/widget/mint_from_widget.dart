import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/utils/toast_utils.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/item_bed.dart';

import '../../../../common/utils/random_utils.dart';
import '../../../../di/injector.dart';

class MintFromWidget extends StatelessWidget {
   const MintFromWidget({Key? key, required this.title, required this.numbers})
      : super(key: key);
  final String title;
  final int numbers;


  @override
  Widget build(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    final beds = List.generate(
        numbers, (i) => BedType.values[i % BedType.values.length]);
    final randomUtils = getIt<RandomUtils>();

    return Column(
      children: [
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SFText(
              keyText: title,
              style: TextStyles.bold18LightWhite,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SFGridView(
            count: numbers,
            isScroll: false,
            childAspectRatio: 9/10,
            itemBuilder: (context, i) {
              return ItemBed(
                  id: randomUtils.randomId(),
                  bed: beds[i],
                  selected: false,
                  onTap: () {
                      ToastUtils.showToast(fToast, AppColors.white.withOpacity(0.55), LocaleKeys.not_yours);
                  });
            },
          ),
        ),
      ],
    );
  }
}
