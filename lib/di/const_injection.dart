import 'package:injectable/injectable.dart';
import 'package:slee_fi/resources/resources.dart';

@module
abstract class ConstInjection {
  @dev
  @Named('baseUrl')
  String get baseUrlDev => 'https://test.sleefi.com/api/v1';

  @prod
  @Named('baseUrl')
  String get baseUrlProd => 'https://staging.sleefi.com/api/v1';

  @test
  @Named('baseUrl')
  String get baseUrlStg => 'https://test.sleefi.com/api/v1';

  @test
  @Named('nftAddresses')
  List<String> get listNFTAddressTestNet => [
        '0xAd94cdceBA5cE30F04e1842d37edF950c031E405',
        '0x19bD6f64d865A467478153A549568aa63d123Bd4',
        '0x3C3D1C2e1a817d21C26aA99E146a6795b4748aD3',
        '0x0CF58517D57Cc0479a7aDfdC7f5094624Bc2FcB9',
      ];

  @dev
  @Named('contractRouter')
  String get contractRouterDev => '0xd7f655E3376cE2D7A2b08fF01Eb3B1023191A901';

  @prod
  @Named('contractRouter')
  String get contractRouterProd => '0x60aE616a2155Ee3d9A68541Ba4544862310933d4';

  @dev
  @Named('tokens')
  List<dynamic> get tokensDev=>[
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
      "address": "0x6346C85e28b1E3276828E8153aFA21BA8F522A5e", //testnet
      "symbol": "USDC",
      "decimal": 6,
      "totalSupply": 1000000000000000,
      "icon": Ics.icUsdc,
    },
  ];

  @prod
  @Named('tokens')
  List<dynamic> get tokensProd=>[
    {
      "address": "0xb31f66aa3c1e785363f0875a1b74e27b85fd66c7",
      "symbol": "AVAX",
      "decimal": 18,
      "totalSupply": 858592.343225,
      "icon": Ics.icAvax,
    },
    {
      "address": "0x813f65d0fB158EEFB43c1Cdd3ddabcF5fD177F43",
      "symbol": "SLFT",
      "decimal": 18,
      "totalSupply": 1000000000,
      "icon": Ics.icSlft,
    },
    {
      "address": "0xE7f0c8aD68bB70E6F2395d2Fc51AeD630D6b767E",
      "symbol": "SLGT",
      "decimal": 18,
      "totalSupply": 12000000000,
      "icon": Ics.icSlgt,
    },
    {
      "address": "0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E",
      "symbol": "USDC",
      "decimal": 6,
      "totalSupply": 1000000000000000,
      "icon": Ics.icUsdc,
    },
  ];
}
