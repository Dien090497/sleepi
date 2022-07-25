import 'package:injectable/injectable.dart';

@module
abstract class ConstInjection {
  @dev
  @Named('baseUrl')
  String get baseUrlDev => 'https://test.sleefi.com/api/v1';

  @prod
  @Named('baseUrl')
  String get baseUrlProd => 'https://stg.sleefi.com/api/v1';

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
}
