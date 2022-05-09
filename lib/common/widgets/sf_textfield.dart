import 'package:flutter/material.dart';

class SFTextField extends StatelessWidget {
  const SFTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(10));

    return TextField(
      decoration: InputDecoration(
        border: border,
        focusedBorder: border,
        disabledBorder: border,
        enabledBorder: border,
        errorBorder: border,
        focusedErrorBorder: border,
      ),
    );
  }
}
