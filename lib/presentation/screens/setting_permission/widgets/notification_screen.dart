import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/setting_permission/widgets/box_message_widget.dart';

class NotificationPermissionScreen extends StatelessWidget {
  const NotificationPermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            Image.asset("assets/images/notification_permission.png"),
            const BoxMessage(message: Keys.displaysMessageNotificationPermission),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
            SFButton(height: 48,text: Keys.allow,onPressed: () {}, )
          ],
        ),
      ),
    );
  }
}
