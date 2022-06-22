import 'package:flutter/material.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';
import 'modal_item_list.dart';

class UseItem extends StatefulWidget {
  const UseItem({Key? key}) : super(key: key);

  @override
  State<UseItem> createState() => _UseItemState();
}

class _UseItemState extends State<UseItem> {
  late ItemType item;
  String id = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          id != ''
              ? Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          SFModalBottomSheet.show(context, 0.8, ModalItemList(
                            onSelected: (i, ids) {
                              setState(() {
                                item = i;
                                id = ids;
                              });
                            },
                          ));
                        },
                        child: SFIcon(
                          item.image,
                          width: 70,
                          height: 70,
                          fit: BoxFit.contain,
                        ),
                      ),
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
                                    keyText: item.name!,
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
                                    onTap: () => setState(() => id = ''),
                                  )
                                ],
                              ),
                              const SizedBox(height: 2),
                              SFText(
                                keyText: id,
                                style: TextStyles.blue14W700,
                              ),
                              const SizedBox(height: 12),
                              SFText(
                                keyText: item.effect,
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
                    SFModalBottomSheet.show(context, 0.8, ModalItemList(
                      onSelected: (i, ids) {
                        setState(() {
                          item = i;
                          id = ids;
                        });
                      },
                    ));
                  },
                  fixedSize: const Size.fromHeight(40),
                  textStyle: TextStyles.lightGrey16500,
                  icon: Icons.add_circle_outline,
                  borderColor: Colors.white.withOpacity(0.1),
                  withBorder: 1,
                ),
        ],
      ),
    );
  }
}
