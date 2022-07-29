import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/models/gacha_probability_config_response/config_info.dart';

class ItemsProbability extends StatelessWidget {
  const ItemsProbability({
    Key? key,
    // this.colorBgIcon,
    // required this.iconPath,
    // required this.title,
    required this.configInfo,
    this.width,
    // this.isGradient = false,
    // this.isToken = false,
    // this.style,
    this.height}) : super(key: key);

  // final List<Color>? colorBgIcon;
  // final String iconPath;
  // final String title;
  // final TextStyle? style;
  final double? width;
  final double? height;
  // final bool isGradient;
  // final bool isToken;
  final List<ConfigInfo>? configInfo;

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
          // Row(
          //   children: [
          //     Container(
          //       padding: width == null ? const EdgeInsets.all(15) : null,
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         gradient: LinearGradient(
          //           colors: colorBgIcon ?? [AppColors.transparent, AppColors.transparent],
          //           begin: Alignment.centerLeft,
          //           end: Alignment.centerRight,
          //         ),
          //       ),
          //       child: SFIcon(iconPath, width: width ?? 20, height: height ?? 20,),
          //     ),
          //     const SizedBox(width: 12),
          //     isGradient ? GradientText(title, gradient: const LinearGradient(
          //         colors: [
          //       AppColors.blue,
          //       AppColors.purple,
          //     ],
          //       begin: Alignment(-1.0, -1.0),
          //       end: Alignment(1.0, 1.0),
          //     ),
          //     )
          //     : SFText(keyText: title, style: style),
          //   ],
          // ),
          ListView.builder(
             shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: configInfo?.length,
              itemBuilder: (BuildContext context,int index){
                return  Column(
                  children:  [
                    const SizedBox(height: 10),
                    rowData(title: "${configInfo?.elementAt(index).name} ", value: configInfo?.elementAt(index).value),
                  ],
                );
              }
          )
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

