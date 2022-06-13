import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_image_border.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

import 'modal_item_list.dart';

class UseItem extends StatefulWidget {
  const UseItem({Key? key}) : super(key: key);

  @override
  State<UseItem> createState() => _UseItemState();
}

class _UseItemState extends State<UseItem> {
  List<dynamic> items = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          items.isNotEmpty ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SFImageBorder(
                  icon: items.isNotEmpty ? items.elementAt(0) :Ics.icItemsEmpty,
                  onTap: () {
                    setState((){
                      items.removeAt(0);
                    });
                  },
                  radius: 16,
                  size: const Size(75, 68),
                  padding: items.isNotEmpty ? 8 : 20,
                  iconColor: items.isNotEmpty ? null : AppColors.lightGrey,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: SFImageBorder(
                  icon: items.length == 2 ? items.elementAt(1) :Ics.icItemsEmpty,
                  onTap: ()  {
                    setState((){
                      items.removeAt(1);
                    });
                  },
                  radius: 16,
                  size: const Size(75, 68),
                  padding: items.length == 2 ? 8 : 20,
                  iconColor: items.length == 2 ? null : AppColors.lightGrey,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: SFImageBorder(
                  icon: items.length == 3 ? items.elementAt(2) :Ics.icItemsEmpty,
                  onTap: ()  {
                    setState((){
                      items.removeAt(2);
                    });
                  },
                  radius: 16,
                  size: const Size(75, 68),
                  padding: items.length == 3 ? 8 : 20,
                  iconColor: AppColors.lightGrey,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: SFImageBorder(
                  icon: items.length == 4 ? items.elementAt(3) :Ics.icItemsEmpty,
                  onTap: ()  {
                    setState((){
                      items.removeAt(3);
                    });
                  },
                  radius: 16,
                  size: const Size(75, 68),
                  padding: items.length == 4 ? 8 : 20,
                  iconColor: items.length == 4 ? null : AppColors.lightGrey,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: SFImageBorder(
                  icon: items.length == 5 ? items.elementAt(4) :Ics.icItemsEmpty,
                  onTap: ()  {
                    setState((){
                      items.removeAt(4);
                    });
                  },
                  radius: 16,
                  size: const Size(75, 68),
                  padding: items.length == 5 ? 8 : 20,
                  iconColor: AppColors.lightGrey,
                ),
              ),
            ],
          ) : const SizedBox(),
          const SizedBox(height: 10),
          SFButtonOutLined(
            title: LocaleKeys.use_item,
            onPressed: () {
              SFModalBottomSheet.show(
                  context, 0.8,  ModalItemList(
                onSelected: (item){
                  setState((){
                    items.add(item);
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
