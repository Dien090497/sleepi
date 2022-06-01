import 'package:flutter/material.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/popup_select_bed.dart';
import 'package:slee_fi/resources/resources.dart';

class ConnectBedWidget extends StatefulWidget {
  const ConnectBedWidget({Key? key}) : super(key: key);

  @override
  State<ConnectBedWidget> createState() => _ConnectBedWidgetState();
}

class _ConnectBedWidgetState extends State<ConnectBedWidget> {

  late int indexSelected=0;
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
              const SFIcon(Ics.middleBed),
              indexSelected!=0
              ?SFIcon(beds[indexSelected].image)
              :GestureDetector(
                onTap: () {
                  SFModalBottomSheet.show(
                      context,
                      0.8,
                      PopUpSelectBed(
                        beds: beds,
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
