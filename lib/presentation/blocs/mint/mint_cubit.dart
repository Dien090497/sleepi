import 'package:flutter_bloc/flutter_bloc.dart';

import 'mint_state.dart';

class MintCubit extends Cubit<MintState> {
  MintCubit()
      : super(const MintState.initial());

  void init(){
    emit(const MintState.loaded(indexSelected: -1));
  }

  void selectBed(int index) {
    final currentState = state;
    if (currentState is MintStateSelected) {
      emit(currentState.copyWith(indexSelected: index));
    }
  }
}
