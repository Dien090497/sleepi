import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/gacha_probability_config_response/config_bed.dart';

class BedProbability extends StatelessWidget {
  const BedProbability({Key? key, this.colorBgIcon, required this.iconPath, required this.title, required this.beds, this.width, this.height}) : super(key: key);

  final List<Color>? colorBgIcon;
  final String iconPath;
  final String title;
  final double? width;
  final double? height;
  final ConfigBed? beds;

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
          rowData(title: LocaleKeys.common_bed, value: beds?.common),
          const SizedBox(height: 10),
          rowData(title: LocaleKeys.uncommon_bed, value: beds?.uncommon),
          const SizedBox(height: 10),
          rowData(title: LocaleKeys.epic_bed, value: beds?.epicBed),
          const SizedBox(height: 10),
          rowData(title: LocaleKeys.legendary_bed, value: beds?.legendaryBed),
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

