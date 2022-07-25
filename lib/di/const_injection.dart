import 'package:injectable/injectable.dart';

@module
abstract class ConstInjection {
  @dev
  @Named('baseUrl')
  String get baseUrlDev => 'https://test.sleefi.com/api/v1';

  @prod
  @Named('baseUrl')
  String get baseUrlProd => 'https://test.sleefi.com/api/v1';

  @test
  @Named('baseUrl')
  String get baseUrlStg => 'https://test.sleefi.com/api/v1';
}
