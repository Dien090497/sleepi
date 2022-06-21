import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';

part 'import_wallet_state.freezed.dart';

@freezed
class ImportWalletState with _$ImportWalletState {
  const factory ImportWalletState.initial({
    @Default(false) bool isLoading,
  }) = ImportWalletInitial;

  const factory ImportWalletState.success(WalletInfoEntity entity) =
      ImportWalletDone;

  const factory ImportWalletState.errorOtp(String msg) = ImportWalletErrorOtp;

  const factory ImportWalletState.errorMnemonic(String msg) =
      ImportWalletErrorMnemonic;
}
