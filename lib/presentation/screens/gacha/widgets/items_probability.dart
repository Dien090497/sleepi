import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/gacha_probability_config_response/config_items.dart';

class ItemsProbability extends StatelessWidget {
  const ItemsProbability({Key? key, this.colorBgIcon, required this.iconPath, required this.title, required this.items, this.width, this.height}) : super(key: key);

  final List<Color>? colorBgIcon;
  final String iconPath;
  final String title;
  final double? width;
  final double? height;
  final ConfigItems? items;

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
              GradientText(title, gradient: const LinearGradient(
                  colors: [
                AppColors.blue,
                AppColors.purple,
              ],
                begin: Alignment(-1.0, -1.0),
                end: Alignment(1.0, 1.0),
              ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          rowData(title: "${LocaleKeys.level.tr()} 1", value: items?.level1),
          const SizedBox(height: 10),
          rowData(title: "${LocaleKeys.level.tr()} 2", value: items?.level2),
          const SizedBox(height: 10),
          rowData(title: "${LocaleKeys.level.tr()} 3", value: items?.level3),
          const SizedBox(height: 10),
          rowData(title: "${LocaleKeys.level.tr()} 4", value: items?.level4),
        ],
      ),
    );
  }

  Widget rowData({required String title, required num? value}){
    return Row(
      children: [
        SFText(keyText: title, style: TextStyles.lightGrey14,),
        const Spacer(),
        SFText(keyText: '${value ?? 0}%', style: TextStyles.lightGrey14,),
      ],
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
      this.text, {Key? key,
        required this.gradient,
        this.style,
      }) : super(key: key);

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: SFText(style: style, keyText: text,),
    );
  }
}

