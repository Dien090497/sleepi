import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/gacha_history_response/gacha_history_response.dart';
import 'package:slee_fi/models/gacha_probability_config_response/gacha_probability_config_response.dart';
import 'package:slee_fi/models/gacha_spin_response/gacha_spin_response.dart';
import 'package:slee_fi/schema/gacha/gacha_spin_schema.dart';

abstract class IGachaRepository {
  Future<Either<Failure, GachaSpinResponse>> spinBonus(GachaSpinSchema params);

  Future<Either<Failure, GachaProbabilityConfigResponse>> getProbabilityConfig();

  Future<Either<Failure, GachaHistoryResponse>> getGachaHistory();

  Future<Either<Failure, GachaSpinResponse>> gachaGetCommon();

  Future<Either<Failure, GachaSpinResponse>> gachaGetSpecial();

}
