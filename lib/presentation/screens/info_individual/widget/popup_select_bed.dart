import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/utils/random_utils.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/mint/mint_cubit.dart';
import 'package:slee_fi/presentation/blocs/mint/mint_state.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/item_bed.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/popup_no_shoes.dart';

class PopUpSelectBed extends StatefulWidget {
  const PopUpSelectBed({Key? key, required this.beds, required this.callBack})
      : super(key: key);
  final List<BedType> beds;
  final Function(int) callBack;

  @override
  State<PopUpSelectBed> createState() => _PopUpSelectBedState();
}

class _PopUpSelectBedState extends State<PopUpSelectBed> {
  final randomUtils = getIt<RandomUtils>();

  late final List<String> listID =
      List.generate(widget.beds.length, (index) => randomUtils.randomId());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MintCubit()..init(),
      child: BlocBuilder<MintCubit, MintState>(builder: (context, state) {
        if (state is MintStateSelected) {
          final cubit = context.read<MintCubit>();
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
                          count: widget.beds.length,
                          isScroll: true,
                          childAspectRatio: 9 / 10,
                          itemBuilder: (context, i) {
                            return ItemBed(
                              id: listID[i],
                              image: widget.beds[i].name,
                              bedType: widget.beds[i].type,
                              selected: state.indexSelected == i,
                              onTap: () {
                                cubit.selectBed(i);
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
                      if (state.indexSelected % 3 == 0) {
                        showCustomDialog(context, children: [
                          const PopupNoShoes(),
                        ]);
                      } else {
                        Navigator.pop(context);
                        widget.callBack(state.indexSelected);
                      }
                    },
                  ),
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
