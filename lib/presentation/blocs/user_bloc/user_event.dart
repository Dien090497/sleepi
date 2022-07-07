part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UpdateUserOrListToken extends UserEvent {
  final UserInfoEntity? userInfoEntity;
  final List<TokenSpending>? listTokens;

  const UpdateUserOrListToken({
    this.userInfoEntity,
    this.listTokens,
  });

  @override
  List<Object?> get props => [userInfoEntity, listTokens];
}
