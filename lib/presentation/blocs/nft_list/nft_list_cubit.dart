import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/nft_list/nft_list_state.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';

class NFTListCubit extends Cubit<NftListState> {
  NFTListCubit() : super(const NftListState.initial());
  final _fetchListBedUC = getIt<FetchBedUseCase>();

  var _currentPage = 1;
  final _limit = 10;

  init(CategoryType idCategory) async {
    emit(const NftListState.loading());
    getNFTList(idCategory);
  }

  refresh(CategoryType idCategory) {
    _currentPage = 1;
    getNFTList(idCategory);
  }

  Future<void> getNFTList(CategoryType idCategory) async {
    final result = await _fetchListBedUC.call(
        FetchBedParam(_currentPage, _limit, idCategory, AttributeNFT.none));
    result.fold((l) {
      emit(NftListState.error('$l'));
    }, (success) {
      log("result : ${success.toString()}");
      final currentState = state;
      if (currentState is NftListLoaded) {
        emit(currentState.copyWith(
            listBed:
                _currentPage > 1 ? currentState.listBed + success : success,
            isLoadMore: success.length >= _limit));
      } else {
        emit(NftListState.loaded(
          success,
          success.length >= _limit,
        ));
      }
      _currentPage++;
    });
  }
}
