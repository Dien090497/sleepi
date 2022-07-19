import 'package:bloc/bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/presentation/blocs/individual/individual_state.dart';
import 'package:slee_fi/usecase/bed_detail_usecase.dart';
import 'package:slee_fi/usecase/get_nft_family_usecase.dart';

class IndividualCubit extends Cubit<IndividualState> {
  IndividualCubit(BedEntity bed) : super(IndividualState(bed));

  final _detailBedUseCase = getIt<BedDetailUseCase>();
  final _getNftFamilyUC = getIt<GetNftFamilyUseCase>();

  void fetchFamily() async {
    final familyRes = await _getNftFamilyUC.call(state.bed.id);
    familyRes.fold(
      (l) {},
      (r) {
        emit(state.copyWith(nftFamily: r));
      },
    );
  }

  void refresh() async {
    if (state.isRefresh) return;
    emit(state.copyWith(isRefresh: true));
    final res = await _detailBedUseCase
        .call(BedDetailParams(bedId: state.bed.nftId, isBase: state.isBase));
    res.fold(
      (l) {
        emit(state.copyWith(isRefresh: false));
      },
      (r) {
        emit(state.copyWith(isRefresh: false, bed: r));
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
