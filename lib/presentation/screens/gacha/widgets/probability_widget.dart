import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/probability_dialog.dart';
import 'package:slee_fi/resources/resources.dart';

class ProbabilityWidget extends StatelessWidget {
  const ProbabilityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GestureDetector(
        onTap: () {
          // Navigator.pushNamed(context, R.probability);
          showCustomAlertDialog(context,
              children: const ProbabilityDialog());
        },
        child: Image.asset(Imgs.bedroomGacha),
      ),
    );
  }
}
