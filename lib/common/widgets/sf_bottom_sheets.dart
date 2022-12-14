import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/presentation/blocs/item_list/item_bloc.dart';
import 'package:slee_fi/presentation/blocs/market_place/market_place_cubit.dart';
import 'package:slee_fi/presentation/screens/home/widgets/filter_sheet_item.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/filter_bed_sheet.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/filter_sheet.dart';


Future<T?> showFilterModalBottomSheet<T>(BuildContext context,
    {required Map<String, FilterSliderValues> sliders,
    required Map<String, List<String>> sections,
    MarketPlaceCubit? cubit}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.lightDark,
    constraints: BoxConstraints(minHeight: 640.h, maxHeight: 640.h),
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
    builder: (_) => FilterSheet(
      sections: sections,
      sliders: sliders,
      cubit: cubit!,
    ),
    barrierColor: AppColors.dark.withOpacity(0.8),
  );
}

Future<T?> showFilterBedModalBottomSheet<T>(BuildContext context,
    {required Map<String, FilterSliderValues> sliders,
      required Map<String, List<String>> sections,
      MarketPlaceCubit? cubit}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.lightDark,
    constraints: BoxConstraints(minHeight: 640.h, maxHeight: 640.h),
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
    builder: (_) => FilterBedSheet(
      sections: sections,
      sliders: sliders,
      cubit: cubit!,
    ),
    barrierColor: AppColors.dark.withOpacity(0.8),
  );
}

Future<T?> showFilterItemBottomSheet<T>(BuildContext context,
    {required ItemBloc itemBloc}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.lightDark,
    constraints: BoxConstraints(minHeight: 640.h, maxHeight: 640.h),
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
    builder: (_) => FilterItem(itemBloc: itemBloc),
    barrierColor: AppColors.dark.withOpacity(0.8),
  );
}
