import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/common/widgets/sf_switch.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class NotificationStatusChangeWidget extends StatefulWidget {
  const NotificationStatusChangeWidget({Key? key}) : super(key: key);

  @override
  State<NotificationStatusChangeWidget> createState() => _NotificationStatusChangeState();
}

class _NotificationStatusChangeState extends State<NotificationStatusChangeWidget> {
  bool swNotification = true;

  @override
  Widget build(BuildContext context) {
    return SFListTile(
      leading:const Padding(
        padding:  EdgeInsets.only(left: 8, right: 8),
        child: SFIcon(Ics.icNotifications, width: 24,),
      ),
      text: LocaleKeys.notifications,
      trailing: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: SFSwitch(
          value: swNotification,
          onChanged: (value) {
            setState(() {
              swNotification = value;
            });
          },
        ),
      ),
    );
  }
}
