import 'package:bloc/bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/presentation/blocs/individual/individual_state.dart';
import 'package:slee_fi/schema/level_up/get_level_up_schema.dart';
import 'package:slee_fi/usecase/get_individual_detail_usecase.dart';
import 'package:slee_fi/usecase/get_level_up_usecase.dart';

class IndividualCubit extends Cubit<IndividualState> {
  IndividualCubit(BedEntity bed) : super(IndividualState(bed));

  final _getIndividualDetailUC = getIt<GetIndividualDetailUseCase>();



  void refresh() async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));
    final res = await _getIndividualDetailUC.call(state.bed.nftId);
    res.fold(
      (l) {
        emit(state.copyWith(isLoading: false));
      },
      (r) {
        emit(state.copyWith(isLoading: false, bed: r));
      },
    );
  }


}
