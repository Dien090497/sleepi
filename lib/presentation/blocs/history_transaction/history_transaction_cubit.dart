import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/usecase/current_network_explorer_usecase.dart';
import 'package:slee_fi/usecase/get_history_transaction_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:url_launcher/url_launcher.dart';

import 'history_transaction_state.dart';

class HistoryTransactionCubit extends Cubit<HistoryTransactionState> {
  HistoryTransactionCubit() : super(const HistoryTransactionState.initial());
  late int page = 1;
  late int limit = 10;
  late bool loadMore = false;
  late bool error = false;

  final _networkExplorerUC = getIt<CurrentNetworkExplorerUseCase>();
  final _getHistoryTransactionUC = getIt<GetHistoryTransactionUseCase>();

  refresh(HistoryTransactionParams params) {
    emit(const HistoryTransactionState.refreshHistory());
    page = 1;
    loadMore = false;
    getHistoryTransaction(HistoryTransactionParams(
        tokenSymbol: params.tokenSymbol,
        typeHistory: params.typeHistory,
        page: page));
  }

  Future<void> loadMoreHistoryTransaction(
      HistoryTransactionParams params) async {
    getHistoryTransaction(HistoryTransactionParams(
        tokenSymbol: params.tokenSymbol,
        typeHistory: params.typeHistory,
        page: page));
  }

  Future<void> getHistoryTransaction(HistoryTransactionParams params) async {
    emit(const HistoryTransactionState.loadingHistory());
    final result = await _getHistoryTransactionUC.call(params);

    result.fold(
      (l) {
        emit(HistoryTransactionState.error('$l'));
      },
      (history) {
        page++;
        emit(HistoryTransactionState.getHistorySuccess(history));
      },
    );
  }

  Future<void> getCurrentNetworkExplorer(String hash) async {
    final result = await _networkExplorerUC.call(NoParams());
    result.fold(
      (l) {
        emit(HistoryTransactionState.error('$l'));
      },
      (s) async {
        final path = '$s/tx/$hash';
        final url = Uri.parse(path);
        if (await canLaunchUrl(url)) {
          launchUrl(url);
        }
        emit(HistoryTransactionState.getUrlDetailTransactionSuccess(path));
      },
    );
  }
}
