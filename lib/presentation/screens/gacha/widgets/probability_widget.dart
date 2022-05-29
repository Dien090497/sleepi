import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';

class ProbabilityWidget extends StatelessWidget {
  const ProbabilityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, R.probability);
        },
        child: Image.asset('assets/images/bedroom_gacha.png'),
      ),
    );
  }
}
