import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/presentation/blocs/nft_list/nft_list_state.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';
import 'package:slee_fi/usecase/open_bed_box_usecase.dart';

class NFTListCubit extends Cubit<NftListState> {
  NFTListCubit(this._idCategory) : super(const NftListState.initial());
  final _fetchListBedUC = getIt<FetchBedUseCase>();
  final _openBedBoxUC = getIt<OpenBedBoxUseCase>();

  final CategoryType _idCategory;

  void init() async {
    final currentState = state;
    if (currentState is NftListInitial) {
      emit(const NftListState.loading());
      final result = await _fetchListBedUC.call(
          FetchBedParam(currentState.page, currentState.limit, _idCategory));

      result.fold((l) {
        emit(NftListState.error('$l'));
        emit(const NftListState.loaded([], hasMore: false));
      }, (entities) {
        emit(NftListState.loaded(entities));
      });
    }
  }

  void refresh() async {
    final currentState = state;
    if (currentState is NftListLoaded) {
      emit(const NftListState.loading());
      final result = await _fetchListBedUC
          .call(FetchBedParam(1, currentState.limit, _idCategory));

      result.fold((l) {
        emit(NftListState.error('$l'));
        emit(const NftListState.loaded([], hasMore: false));
      }, (entities) {
        emit(NftListState.loaded(entities));
      });
    }
  }

  void loadMore() async {
    final currentState = state;
    if (currentState is NftListLoaded) {
      if (currentState.isLoadMore) return;
      emit(currentState.copyWith(isLoadMore: true));
      final nextPage = currentState.currentPage + 1;
      final result = await _fetchListBedUC
          .call(FetchBedParam(nextPage, currentState.limit, _idCategory));

      result.fold((l) {
        emit(NftListState.error('$l'));
        emit(currentState.copyWith(isLoadMore: false, hasMore: false));
      }, (entities) {
        final newList = List<BedEntity>.from(currentState.listBed)
          ..addAll(entities);
        emit(currentState.copyWith(
          isLoadMore: false,
          listBed: newList,
          hasMore: entities.isNotEmpty,
          currentPage: nextPage,
        ));
      });
    }
  }

  void openLuckyBox(int id) async {
    final result = await _openBedBoxUC.call(id);
    result.fold((l) => print('open lucky box error  ${l.msg} '),
        (r) => print('open lucky box success '));
  }
}
