import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/entities/user/user_info_entity.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_state.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/usecase/fetch_balance_spending_usecase.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState.initial()) {
    on<UpdateUser>(_onUpdateUser);
    on<InitialUser>(
      (event, emit) => emit(const UserState.initial()),
    );
  }

  final _fetchBalanceSpendingUC = getIt<FetchBalanceSpendingUseCase>();
  Timer? _timer;

  final _defaultTokens = [
    const TokenEntity(
        address: '',
        displayName: '',
        name: '',
        symbol: 'SLFT',
        icon: Ics.icSlft,
        balance: 0),
    const TokenEntity(
        address: '',
        displayName: '',
        name: '',
        symbol: 'SLGT',
        icon: Ics.icSlgt,
        balance: 0),
    const TokenEntity(
        address: '',
        displayName: '',
        name: '',
        symbol: 'AVAX',
        icon: Ics.icAvax,
        balance: 0),
  ];

  void _onUpdateUser(UpdateUser event, emit) {
    final currentState = state;
    if (currentState is UserLoaded) {
      emit(currentState.copyWith(userInfoEntity: event.userInfoEntity));
    } else {
      emit(UserState.loaded(event.userInfoEntity, _defaultTokens));
    }
    _init(emit);
  }

  _init(emit) async {
    _fetch(emit);
    _timer ??=
        Timer.periodic(const Duration(seconds: 10), (timer) => _fetch(emit));
  }

  _fetch(emit) async {
    'run to fetch '.log;
    var currentState = state;

    if (currentState is UserLoaded) {
      var balanceUC = await _fetchBalanceSpendingUC
          .call('${currentState.userInfoEntity.id}');

      balanceUC.fold((l) {
        'on load balance error '.log;
      }, (r) {
        if (r.isNotEmpty) {
          final list = r
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
              .reversed;
          emit(currentState.copyWith(tokens: list.toList()));
        }
      });
    }
  }

  String _catchIcon(String symbol) {
    if (symbol == 'slgt') return Ics.icSlgt;
    if (symbol == 'slft') return Ics.icSlft;
    return Ics.icAvax;
  }
}
