import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/gacha_spin_response/gacha_spin_response.dart';
import 'package:slee_fi/schema/gacha/gacha_spin_schema.dart';

abstract class IGachaRepository {
  Future<Either<Failure, GachaSpinResponse>> spinBonus(GachaSpinSchema params);

}
