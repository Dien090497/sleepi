import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/chance_widget.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/decorated_widget.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/gacha_roll_selections.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/items_gacha.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/probability_widget.dart';
import 'package:slee_fi/resources/resources.dart';

class GachaScreen extends StatelessWidget {
  const GachaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBarCommon(),
              Expanded(
                child: ListView(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                  children: const [
                    ItemsGacha(title: Keys.normalGacha,),
                    ItemsGacha(title: Keys.specialGacha,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
