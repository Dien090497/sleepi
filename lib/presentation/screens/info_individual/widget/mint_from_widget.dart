import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/item_bed.dart';

class MintFromWidget extends StatelessWidget {
  const MintFromWidget({
    Key? key,
    required this.title,
    this.familyData,
  }) : super(key: key);

  final String title;
  final List<BedEntity>? familyData;

  @override
  Widget build(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);

    if (familyData == null) {
      return const SizedBox();
    } else {
      if (familyData!.isEmpty) {
        return const SizedBox();
      } else {
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
                count: familyData!.length,
                isScroll: false,
                childAspectRatio: 9 / 10,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return ItemBed(
                    id: '${familyData![i].id}',
                    bedType: familyData![i].type,
                    image: familyData![i].image,
                    name: familyData![i].name,
                    selected: false,
                    onTap: () {
                      /*ToastUtils.showToast(
                          fToast,
                          AppColors.white.withOpacity(0.55),
                          LocaleKeys.this_bed_is_not_yours);*/
                    },
                  );
                },
              ),
            ),
          ],
        );
      }
    }

  }
}
