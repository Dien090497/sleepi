import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/cached_image.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/home/home_bloc.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';
import 'package:slee_fi/presentation/blocs/item_list/item_bloc.dart';
import 'package:slee_fi/resources/resources.dart';

import 'modal_item_list.dart';

class UseItem extends StatelessWidget {
  const UseItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) {
          if (previous is HomeLoaded && current is HomeLoaded) {
            if (previous.selectedItem == null && current.selectedItem != null) {
              return true;
            } else if (previous.selectedItem != null &&
                current.selectedItem == null) {
              return true;
            }
          }
          return false;
        },
        builder: (context, state) {
          return (state is HomeLoaded && state.selectedItem != null)
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            SFModalBottomSheet.show(
                                context,
                                0.8,
                                ModalItemList(
                                    itemBloc: context.read<ItemBloc>(),
                                    homeBloc: context.read<HomeBloc>()));
                          },
                          child: CachedImage(
                            image: state.selectedItem!.image,
                            width: 70,
                            height: 70,
                          )),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SFText(
                                    keyText: state.selectedItem!.name,
                                    style: TextStyles.lightWhite16W700,
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color:
                                            AppColors.white.withOpacity(0.05),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const SFIcon(Ics.trash),
                                    ),
                                    onTap: () {
                                      context
                                          .read<HomeBloc>()
                                          .add(const RemoveItem());
                                    },
                                  )
                                ],
                              ),
                              const SizedBox(height: 2),
                              SFText(
                                keyText: '${state.selectedItem!.id}',
                                style: TextStyles.blue14W700,
                              ),
                              const SizedBox(height: 12),
                              SFText(
                                keyText: LocaleKeys.put_positive_correct_to
                                    .tr(args: [state.selectedItem!.type.tr()]),
                                style: TextStyles.lightGrey14,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : SFButtonOutLined(
                  title: LocaleKeys.use_item,
                  onPressed: () {
                    SFModalBottomSheet.show(
                        context,
                        0.8,
                        ModalItemList(
                          itemBloc: context.read<ItemBloc>(),
                          homeBloc: context.read<HomeBloc>(),
                        ));
                  },
                  fixedSize: const Size.fromHeight(40),
                  textStyle: TextStyles.lightGrey16500,
                  icon: Icons.add_circle_outline,
                  borderColor: Colors.white.withOpacity(0.1),
                  withBorder: 1,
                );
        },
      ),
    );
  }
}
