import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/mint/mint_cubit.dart';
import 'package:slee_fi/presentation/blocs/mint/mint_state.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/item_bed.dart';

class PopUpSelectBed extends StatefulWidget {
  const PopUpSelectBed({Key? key, required this.cubit}) : super(key: key);
  final MintCubit cubit;

  @override
  State<PopUpSelectBed> createState() => _PopUpSelectBedState();
}

class _PopUpSelectBedState extends State<PopUpSelectBed> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MintCubit, MintState>(
        bloc: widget.cubit,
        builder: (context, state) {
          if (state is MintStateLoaded) {
            return SafeArea(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 32.0, left: 32, bottom: 24),
                        child: SFText(
                          keyText: LocaleKeys.select_bed,
                          style: TextStyles.bold18White,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: SFGridView(
                            count: state.listBed.length,
                            isScroll: true,
                            isLoadMore: state.isLoadMore,
                            onRefresh: () {
                              widget.cubit.refresh();
                            },
                            mintCubit: widget.cubit,
                            childAspectRatio: 9 / 10,
                            itemBuilder: (context, i) {
                              return ItemBed(
                                id: state.listBed[i].tokenId.toString(),
                                image: state.listBed[i].image,
                                bedType: state.listBed[i].nftClass ??
                                    state.listBed[i].nftType,
                                selected: state.indexSelected == i,
                                quality: state.listBed[i].quality,
                                onTap: () {
                                  widget.cubit.selectBed(i);
                                  setState(() {});
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 20,
                    child: SFButton(
                      text: LocaleKeys.continue_,
                      width: MediaQuery.of(context).size.width * 0.9,
                      color: AppColors.blue,
                      textStyle: TextStyles.w600WhiteSize16,
                      height: 48,
                      onPressed: () {
                        widget.cubit.getInfoMint();
                        Navigator.pop(context, true);
                      },
                    ),
                  )
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
