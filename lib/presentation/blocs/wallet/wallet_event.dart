import 'package:equatable/equatable.dart';

abstract class WalletEvent extends Equatable {
  const WalletEvent();
}

class WalletInit extends WalletEvent{

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}