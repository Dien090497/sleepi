import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_infoIndividual/bottom_bar_infoIndividual_cubit.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_infoIndividual/bottom_bar_infoIndividual_state.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_bloc.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_event.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_state.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_cancel_sell.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/pop_up_sell.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/jewel_dialog_body.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/my_jewel_short_widget.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/upgrade_tab.dart';

class TabJewelsDetail extends StatefulWidget {
  const TabJewelsDetail({Key? key}) : super(key: key);

  @override
  State<TabJewelsDetail> createState() => _TabJewelsDetailState();
}

class _TabJewelsDetailState extends State<TabJewelsDetail> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SFSubTabBar(
                  labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                  texts: const [LocaleKeys.jewels, LocaleKeys.upgrade]),
              const SizedBox(height: 12),
              Expanded(
                child: TabBarView(
                  children: [
                    BlocBuilder<JewelBloc, JewelState>(
                      builder: (context, state) {
                        final cubit = context.read<JewelBloc>();
                        return (state is JewelStateLoaded)
                            ? SFGridView(
                                isLoadMore: state.isLoadMore,
                                onLoadMore: _onLoadMore(cubit),
                                count: state.jewels.length,
                                childAspectRatio: 1,
                                onRefresh: () {
                                  cubit.add(const JewelRefreshList());
                                },
                                itemBuilder: (context, i) {
                                  return GestureDetector(
                                    onTap: () {
                                      _showJewelDialog(
                                        context, state.jewels[i],);
                                    },
                                    child: MyJewelsShortWidget(
                                        jewel: state.jewels[i]),
                                  );
                                },
                              )
                            : const Center(child: CircularProgressIndicator());
                      },
                    ),
                    const UpGradeTab(isJewel: true),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  _onLoadMore(JewelBloc cubit) async {
    cubit.add(const JewelFetchList());
    return Future.delayed(const Duration(milliseconds: 1500));
  }

  void _showJewelDialog(BuildContext context, BedEntity jewel,) {
    showCustomDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: [
        JewelDialogBody(
          textOnSell: (jewel.isLock == 1 && jewel.statusNftSale == 'ON_SALE') ? LocaleKeys.cancel_sell : LocaleKeys.sell,
          jewel: jewel,
          onSellTap: () {
            Navigator.pop(context);
            final cubit = BottomBarInfoIndividualCubit()..init();
            showCustomDialog(context, children: [
              BlocProvider(
                create: (context) => cubit,
                child: BlocConsumer<BottomBarInfoIndividualCubit, BottomBarInfoIndividualState>(
                  listener: (context, state) {
                    if (state is BottomBarInfoIndividualError) {
                      showMessageDialog(context, state.message);
                    }
                    if (state is BottomBarInfoIndividualLoaded) {
                      if (state.successTransfer) {
                        showSuccessfulDialog(context, null, onBackPress: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            R.bottomNavigation,
                                (r) => false,
                          );
                        });
                      }
                    }
                  },
                  builder: (context, state) {
                    if (jewel.isLock == 1 && jewel.statusNftSale == 'ON_SALE') {
                      return CancelSell(
                        bedEntity: jewel,
                        cubit: cubit,
                      );
                    } else {
                      return PopUpSell(
                        bedEntity: jewel,
                        cubit: cubit,
                      );
                    }

                  },
                ),
              ),
            ]);
          },
          onTransferTap: () {},
        ),
      ],
    );
  }
}
