import 'package:injectable/injectable.dart';
import 'package:slee_fi/resources/resources.dart';

@module
abstract class DevInjection {
  /// Sotatek
  @dev
  @Named('baseUrl')
  String get baseUrl => 'https://test.sleefi.com/api/v1';

  @dev
  @Named('contractRouter')
  String get contractRouterDev => '0xd7f655E3376cE2D7A2b08fF01Eb3B1023191A901';

  @dev
  @Named('tokens')
  List<dynamic> get tokens => [
        {
          "address": "0xd00ae08403B9bbb9124bB305C09058E32C39A48c",
          "symbol": "AVAX",
          "decimal": 18,
          "totalSupply": 858592.343225,
          "icon": Ics.icAvax,
        },
        {
          "address": "0x2bB8Bc1C29F34f3795661452Bf806cB5D65DF8DC",
          "symbol": "SLFT",
          "decimal": 18,
          "totalSupply": 6003000000,
          "icon": Ics.icSlft,
        },
        {
          "address": "0x41Dd35f9e440ADecB9A04fA839D0be2b19722Ade",
          "symbol": "SLGT",
          "decimal": 18,
          "totalSupply": 12000000000,
          "icon": Ics.icSlgt,
        },
        {
          "address": "0x950C6F4F97DD62bd3cA76f084663224FD2E6b555", //testnet
          "symbol": "USDC",
          "decimal": 6,
          "totalSupply": 10000,
          "icon": Ics.icUsdc,
        },
      ];
}
