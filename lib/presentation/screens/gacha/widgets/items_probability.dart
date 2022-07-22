import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class ItemsProbability extends StatelessWidget {
  const ItemsProbability({Key? key, this.colorBgIcon, required this.iconPath, required this.title, required this.listData, this.width, this.height}) : super(key: key);

  final List<Color>? colorBgIcon;
  final String iconPath;
  final String title;
  final double? width;
  final double? height;
  final List<dynamic> listData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.05),
        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 0.05),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: width == null ? const EdgeInsets.all(15) : null,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: colorBgIcon ?? [AppColors.transparent, AppColors.transparent],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: SFIcon(iconPath, width: width ?? 20, height: height ?? 20,),
              ),
              const SizedBox(width: 12),
              SFText(keyText: title, style: TextStyles.bold14Blue,),
            ],
          ),
          const SizedBox(height: 10),
          ListView.builder(
              itemCount: listData.length,
              padding: const EdgeInsets.only(top: 50),
              itemBuilder: (BuildContext context,int index){
                return Column(
                  children: [
                    const SizedBox(height: 10),
                    rowData(title: "${LocaleKeys.level} ${index + 1}", value: listData.elementAt(index)),
                  ],
                );
              }
          ),
        ],
      ),
    );
  }

  Widget rowData({required String title, required dynamic value}){
    return Row(
      children: [
        SFText(keyText: title, style: TextStyles.lightGrey14,),
        const Spacer(),
        SFText(keyText: value ?? '', style: TextStyles.lightGrey14,),
      ],
    );
  }
}

