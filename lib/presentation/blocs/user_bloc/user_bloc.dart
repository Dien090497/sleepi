import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:slee_fi/entities/user/user_info_entity.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_state.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState.initial()) {
    on<UpdateUser>(_onUpdateUser);
  }

  void _onUpdateUser(UpdateUser event, emit) {
    final currentState = state;
    if (currentState is UserLoaded) {
      emit(currentState.copyWith(userInfoEntity: event.userInfoEntity));
    } else {
      emit(UserState.loaded(event.userInfoEntity));
    }
  }
}
