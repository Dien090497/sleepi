import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_interceptor.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/refresh_token_interceptor.dart';
import 'package:slee_fi/models/list_nft_data_model/list_nft_data_model.dart';
import 'package:slee_fi/models/nft_detail_model/nft_detail_model.dart';
import 'package:slee_fi/models/nft_family/nft_family_model.dart';
import 'package:slee_fi/schema/level_up/get_level_up_schema.dart';
import 'package:slee_fi/schema/level_up/level_up_schema.dart';
import 'package:slee_fi/schema/minting/minting_schema.dart';

part 'nft_api.g.dart';

@Injectable()
@RestApi(
    baseUrl: kDebugMode ? '${Const.baseApiDev}/nft' : '${Const.baseApiDev}/nft')
abstract class NftApi {
  @factoryMethod
  factory NftApi(Dio dio, AuthInterceptor authInterceptor,
      RefreshTokenInterceptor refreshInterceptor) {
    dio.interceptors.addAll([
      authInterceptor,
      refreshInterceptor,
    ]);
    return _NftApi(dio);
  }

  @GET('')
  Future<ListNftDataModel> getListNft({
    @Query('tokenIds') required String tokenIds,
    @Query('nftType') required NftType nftType,
  });

  @GET('/{id}')
  Future<NftDetailModel> detailOf(@Path('id') int nftId);

  @GET('/family-nft')
  Future<NftFamilyModel> family(@Query('id') int bedId);

  @POST('/get-level-up')
  Future<dynamic> getLevelUp(@Body() GetLevelUpSchema body);

  @POST('/level-up')
  Future<dynamic> levelUp(@Body() LevelUpSchema body);

  @GET('/get-minting')
  Future<dynamic> getMinting(
      @Query('bedIdParent1') int bedIdParent1,
      @Query('bedIdParent2') int bedIdParent2,
      @Query('isInsurance') double isInsurance);

  @POST('/minting')
  Future<dynamic> minting(@Body() MintingSchema body);
}
