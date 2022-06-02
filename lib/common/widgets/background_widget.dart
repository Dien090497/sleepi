import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class BackgroundWidget extends Scaffold {
  BackgroundWidget({
    Widget? child,
    Key? key,
  }) : super(
          key: key,
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(-0.5, -0.7),
                    colors: [
                      AppColors.radial1,
                      AppColors.radial1.withOpacity(0.8),
                      AppColors.radial1.withOpacity(0.5),
                      AppColors.radial1.withOpacity(0.2),
                      AppColors.radial1.withOpacity(0.1),
                      AppColors.black.withOpacity(0),
                    ],
                    radius: 1.3,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0.65, 0.75),
                    colors: [
                      AppColors.radial2,
                      AppColors.radial2.withOpacity(0.8),
                      AppColors.radial2.withOpacity(0.5),
                      AppColors.radial2.withOpacity(0.1),
                      AppColors.radial2.withOpacity(0.05),
                      AppColors.black.withOpacity(0),
                    ],
                    radius: 1.35,
                  ),
                ),
              ),
              child ?? const SizedBox.shrink(),
            ],
          ),
        );
}
