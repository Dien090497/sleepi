import 'package:flutter/material.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/item_bed.dart';

class PopUpSelectBed extends StatelessWidget {
  const PopUpSelectBed({Key? key, required this.beds}) : super(key: key);
  final List<BedType> beds;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32.0, left: 32, bottom: 24),
                child: SFText(
                  keyText: 'Select Bed',
                  style: TextStyles.bold18White,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: SFGridView(
                    count: beds.length,
                    isScroll: true,
                    childAspectRatio: 1,
                    itemBuilder: (context, i) {
                      return ItemBed(beds: beds, i: i,);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 80,),
            ],
          ),
          Positioned(
            bottom: 20,
            child: SFButton(
                text: 'Continue',
                width: MediaQuery.of(context).size.width * 0.9,
                color: AppColors.blue,
                textStyle: TextStyles.w600WhiteSize16,
                height: 48,
                onPressed: () => Navigator.pop(context)),
          )
        ],
      ),
    );
  }
}
