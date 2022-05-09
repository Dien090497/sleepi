import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';

class IntroduceApp extends StatelessWidget {
  const IntroduceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:
        BoxDecoration(color: AppColors.white.withOpacity(0.2)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Colors.cyanAccent,
                    shape: BoxShape.circle
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 80),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SFButton(text: 'introduce.how_to_play', onPressed: () {} , width: double.infinity, height: 50,),
                        const SFButton(text: 'introduce.white_paper', width: double.infinity, height: 50,),
                        const SFButton(text: 'introduce.lite_paper', width: double.infinity, height: 50,),
                        const SFButton(text: 'introduce.link_tree', width: double.infinity, height: 50,),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
