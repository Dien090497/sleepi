import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';

part 'nft_list_state.freezed.dart';

@freezed
class NftListState with _$NftListState {
  const factory NftListState.initial({
    @Default(1) int page,
    @Default(10) int limit,
  }) = NftListInitial;

  const factory NftListState.loading() = NftListLoading;

  const factory NftListState.loaded({
    required List<BedEntity> listBed,
    required List<BedEntity> listBedBox,
    @Default(false) bool isLoadMore,
    @Default(false) isLoadMoreBedBox,
    @Default(true) bool hasMore,
    @Default(true) bool hasMoreBedBox,
    @Default(1) int currentPage,
    @Default(1) int currentPageBedBox,
    @Default(10) int limit,
    BedEntity? openBedBoxSuccess,
  }) = NftListLoaded;

  const factory NftListState.error(String msg) = NftListError;
}
