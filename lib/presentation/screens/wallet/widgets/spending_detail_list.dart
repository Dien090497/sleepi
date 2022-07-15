import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/pending/pending_bloc.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/tab_pending_detail.dart';

class SpendingDetailList extends StatelessWidget {
  const SpendingDetailList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.65,
      padding: const EdgeInsets.only(top: 20),
      child: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SFSubTabBar(
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                texts: const [LocaleKeys.pending, LocaleKeys.history],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TabBarView(
                children: [
                  BlocProvider(
                    create: (_) => PendingBloc(),
                    child: const TabPendingDetail(
                      attributeWithdraw: AttributeWithdraw.pending,
                    ),
                  ),
                  BlocProvider(
                    create: (_) => PendingBloc(),
                    child: const TabPendingDetail(
                      attributeWithdraw: AttributeWithdraw.history,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
