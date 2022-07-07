import 'package:equatable/equatable.dart';
import 'package:slee_fi/common/enum/enum.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();
}

class GetCurrentNetWork extends SettingEvent {
  const GetCurrentNetWork();

  @override
  List<Object?> get props => [];
}

class SwitchNetWork extends SettingEvent {
  final NetWorkEnum netWorkEnum;

  const SwitchNetWork(this.netWorkEnum);

  @override
  List<Object?> get props => [netWorkEnum];
}
