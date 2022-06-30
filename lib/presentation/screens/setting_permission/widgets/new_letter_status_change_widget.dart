import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/common/widgets/sf_switch.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class NewLetterStatusChangeWidget extends StatefulWidget {
  const NewLetterStatusChangeWidget({Key? key}) : super(key: key);

  @override
  State<NewLetterStatusChangeWidget> createState() => _NewLetterStatusChangeWidgetState();
}

class _NewLetterStatusChangeWidgetState extends State<NewLetterStatusChangeWidget> {
  bool swNewsLetters = true;

  @override
  Widget build(BuildContext context) {
    return SFListTile(
      leading:const Padding(
        padding:  EdgeInsets.only(left: 8, right: 8),
        child: SFIcon(Imgs.newsLetters, width: 24,),
      ),
      text: LocaleKeys.news_letters,
      trailing: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: SFSwitch(
          value: swNewsLetters,
          onChanged: (value) {
            setState(() {
              swNewsLetters = value;
            });
          },
        ),
      ),
    );
  }
}
