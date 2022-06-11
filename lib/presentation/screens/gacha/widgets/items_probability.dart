import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/probability_dialog.dart';

class ItemsProbability extends StatelessWidget {
  const ItemsProbability({Key? key, this.colorBgIcon, required this.iconPath, required this.fakeListData, required this.title, this.isGradientText = false, this.width, this.height}) : super(key: key);

  final List<Color>? colorBgIcon;
  final String iconPath;
  final String title;
  final bool isGradientText;
  final double? width;
  final double? height;
  //TODO: Delete when have real date
  final List<FakeListData> fakeListData;

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
              isGradientText ? GradientText(title, gradient: const LinearGradient(colors: [
                AppColors.blue,
                AppColors.purple,
              ])) : SFText(keyText: title, style: TextStyles.bold14Blue,),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SFText(keyText: fakeListData[0].title, style: TextStyles.lightGrey14,),
              const Spacer(),
              SFText(keyText: fakeListData[0].parameter, style: TextStyles.lightGrey14,),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SFText(keyText: fakeListData[1].title, style: TextStyles.lightGrey14,),
              const Spacer(),
              SFText(keyText: fakeListData[1].parameter, style: TextStyles.lightGrey14,),
            ],
          ),
          fakeListData.length < 3 ? const SizedBox() : Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  SFText(keyText: fakeListData[2].title, style: TextStyles.lightGrey14,),
                  const Spacer(),
                  SFText(keyText: fakeListData[2].parameter, style: TextStyles.lightGrey14,),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SFText(keyText: fakeListData[3].title, style: TextStyles.lightGrey14,),
                  const Spacer(),
                  SFText(keyText: fakeListData[3].parameter, style: TextStyles.lightGrey14,),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SFText(keyText: fakeListData[4].title, style: TextStyles.lightGrey14,),
                  const Spacer(),
                  SFText(keyText: fakeListData[4].parameter, style: TextStyles.lightGrey14,),
                ],
              ),
            ],
          )
        ],
      ),
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
      child: Text(text, style: style),
    );
  }
}
