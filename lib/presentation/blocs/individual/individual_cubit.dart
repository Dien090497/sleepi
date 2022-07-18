import 'package:bloc/bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/presentation/blocs/individual/individual_state.dart';
import 'package:slee_fi/usecase/get_individual_detail_usecase.dart';
import 'package:slee_fi/usecase/get_nft_family_usecase.dart';

class IndividualCubit extends Cubit<IndividualState> {
  IndividualCubit(BedEntity bed) : super(IndividualState(bed));

  final _getIndividualDetailUC = getIt<GetIndividualDetailUseCase>();
  final _getNftFamilyUC = getIt<GetNftFamilyUseCase>();

  void fetchFamily() async {
    final familyRes = await _getNftFamilyUC.call(state.bed.id);
    familyRes.fold(
      (l) => null,
      (r) {
        emit(state.copyWith(nftFamily: r));
      },
    );
  }

  void refresh() async {
    if (state.isRefresh) return;
    emit(state.copyWith(isRefresh: true));
    final res = await _getIndividualDetailUC.call(state.bed.nftId);
    res.fold(
      (l) {
        emit(state.copyWith(isRefresh: false));
      },
      (r) {
        emit(state.copyWith(isRefresh: false, bed: r));
      },
    );
  }

  loading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }

  updateBed(BedEntity bed) {
    emit(state.copyWith(bed: bed));
  }
}
