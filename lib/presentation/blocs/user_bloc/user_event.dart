part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UpdateUser extends UserEvent {
  final UserInfoEntity userInfoEntity;
  final List<TokenSpending>? listTokens;

  const UpdateUser(
    this.userInfoEntity, {
    this.listTokens,
  });

  @override
  List<Object?> get props => [userInfoEntity, listTokens];
}
