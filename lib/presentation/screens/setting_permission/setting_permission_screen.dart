import 'package:flutter/material.dart';
import 'package:slee_fi/presentation/screens/setting_permission/widgets/mic_screen.dart';

class SettingPermissionScreen extends StatelessWidget {
  const SettingPermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: MicPermissionScreen(),
    );
  }
}
