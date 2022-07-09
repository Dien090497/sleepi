import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';

class PopWithResults<T> {
  /// poped from this page
  final String? fromPage;

  /// pop until this page
  final String toPage;

  /// results
  final WalletInfoEntity results;

  /// constructor
  PopWithResults(
      {required this.fromPage, required this.toPage, required this.results});
}
