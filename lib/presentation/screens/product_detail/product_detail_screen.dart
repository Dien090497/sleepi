import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_tab_bar.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/tab_beds_detail.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/tab_item_detail.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/tab_jewels_detail.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TopBarCommon(),
            SizedBox(height: 20),
            Expanded(
              child: SFTabBar(
                isScrollable: true,
                texts: [
                  LocaleKeys.beds,
                  LocaleKeys.jewels,
                  LocaleKeys.item,
                  LocaleKeys.trophy
                ],
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
    );
  }
}
