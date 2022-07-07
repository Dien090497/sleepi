import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/entities/user/user_info_entity.dart';
import 'package:slee_fi/models/token_spending/token_spending.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_state.dart';
import 'package:slee_fi/resources/resources.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState.initial()) {
    on<UpdateUser>(_onUpdateUser);
  }

  void _onUpdateUser(UpdateUser event, emit) {
    final List<TokenEntity> listTokens;
    if (event.listTokens != null) {
      listTokens = event.listTokens!
          .map((e) {
            return TokenEntity(
                address: e.tokenAddress,
                displayName: e.symbol,
                name: e.symbol,
                symbol: e.symbol,
                icon: _catchIcon(e.symbol),
                balance: double.parse(e.amount));
          })
          .toList()
          .reversed
          .toList();
    } else {
      listTokens = [];
    }
    final currentState = state;
    if (currentState is UserLoaded) {
      emit(currentState.copyWith(
          userInfoEntity: event.userInfoEntity, listTokens: listTokens));
    } else {
      emit(UserState.loaded(event.userInfoEntity, listTokens));
    }
  }

  String _catchIcon(String symbol) {
    if (symbol == 'slgt') return Ics.icSlgt;
    if (symbol == 'slft') return Ics.icSlft;
    return Ics.icAvax;
  }
}
