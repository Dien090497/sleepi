import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/bed_model/beb_model.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/top_left_banner.dart';

class MyItemShortWidget extends StatelessWidget {
  const MyItemShortWidget({Key? key, required this.item})
      : super(key: key);

  final BedModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            top: 14,
            left: -30,
            child: TopLeftBanner(
              text: '${LocaleKeys.level.tr()} ${item.level}',
              textColor: AppColors.lightGrey,
              backgroundColor: AppColors.lightGrey.withOpacity(0.1),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: item.image,
                placeholder: (context, url) => const Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                    decoration: const BoxDecoration(
                      color: AppColors.transparent,
                      borderRadius:
                      BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Icon(Icons.error)),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                width: 60,
                height: 60,
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: AppColors.light4),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    alignment: Alignment.center,
                    child: SFText(
                      keyText: item.nftId.toString(),
                      style: TextStyles.white1w700size12,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        // border: Border.all(color: AppColors.light4),
                        color: AppColors.green.withOpacity(0.15)),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    alignment: Alignment.center,
                    child: SFText(
                      keyText: '+ ${item.quality}%',
                      style: TextStyles.greenW700size12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
