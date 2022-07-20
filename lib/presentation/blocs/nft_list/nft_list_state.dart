import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';

part 'nft_list_state.freezed.dart';

@freezed
class NftListState with _$NftListState {
  const factory NftListState.initial() = NftListInitial;

  const factory NftListState.loading() = NftListLoading;

  const factory NftListState.loaded(List<BedEntity> listBed, bool isLoadMore) = NftListLoaded;

  const factory NftListState.error(String msg) = NftListError;
}
