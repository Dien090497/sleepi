import 'package:bloc/bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/presentation/blocs/individual/individual_state.dart';
import 'package:slee_fi/usecase/bed_detail_usecase.dart';
import 'package:slee_fi/usecase/get_nft_family_usecase.dart';

class IndividualCubit extends Cubit<IndividualState> {
  IndividualCubit(BedEntity bed)
      : super(IndividualState(bed, currentPoints: [
          bed.efficiency,
          bed.luck,
          bed.bonus,
          bed.special,
          bed.resilience,
        ]));

  final _detailBedUseCase = getIt<BedDetailUseCase>();
  final _getNftFamilyUC = getIt<GetNftFamilyUseCase>();

  void fetchFamily() async {
    final params = ParamsFamily(bedId: state.bed.nftId);
    final familyRes = await _getNftFamilyUC.call(params);
    familyRes.fold(
      (l) {},
      (result) {
        if (isClosed) return;
        final listQueryChildren = result.queryChildren.map((e) => e.toEntity()).toList();
        final listQueryParent = result.queryParent.map((e) => e.toEntity()).toList();
        emit(state.copyWith(queryChildren: listQueryChildren, queryParent: listQueryParent));
      },
    );
  }

  void refresh({bool? isBase}) async {
    if (state.isRefresh) return;
    emit(state.copyWith(isRefresh: true));
    final res = await _detailBedUseCase.call(BedDetailParams(
        bedId: state.bed.nftId, isBase: isBase ?? state.isBase));
    res.fold(
      (l) {
        emit(state.copyWith(isRefresh: false, isLoading: false));
      },
      (bed) {
        isBase ?? state.isBase
            ? emit(
                state.copyWith(
                  isRefresh: false,
                  isLoading: false,
                  bed: bed,
                ),
              )
            : isBase != null && !isBase && state.isBase
                ? emit(
                    state.copyWith(
                        isRefresh: false,
                        isLoading: false,
                        currentPoints: [
                          bed.efficiency,
                          bed.luck,
                          bed.bonus,
                          bed.special,
                          bed.resilience,
                        ]),
                  )
                : emit(
                    state.copyWith(
                        isRefresh: false,
                        isLoading: false,
                        bed: bed,
                        currentPoints: [
                          bed.efficiency,
                          bed.luck,
                          bed.bonus,
                          bed.special,
                          bed.resilience,
                        ]),
                  );
        fetchFamily();
      },
    );
  }

  void changeIsBase() async {
    if (state.isLoading) return;
    final newState = state.copyWith(isBase: !state.isBase, isLoading: true);
    emit(newState);
    final res = await _detailBedUseCase
        .call(BedDetailParams(bedId: state.bed.nftId, isBase: state.isBase));
    res.fold(
      (l) {
        emit(newState.copyWith(isRefresh: false, isLoading: false));
      },
      (r) {
        emit(newState.copyWith(isRefresh: false, isLoading: false, bed: r));
      },
    );
  }

  void loading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }

  void updateBed(BedEntity bed) {
    emit(state.copyWith(bed: bed));
  }
}
