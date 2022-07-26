import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/nft_list/nft_list_state.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';
import 'package:slee_fi/usecase/open_bed_box_usecase.dart';

class NFTListCubit extends Cubit<NftListState> {
  NFTListCubit() : super(const NftListState.loading());
  final _fetchListBedUC = getIt<FetchBedUseCase>();
  final _openBedBoxUC = getIt<OpenBedBoxUseCase>();

  int _currentPage = 1;
  int _currentPageBedBox = 1;
  final _limit = 10;

  bool isLoading = false;

  init(CategoryType idCategory) async {
    emit(const NftListState.loading());
    getNFTList(idCategory);
  }

  refresh(CategoryType idCategory) {
    _currentPage = 1;
    getNFTList(idCategory);
  }

  refreshBedBox(CategoryType idCategory) {
    _currentPageBedBox = 1;
    fetchBedBox(idCategory);
  }

  Future<void> getNFTList(CategoryType idCategory) async {
    if (isLoading) return;

    isLoading = true;
    final result = await _fetchListBedUC.call(FetchBedParam(
      _currentPage,
      _limit,
      idCategory,
      bedType: 'bed',
    ));
    isLoading = false;

    result.fold((l) {
      emit(NftListState.error('$l'));
    }, (success) {
      final currentState = state;
      if (currentState is NftListLoaded) {
        emit(currentState.copyWith(
            listBed: _currentPage > 1
                ? currentState.listBed +
                    success.map((e) => e.toEntity()).toList()
                : success.map((e) => e.toEntity()).toList(),
            isLoadMore: success.length >= _limit));
      } else {
        emit(NftListState.loaded(
            listBed: success.map((e) => e.toEntity()).toList(),
            isLoadMore: success.length >= _limit,
            listBedBox: []));
      }
      _currentPage++;
    });
  }

  Future<void> fetchBedBox(CategoryType idCategory) async {
    if (isLoading) return;
    isLoading = true;
    final result = await _fetchListBedUC.call(FetchBedParam(
      _currentPageBedBox,
      _limit,
      idCategory,
      bedType: 'bedbox',
    ));
    isLoading = false;

    result.fold((l) {
      emit(NftListState.error('$l'));
    }, (success) {
      final currentState = state;
      if (currentState is NftListLoaded) {
        emit(currentState.copyWith(
            listBedBox: _currentPageBedBox > 1
                ? currentState.listBed +
                    success.map((e) => e.toEntity()).toList()
                : success.map((e) => e.toEntity()).toList(),
            isLoadMore: success.length >= _limit));
      } else {
        emit(NftListState.loaded(
          listBedBox: success.map((e) => e.toEntity()).toList(),
          listBed: [],
          isLoadMoreBedBox: success.length >= _limit,
        ));
      }
      _currentPageBedBox++;
    });
  }

  openBedBox(int id) async {
    final result = await _openBedBoxUC.call(id);
    result.fold((l) => print('open lucky box error  ${l.msg} '),
        (r) => print('open lucky box success ${json.encode(r)}'));
  }
}
