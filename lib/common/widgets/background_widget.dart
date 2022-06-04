import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key, this.child, this.appBar}) : super(key: key);

  final Widget? child;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: AppColors.black),
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
              center: const Alignment(0.65, 0.65),
              colors: [
                AppColors.radial2,
                AppColors.radial2.withOpacity(0.8),
                AppColors.radial2.withOpacity(0.5),
                AppColors.radial2.withOpacity(0.3),
                AppColors.radial2.withOpacity(0.1),
                AppColors.radial2.withOpacity(0.05),
                AppColors.black.withOpacity(0),
              ],
              radius: 1.35,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: appBar,
          body: child,
        ),
      ],
    );
  }
}

// class BackgroundWidget extends Scaffold {
//   BackgroundWidget({
//     Widget? child,
//     Key? key,
//   }) : super(
//           key: key,
//           backgroundColor: AppColors.transparent,
//           body: Stack(
//             children: [
//               child ?? const SizedBox.shrink(),
//             ],
//           ),
//         );
// }
