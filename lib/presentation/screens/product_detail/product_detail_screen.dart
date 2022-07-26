import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_tab_bar.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_bloc.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/tab_beds_detail.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/tab_item_detail.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/tab_jewels_detail.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/tab_trophy_detail.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({Key? key}) : super(key: key);

  final GlobalKey<SFTabBarState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopBarCommon(),
            const SizedBox(height: 20),
            Expanded(
              child: FocusDetector(
                  child: SFTabBar(
                    key: _globalKey,
                    isScrollable: true,
                    texts: const [
                      LocaleKeys.bed,
                      LocaleKeys.jewels,
                      LocaleKeys.item,
                      LocaleKeys.trophy
                    ],
                    children: [
                      const TabBedsDetail(),
                      BlocProvider(
                        create: (context) => JewelBloc(),
                        child: const TabJewelsDetail(),
                      ),
                      BlocProvider(
                        create: (context) => JewelBloc(),
                        child: const TabItemDetail(),
                      ),
                      const TabTrophyDetail()
                    ],
                  ),
                  onFocusGained: () {
                    _globalKey.currentState?.moveToTab(0);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
