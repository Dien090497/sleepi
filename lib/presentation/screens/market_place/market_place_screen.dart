import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_tab_bar.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/market_place/market_place_cubit.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_beds_buy.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_items_buy.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_jewels_buy.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_trophys_buy.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';

class MarketPlaceScreen extends StatefulWidget {
  const MarketPlaceScreen({Key? key, required this.tabKey}) : super(key: key);
  final GlobalKey<SFTabBarState> tabKey;

  @override
  State<MarketPlaceScreen> createState() => _MarketPlaceScreenState();
}

class _MarketPlaceScreenState extends State<MarketPlaceScreen> {
  final MarketPlaceCubit bedCubit = MarketPlaceCubit();
  final MarketPlaceCubit jewelCubit = MarketPlaceCubit();
  final MarketPlaceCubit itemCubit = MarketPlaceCubit();
  final List<MarketPlaceCubit> cubits = [];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    cubits.addAll([bedCubit, jewelCubit, itemCubit]);
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopBarCommon(),
            const SizedBox(height: 20),
            MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => bedCubit),
                  BlocProvider(create: (_) => jewelCubit),
                  BlocProvider(create: (_) => itemCubit),
                ],
                child: Expanded(
                  child: SFTabBar(
                    onTabChange: (index) {
                      if(index<3) {
                        if (index == _currentIndex) {
                          return;
                        }
                        cubits[index].clearFilter();
                        _currentIndex = index;
                      }
                    },
                    key: widget.tabKey,
                    isScrollable: true,
                    texts: const [
                      LocaleKeys.bed,
                      LocaleKeys.jewels,
                      LocaleKeys.item,
                      LocaleKeys.trophy
                    ],
                    children: [
                      TabBedsBuy(cubit: bedCubit..init(CategoryType.bed)),
                      TabJewelsBuy(cubit: jewelCubit..init(CategoryType.jewel)),
                      TabItemsBuy(cubit: itemCubit..init(CategoryType.item)),
                      const TabTrophysBuy(),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
