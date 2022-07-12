import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/cached_image.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/home/home_bloc.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';
import 'package:slee_fi/resources/resources.dart';

import 'modal_item_list.dart';

class UseItem extends StatefulWidget {
  const UseItem({Key? key}) : super(key: key);

  @override
  State<UseItem> createState() => _UseItemState();
}

class _UseItemState extends State<UseItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (previous, current) {
          if (previous is HomeLoaded && current is HomeLoaded) {
            if ((previous.selectedItem == null && current.selectedItem != null) || current.errorType == ErrorType.addItemToBed) {
              return true;
            }
          }
          return false;
        },
        listener: (context, state) {
          if (state is HomeLoaded) 'error type is ${state.errorType}'.log;
          showSuccessfulDialog(context, null);
        },
        builder: (context, state) {
          if (state is! HomeLoaded || state.bedList.isEmpty) {
            return const SizedBox();
          }
          return (state.selectedItem != null)
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            SFModalBottomSheet.show(
                                context,
                                0.8,
                                ModalItemList(
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
                                          .add(RemoveItem());
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
                                keyText: 'example effect',
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
                    SFModalBottomSheet.show(context, 0.8,
                        ModalItemList(homeBloc: context.read<HomeBloc>()));
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
