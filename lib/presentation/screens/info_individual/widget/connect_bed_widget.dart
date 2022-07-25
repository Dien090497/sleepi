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
  const ConnectBedWidget({Key? key, required this.bedParent1})
      : super(key: key);

  final BedEntity bedParent1;

  @override
  State<ConnectBedWidget> createState() => _ConnectBedWidgetState();
}

class _ConnectBedWidgetState extends State<ConnectBedWidget> with TickerProviderStateMixin{
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this);
    animationController.addStatusListener((status) async {

      if (status == AnimationStatus.completed) {

        animationController.reset();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MintCubit, MintState>(
        listener: (context, state) {},
        builder: (context, state) {
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
              ),
              const SFIcon(Imgs.connectBorder),
              //
              // SizedBox(
              //   height: 0,
              //   child: OverflowBox(
              //     minHeight: 500,
              //     maxHeight: 500,
              //     child: Lottie.asset('assets/json/bed_minting.json',
              //       controller: animationController,
              //       fit: BoxFit.contain,
              //       onLoaded: (composition) {
              //         // Configure the AnimationController with the duration of the
              //         // Lottie file and start the animation.
              //         animationController
              //           ..duration = composition.duration
              //           ..forward();
              //       },
              //     ),
              //   ),
              // ),
              //
            ],
          );
        });
  }
}
