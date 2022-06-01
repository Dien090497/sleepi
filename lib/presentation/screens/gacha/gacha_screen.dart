import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/items_gacha.dart';

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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12),
                  children: const [
                    ItemsGacha(
                      title: LocaleKeys.normal_gacha,
                    ),
                    ItemsGacha(
                      title: LocaleKeys.special_gacha,
                    ),
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
