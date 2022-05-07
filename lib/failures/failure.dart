import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
}

class FailureMessage extends Failure {
  final String msg;

  const FailureMessage(this.msg);

  @override
  List<Object?> get props => [msg];
}
