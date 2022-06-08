import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/models/network/network.dart';
import 'package:slee_fi/resources/resources.dart';

extension NetworkX on Network {
  String get cryptoIcon => CryptoIcons.values.firstWhere(
        (e) => e.lowerCaseName == nativeCurrency.symbol.toLowerCase(),
        orElse: () => CryptoIcons.values.firstWhere(
            (e) => e.lowerCaseName == chain.toLowerCase(),
            orElse: () => CryptoIcons.values.firstWhere(
                (e) => e.lowerCaseName == shortName,
                orElse: () => '')),
      );
}
