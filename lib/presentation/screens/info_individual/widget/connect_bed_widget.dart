import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:slee_fi/common/widgets/cached_image.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/presentation/blocs/mint/mint_cubit.dart';
import 'package:slee_fi/presentation/blocs/mint/mint_state.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/popup_no_shoes.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/popup_select_bed.dart';
import 'package:slee_fi/resources/resources.dart';

class ConnectBedWidget extends StatefulWidget {
  const ConnectBedWidget({Key? key, required this.bedParent1, required this.controller})
      : super(key: key);

  final BedEntity bedParent1;
  final AnimationController controller;

  @override
  State<ConnectBedWidget> createState() => _ConnectBedWidgetState();
}

class _ConnectBedWidgetState extends State<ConnectBedWidget> with TickerProviderStateMixin{

  @override
  void initState() {
    super.initState();

    widget.controller.addStatusListener((status) async {

      if (status == AnimationStatus.completed) {
        final cubit = context.read<MintCubit>();
        cubit.mint();
        widget.controller.reset();
      }
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(() { });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return BlocConsumer<MintCubit, MintState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<MintCubit>();
          return Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: sizeScreen.height * 0.1,
                    child: OverflowBox(
                      minHeight: sizeScreen.height * 0.48,
                      maxHeight: sizeScreen.height * 0.48,
                      minWidth: sizeScreen.width,
                      maxWidth: sizeScreen.width,
                      child: Lottie.asset('assets/json/bed_minting.json',
                        controller: widget.controller,
                        fit: BoxFit.cover,
                        repeat: false,
                        onLoaded: (composition) {
                          // Configure the AnimationController with the duration of the
                          // Lottie file and start the animation.
                          widget.controller
                              .duration = composition.duration;
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            child: CachedImage(
                              image: widget.bedParent1.image,
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
                          child: GestureDetector(
                            onTap: () {
                              if (state is MintStateLoaded) {
                                if (state.listBed.isEmpty) {
                                  showCustomDialog(context, children: [
                                    const PopupNoShoes(),
                                  ]);
                                } else {
                                  SFModalBottomSheet.show(
                                    context,
                                    0.8,
                                    PopUpSelectBed(
                                      cubit: cubit,
                                    ),
                                  );
                                }
                              }
                            },
                            child: state is MintStateLoaded
                                ? state.indexSelected == -1
                                ? const SFIcon(Ics.addBed)
                                : CachedImage(
                              image: state
                                  .listBed[state.indexSelected].image,
                              height: 80,
                              width: 80,
                            )
                                : const SFIcon(Ics.addBed),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]
              ),
              // const SFIcon(Imgs.connectBorder),
            ],
          );
        });
  }
}
