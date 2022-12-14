import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_interceptor.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/queue_interceptor.dart';
import 'package:slee_fi/models/bed_model/beb_model.dart';
import 'package:slee_fi/models/list_nft_data_model/list_nft_data_model.dart';
import 'package:slee_fi/models/minting/info_minting_model.dart';
import 'package:slee_fi/models/minting/minting_model.dart';
import 'package:slee_fi/models/nft_family/nft_family_model.dart';
import 'package:slee_fi/models/nft_level_up_response/nft_level_up_response.dart';
import 'package:slee_fi/schema/level_up/level_up_schema.dart';
import 'package:slee_fi/schema/minting/minting_schema.dart';

part 'nft_api.g.dart';

@Injectable()
@RestApi()
abstract class NftApi {
  @factoryMethod
  factory NftApi(
    Dio dio,
    AuthInterceptor authInterceptor,
    QueueInterceptor queueInterceptor,
    @Named('baseUrl') String baseUrl,
  ) {
    dio.interceptors.addAll([
      authInterceptor,
      queueInterceptor,
    ]);
    return _NftApi(dio, baseUrl: '$baseUrl/nft');
  }

  @GET('')
  Future<ListNftDataModel> getListNft({
    @Query('tokenIds') required String tokenIds,
    @Query('nftType') required NftType nftType,
  });

  @GET('/family-nft')
  Future<NftFamilyModel> family(
    @Query('bedId') num bedId,
  );

  @GET('/get-level-up')
  Future<NftLevelUp> getLevelUp(@Query('bedId') int bedId);

  @POST('/level-up')
  Future<BedModel> levelUp(@Body() LevelUpSchema body);

  @GET('/get-minting/{bedIdParent1}/{bedIdParent2}')
  Future<InfoMintingModel> getMinting(@Path('bedIdParent1') int bedIdParent1,
      @Path('bedIdParent2') int bedIdParent2);

  @POST('/minting')
  Future<MintingModel> minting(@Body() MintingSchema body);
}
