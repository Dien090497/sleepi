import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/models/time/time_model.dart';

part 'time_api.g.dart';

@Injectable()
@RestApi(baseUrl: Const.timeApi)
abstract class TimeApi {
  @factoryMethod
  factory TimeApi(Dio dio, {@factoryParam String? baseUrl}) = _TimeApi;

  @GET('/timezone')
  Future<List<String>> getTimeZone();

  @GET('/{location}')
  Future<TimeModel> getTimeByLocation(@Path('location') String location);
}
