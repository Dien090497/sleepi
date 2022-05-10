import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_tab_bar.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/tab_beds_detail.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/tab_item_detail.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/tab_jewels_detail.dart';

class ProductDetaiScreen extends StatelessWidget {
  const ProductDetaiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              const TopBarCommon(),
              SFTabBar(
                texts: const [Keys.beds, Keys.jewels, Keys.item, Keys.trophy],
              ),
              const SizedBox(height: 35),
              const Expanded(
                child: TabBarView(
                  children: [
                    TabBedsDetail(),
                    TabJewelsDetail(),
                    TabItemDetail(),
                    SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
