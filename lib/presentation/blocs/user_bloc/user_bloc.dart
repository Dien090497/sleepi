import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/entities/user/user_info_entity.dart';
import 'package:slee_fi/models/token_spending/token_spending.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_state.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/usecase/fetch_balance_spending_usecase.dart';
import 'package:slee_fi/usecase/get_token_addresses_usecase.dart';
import 'package:slee_fi/usecase/get_user_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState.initial()) {
    on<UpdateUserOrListToken>(_onUpdateUser);
    on<RefreshUser>(_onRefreshUser);
    on<RefreshBalanceToken>(_onRefreshBalance);
  }

  final _fetchBalanceSpendingUC = getIt<FetchBalanceSpendingUseCase>();
  final _getUserUC = getIt<GetUserUseCase>();
  final _getTokenAddressesUC = getIt<GetTokenAddressesUseCase>();
  bool refreshing = false;

  void _onRefreshUser(RefreshUser event, emit) async {
    final currentState = state;

    if (currentState is UserLoaded) {
      final getUserRes = await _getUserUC.call(NoParams());
      getUserRes.fold(
        (l) {},
        (r) {
          emit(currentState.copyWith(userInfoEntity: r));
        },
      );
    }
  }

  void _onRefreshBalance(RefreshBalanceToken event, emit) async {
    final currentState = state;
    if (currentState is UserLoaded) {
      if (refreshing) return;
      refreshing = true;
      final balanceUC = await _fetchBalanceSpendingUC
          .call('${currentState.userInfoEntity.id}');
      await balanceUC.fold((l) async {}, (r) async {
        if (r.isNotEmpty) {
          emit(currentState.copyWith(
              listTokens: await _convertSpendingToEntity(r)));
        }
      });
      refreshing = false;
    }
  }

  void _onUpdateUser(UpdateUserOrListToken event, emit) async {
    final currentState = state;
    if (currentState is UserLoaded) {
      emit(currentState.copyWith(
          userInfoEntity: event.userInfoEntity ?? currentState.userInfoEntity,
          listTokens: event.listTokens != null
              ? await _convertSpendingToEntity(event.listTokens!)
              : currentState.listTokens));
    } else {
      if (event.userInfoEntity != null) {
        emit(UserState.loaded(event.userInfoEntity!,
            await _convertSpendingToEntity(event.listTokens!)));
      } else {
        emit(const UserState.error('No User'));
      }
    }
  }

  Future<List<TokenEntity>> _convertSpendingToEntity(
      List<TokenSpending> list) async {
    if (list.isEmpty) {
      final addrs = (await _getTokenAddressesUC.call(NoParams()))
          .getOrElse(() => [])
          .take(3);
      return [
        TokenEntity(
            address: addrs.elementAt(0),
            displayName: '',
            name: '',
            symbol: 'SLFT',
            icon: Ics.icSlft,
            balance: 0),
        TokenEntity(
            address: addrs.elementAt(1),
            displayName: '',
            name: '',
            symbol: 'SLGT',
            icon: Ics.icSlgt,
            balance: 0),
        TokenEntity(
            address: addrs.elementAt(2),
            displayName: '',
            name: '',
            symbol: 'AVAX',
            icon: Ics.icAvax,
            balance: 0),
      ];
    }
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
