import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/entities/user/user_info_entity.dart';
import 'package:slee_fi/models/token_spending/token_spending.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_state.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/usecase/fetch_balance_spending_usecase.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState.initial()) {
    on<UpdateUserOrListToken>(_onUpdateUser);
    on<StartInterval>(_onStartInterval);
    on<RefreshBalanceToken>(_onRefreshBalance);
    on<InitialUser>(
      (event, emit) => emit(const UserState.initial()),
    );
  }

  //TODO: remove default data
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

  _onRefreshBalance(RefreshBalanceToken event, emit) async {
    final currentState = state;

    if (currentState is UserLoaded) {
      final balanceUC = await _fetchBalanceSpendingUC
          .call('${currentState.userInfoEntity.id}');

      balanceUC.fold((l) {}, (r) {
        if (r.isNotEmpty) {
          emit(currentState.copyWith(listTokens: _convertSpendingToEntity(r)));
        }
      });
    }
  }

  final _fetchBalanceSpendingUC = getIt<FetchBalanceSpendingUseCase>();
  Timer? _timer;

  void _onStartInterval(StartInterval event, emit) {
    add(RefreshBalanceToken());
    _timer ??= Timer.periodic(
        const Duration(seconds: 10), (timer) => add(RefreshBalanceToken()));
  }

  void _onUpdateUser(UpdateUserOrListToken event, emit) {
    final currentState = state;
    if (currentState is UserLoaded) {
      emit(currentState.copyWith(
          userInfoEntity: event.userInfoEntity ?? currentState.userInfoEntity,
          listTokens: event.listTokens != null
              ? _convertSpendingToEntity(event.listTokens!)
              : currentState.listTokens));
    } else {
      if (event.userInfoEntity != null) {
        emit(UserState.loaded(event.userInfoEntity!,
            _convertSpendingToEntity(event.listTokens!)));
      } else {
        emit(const UserState.error('No User'));
      }
    }
  }

  List<TokenEntity> _convertSpendingToEntity(List<TokenSpending> list) {
    if (list.isEmpty) return _defaultTokens;
    return list
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
  }

  String _catchIcon(String symbol) {
    if (symbol == 'slgt' || symbol == 'SLGT') return Ics.icSlgt;
    if (symbol == 'slft' || symbol == 'SLFT') return Ics.icSlft;
    return Ics.icAvax;
  }
}
