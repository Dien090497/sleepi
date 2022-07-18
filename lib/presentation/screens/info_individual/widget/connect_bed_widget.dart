import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/widgets/cached_image.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/presentation/blocs/mint/mint_cubit.dart';
import 'package:slee_fi/presentation/blocs/mint/mint_state.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/popup_select_bed.dart';
import 'package:slee_fi/resources/resources.dart';

class ConnectBedWidget extends StatelessWidget {
  const ConnectBedWidget({Key? key, required this.bedParent1})
      : super(key: key);

  final BedEntity bedParent1;

  @override
  Widget build(BuildContext context) {
    final List<BedType> beds = List.generate(BedType.values.length * 5,
        (i) => BedType.values[i % BedType.values.length]);
    return BlocConsumer<MintCubit, MintState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        if (state is MintStateSelected) {
          final cubit = context.read<MintCubit>();
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          child: CachedImage(
                            image: bedParent1.image,
                            height: 80,
                            width: 80,
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: state.indexSelected != -1
                            // TODO example data
                            ? const SFIcon(Imgs.shortBed)
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
                                      callBack: (i) {
                                        cubit.selectBed(i);
                                      },
                                    ),
                                  );
                                },
                                child: const SFIcon(Ics.addBed),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              const SFIcon(Imgs.connectBorder),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
