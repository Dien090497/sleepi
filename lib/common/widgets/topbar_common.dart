import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_statistic_resource.dart';
import 'package:slee_fi/resources/resources.dart';

class TopBarCommon extends StatelessWidget {
  const TopBarCommon({Key? key, this.iconBack = false, this.results})
      : super(key: key);

  final bool iconBack;
  final dynamic results;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconBack
              ? InkWell(
                  onTap: () {
                    Navigator.pop(context, results);
                  },
                  child: const SFIcon(
                    Ics.arrowLeft,
                    width: 32,
                    height: 32,
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, R.setting);
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const SFIcon(
                      Ics.personOutline,
                      width: 16,
                      height: 16,
                      fit: BoxFit.none,
                      color: AppColors.white,
                    ),
                  ),
                ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, R.wallet);
            },
            child: const SFStatisticResource(),
          )
        ],
      ),
    );
  }
}
