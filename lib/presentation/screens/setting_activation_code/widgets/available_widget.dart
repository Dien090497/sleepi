import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/setting_activation_code/widgets/container_box_widget.dart';

class AvailableWidget extends StatelessWidget {
  const AvailableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerBoxWidget(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.16,
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
                child: SFText(
              keyText: "${LocaleKeys.available.tr()}/${LocaleKeys.total.tr()}",
              style: TextStyles.lightGrey16,
            )),
            const SizedBox(height: 8.0),
            Center(
                child: SFText(
              keyText: "0/3",
              style: TextStyles.bold30White,
            ))
          ],
        ),
      ),
    );
  }
}
