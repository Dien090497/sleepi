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
      final result = await _fetchListBedUC.call(FetchBedParam(
        currentState.page,
        currentState.limit,
        _idCategory,
        bedType: 'bed',
      ));
      if (isClosed) return;
      result.fold((l) {
        emit(NftListState.error('$l'));
        emit(const NftListState.loaded(
            hasMore: false, listBedBox: [], listBed: []));
      }, (entities) {
        emit(NftListState.loaded(
            hasMore: entities.length >= 10, listBed: entities, listBedBox: []));
      });
    }
  }

  Future<void> refresh() async {
    final currentState = state;
    if (currentState is NftListLoaded) {
      emit(const NftListState.loading());
      final result = await _fetchListBedUC
          .call(FetchBedParam(1, currentState.limit, _idCategory));

      result.fold((l) {
        emit(NftListState.error('$l'));
        emit(currentState.copyWith(listBed: [], hasMore: false));
      }, (entities) {
        emit(currentState.copyWith(
          listBed: entities,
          currentPage: 1,
          hasMore: entities.length >= currentState.limit,
        ));
      });
    }
  }

  void refreshBedBox() async {
    final result = await _fetchListBedUC.call(FetchBedParam(
      1,
      10,
      _idCategory,
      bedType: 'bedbox',
    ));
    if (isClosed) return;
    result.fold((l) {}, (entities) {
      final currentState = state;
      if (currentState is NftListLoaded) {
        emit(currentState.copyWith(
          listBedBox: entities,
          currentPageBedBox: currentState.currentPageBedBox + 1,
          isLoadMoreBedBox: false,
          hasMoreBedBox: entities.length >= currentState.limit,
        ));
      } else {
        emit(NftListState.loaded(
            listBed: [],
            listBedBox: entities,
            hasMoreBedBox: entities.length > 10,
            isLoadMoreBedBox: entities.length > 10));
      }
    });
  }

  Future<void> fetchBedBox() async {
    final currentState = state;
    if (currentState is NftListLoaded) {
      if (currentState.isLoadMoreBedBox) {
        return;
      }
      emit(currentState.copyWith(isLoadMoreBedBox: true));
      final result = await _fetchListBedUC.call(FetchBedParam(
        currentState.currentPageBedBox,
        currentState.limit,
        _idCategory,
        bedType: 'bedbox',
      ));

      result.fold((l) {
        emit(NftListState.error('$l'));
        emit(currentState.copyWith(
          isLoadMoreBedBox: false,
          hasMoreBedBox: false,
        ));
      }, (success) {
        final currentState = state;
        if (currentState is NftListLoaded) {
          emit(currentState.copyWith(
              listBedBox: currentState.listBedBox + success,
              isLoadMoreBedBox: false,
              currentPageBedBox: currentState.currentPageBedBox + 1,
              hasMoreBedBox: success.length >= 10));
        } else {
          emit(NftListState.loaded(
              listBed: [], listBedBox: success, currentPageBedBox: 2));
        }
      });
    }
  }

  void loadMore() async {
    final currentState = state;
    if (currentState is NftListLoaded) {
      if (currentState.isLoadMore) return;
      emit(currentState.copyWith(isLoadMore: true));
      final nextPage = currentState.currentPage + 1;
      final result = await _fetchListBedUC.call(FetchBedParam(
          nextPage, currentState.limit, _idCategory,
          bedType: 'bed'));

      result.fold((l) {
        emit(NftListState.error('$l'));
        emit(currentState.copyWith(isLoadMore: false, hasMore: false));
      }, (entities) {
        final newList = List<BedEntity>.from(currentState.listBed)
          ..addAll(entities);
        emit(currentState.copyWith(
          isLoadMore: false,
          listBed: newList,
          hasMore: entities.length >= currentState.limit,
          currentPage: nextPage,
        ));
      });
    }
  }

  void openBedBox(BedEntity entity) async {
    final result = await _openBedBoxUC.call(entity.id);
    result.fold((l) {
      final currentState = state;
      if (currentState is NftListLoaded) {
        emit(NftListState.error(l.msg));
        emit(currentState);
      }
    }, (r) {
      final currentState = state;
      if (currentState is NftListLoaded) {
        final listBed = List<BedEntity>.from(currentState.listBed);
        final listBedBox = List<BedEntity>.from(currentState.listBedBox);

        listBedBox.remove(entity);
        listBed.add(r);
        emit(currentState.copyWith(
          listBed: listBed,
          listBedBox: listBedBox,
          openBedBoxSuccess: r,
        ));
      }
    });
  }

  clearOpenSuccess() {
    final currentState = state;
    if (currentState is NftListLoaded) {
      emit(currentState.copyWith(openBedBoxSuccess: null));
    }
  }
}
