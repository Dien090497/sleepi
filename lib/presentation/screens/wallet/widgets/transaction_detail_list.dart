import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/utils/date_time_utils.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/isar_models/transaction_isar/transaction_isar_model.dart';
import 'package:slee_fi/presentation/blocs/history_transaction/history_transaction_cubit.dart';
import 'package:slee_fi/presentation/blocs/history_transaction/history_transaction_state.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/usecase/get_history_transaction_usecase.dart';

class TransactionDetailList extends StatefulWidget {
  const TransactionDetailList(
      {this.typeHistory, this.isTransactionRecord = false, Key? key})
      : super(key: key);

  final bool isTransactionRecord;
  final HistoryTransactionParams? typeHistory;

  @override
  State<TransactionDetailList> createState() => _TransactionDetailListState();
}

class _TransactionDetailListState extends State<TransactionDetailList> {
  ScrollController controller = ScrollController();
  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  List<TransactionIsarModel> transactionList = [];
  bool loadMore = false;
  bool isLoading = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dateUtils = getIt<DateTimeUtils>();

    return BlocProvider(
      create: (_) => HistoryTransactionCubit()..getHistoryTransaction(widget.typeHistory!),
      child: BlocConsumer<HistoryTransactionCubit, HistoryTransactionState>(
        listener: (context, state) {
          if(state is HistoryTransactionStateRefreshHistory){
            transactionList = [];
            setState((){
              isLoading = true;
            });
          }
          if(state is HistoryTransactionStateSuccess){
            setState((){
              transactionList.addAll(state.list);
              loadMore = true;
              isLoading = true;
            });
          }
          if(state is HistoryTransactionStateLoadingHistory){
            setState((){
              loadMore = false;
            });
          }
        },
        builder: (context, state) {
          final cubit = context.read<HistoryTransactionCubit>();
          return Container(
            // alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.dark,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            height: MediaQuery.of(context).size.height * 0.55,
            padding: const EdgeInsets.only(top: 20),
            child: isLoading
                ? transactionList.isNotEmpty
                ? SafeArea(
              top: false,
              child: SmartRefresher(
                controller: _refreshController,
                enablePullDown: true,
                enablePullUp: true,
                onRefresh: () {
                  cubit.refresh(widget.typeHistory!);
                },
                onLoading: (){
                  cubit.loadMoreHistoryTransaction(widget.typeHistory!);
                },
                child: ListView.builder(
                  controller: controller,
                  itemCount: transactionList.length,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                  itemBuilder: (BuildContext context, int index) {
                    // final value = state.list[index].valueInEther;
                    // double? valueInEther;
                    // if(value != null) {
                    //   valueInEther = (value.getInWei / BigInt.from(pow(10, 18)));
                    // }
                    return SFCard(
                      // onTap: () async {
                      //   final url = Uri.parse(Const.avascanUrl);
                      //   if (await canLaunchUrl(url)) {
                      //     launchUrl(url);
                      //   }
                      // },
                      radius: 8,
                      margin: EdgeInsets.only(
                          bottom: transactionList.length == index + 1
                              ? 100
                              : 12),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(
                              CupertinoIcons.cloud_download,
                              color: AppColors.blue,
                            ),
                          ),
                          Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  SFText(
                                    keyText: transactionList[index].status == 1
                                        ? "Success"
                                        : "Failed",
                                    style: transactionList[index].status == 1
                                        ? TextStyles.bold16Blue
                                        : TextStyles.red16Italic,
                                  ),
                                  const SizedBox(height: 4.0),
                                  SFText(
                                    keyText: dateUtils.ddMMyyyyHHmm(
                                        transactionList[index].timeStamp),
                                    style: TextStyles.lightGrey14,
                                  ),
                                ],
                              )),
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SFText(
                                    keyText:
                                    "${transactionList[index].valueInEther}",
                                    style: TextStyles.bold16Blue,
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  SFText(
                                    keyText:
                                    "${transactionList[index].addressTo}"
                                        .formatAddress,
                                    style: TextStyles.lightGrey14,
                                  ),
                                ],
                              )),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
                : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SFIcon(Ics.emptyBox),
                    const SizedBox(height: 24),
                    SFText(
                      keyText: LocaleKeys.no_transaction_record,
                      style: TextStyles.lightGrey14,
                    )
                  ],
                ))
                : const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
