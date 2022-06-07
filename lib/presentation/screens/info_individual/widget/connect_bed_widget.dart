import 'package:flutter/material.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/popup_select_bed.dart';
import 'package:slee_fi/resources/resources.dart';

class ConnectBedWidget extends StatelessWidget {
  const ConnectBedWidget(
      {Key? key, required this.callback, required this.indexSelected})
      : super(key: key);

  final VoidCallback callback;
  final int indexSelected;

  @override
  Widget build(BuildContext context) {
    final List<BedType> beds = List.generate(BedType.values.length * 5,
        (i) => BedType.values[i % BedType.values.length]);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 54.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: const SFIcon(Ics.middleBed),
                onTap: () {
                  // SFModalBottomSheet.show(
                  //   context,
                  //   0.8,
                  //   PopUpSelectBed(
                  //     beds: beds,
                  //     callback: callback,
                  //   ),
                  // );
                },
              ),
              indexSelected != 0
                  ? SFIcon(beds[indexSelected].image)
                  : GestureDetector(
                      onTap: () {
                        // showCustomDialog(context, children: [
                        //   const PopupNoShoes(),
                        //
                        // ]);
                        SFModalBottomSheet.show(
                          context,
                          0.8,
                          PopUpSelectBed(
                            beds: beds,
                            callback: callback,
                          ),
                        );
                      },
                      child: const SFIcon(Ics.addBed),
                    ),
            ],
          ),
        ),
        const SFIcon(Imgs.connectBorder),
      ],
    );
  }
}
