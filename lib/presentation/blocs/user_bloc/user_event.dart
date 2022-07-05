part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UpdateUser extends UserEvent {
  final UserInfoEntity userInfoEntity;

  const UpdateUser(this.userInfoEntity);

  @override
  List<Object?> get props => [userInfoEntity];
}
