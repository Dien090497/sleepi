import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/presentation/screens/wallet_creation_warning/widgets/pop_up_avalanche_wallet.dart';

class TabBarIcon extends TabBar {
  TabBarIcon({
    required context,
    required List<String> texts,
    required List<String> images,
    Key? key,
  }) : super(
          onTap: (index) {
            if(index == 1){
              showCustomAlertDialog(context,
                  children: const PopUpAvalancheWallet());
            }
          },
          tabs: List.generate(
              texts.length,
              (i) => Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SFIcon(
                          images.isNotEmpty ? images[i] : "",
                          color: AppColors.white,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                            child: SFText(
                          keyText: texts[i],
                          style: TextStyles.white16,
                        )),
                      ],
                    ),
                  )),

          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: AppColors.gradientBluePurple,
            color: AppColors.blue
          ),

          indicatorColor: AppColors.purple,
          labelColor: AppColors.white,
          labelStyle: TextStyles.white16,
          unselectedLabelColor: AppColors.purple,
          unselectedLabelStyle: TextStyles.purple16,
          splashBorderRadius: BorderRadius.circular(100),

          // padding: const EdgeInsets.symmetric(horizontal: 12),
          key: key,
        );
}
