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
          "address": "0xd00ae08403B9bbb9124bB305C09058E32C39A48c", //testnet
          "symbol": "AVAX",
          "decimal": 18,
          "totalSupply": 890917.376875,
          "icon": Ics.icAvax,
        },
        {
          "address": "0x3AFb22cdF460F2299D8b6b4443e1c846882646D9",
          "symbol": "SLFT",
          "decimal": 18,
          "totalSupply": 1000000000,
          "icon": Ics.icSlft,
        },
        {
          "address": "0xf196d851EF318357f9ec69a73EA6EbB2a85E6e1d",
          "symbol": "SLGT",
          "decimal": 18,
          "totalSupply": 12000000000,
          "icon": Ics.icSlgt,
        },
        {
          "address": "0x6346C85e28b1E3276828E8153aFA21BA8F522A5e",
          "symbol": "USDC",
          "decimal": 6,
          "totalSupply": 1000000000000000,
          "icon": Ics.icUsdc,
        },
      ];
}
