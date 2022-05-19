import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class PinCodeWidget extends StatelessWidget {
  const PinCodeWidget({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      autoDisposeControllers: true,
      autoFocus: false,
      appContext: context,
      length: Const.passcodeLength,
      onChanged: (v) {},
      mainAxisAlignment: MainAxisAlignment.center,
      obscureText: true,
      backgroundColor: AppColors.transparent,
      enabled: false,
      animationType: AnimationType.scale,
      obscuringWidget: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      ),
      pinTheme: PinTheme(
        inactiveColor: AppColors.white,
        disabledColor: AppColors.white,
        borderWidth: 2,
        fieldWidth: 16.w,
        shape: PinCodeFieldShape.circle,
        fieldOuterPadding: EdgeInsets.symmetric(horizontal: 16.w),
      ),
    );
  }
}
