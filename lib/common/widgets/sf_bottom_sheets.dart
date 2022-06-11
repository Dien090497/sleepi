import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/filter_sheet.dart';

Future<T?> showFilterModalBottomSheet<T>(BuildContext context,
    {required Map<String, FilterSliderValues> sliders,
    required Map<String, List<String>> sections}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.lightDark,
    constraints: BoxConstraints(minHeight: 640.h, maxHeight: 640.h),
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
    builder: (_) => FilterSheet(sections: sections, sliders: sliders),
    barrierColor: AppColors.dark.withOpacity(0.8),
  );
}
