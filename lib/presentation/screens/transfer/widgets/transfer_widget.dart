import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/setting_activation_code/widgets/container_box_widget.dart';
import 'package:slee_fi/resources/resources.dart';

class TransferWidget extends StatelessWidget {
  const TransferWidget({Key? key, required this.swapText}) : super(key: key);
  final bool swapText;

  @override
  Widget build(BuildContext context) {
    return ContainerBoxWidget(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      Ics.icArrowUpRight,
                      color: AppColors.blue,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SFText(
                        keyText: LocaleKeys.from,
                        style: TextStyles.lightGrey12,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: SFText(
                    keyText: swapText ? LocaleKeys.spending : LocaleKeys.wallet,
                    style: TextStyles.bold18White),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
                CircleAvatar(
                  backgroundColor: AppColors.blue,
                  child: Icon(
                    Icons.swap_vert,
                    size: 30,
                    color: AppColors.white,
                  ),
                ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      Ics.walletTo,
                      color: AppColors.blue,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SFText(
                        keyText: LocaleKeys.to,
                        style: TextStyles.lightGrey12,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: SFText(
                  keyText: swapText ? LocaleKeys.wallet : LocaleKeys.spending,
                  style: TextStyles.bold18White,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
