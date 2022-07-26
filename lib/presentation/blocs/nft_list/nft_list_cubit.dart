import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/nft_list/nft_list_state.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';

class NFTListCubit extends Cubit<NftListState> {
  NFTListCubit() : super(const NftListState.loading());
  final _fetchListBedUC = getIt<FetchBedUseCase>();

  int _currentPage = 1;
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

  Future<void> getNFTList(CategoryType idCategory) async {
    if (isLoading) return;

    isLoading = true;
    final result = await _fetchListBedUC
        .call(FetchBedParam(_currentPage, _limit, idCategory));
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
          success.map((e) => e.toEntity()).toList(),
          success.length >= _limit,
        ));
      }
      _currentPage++;
    });
  }
}
