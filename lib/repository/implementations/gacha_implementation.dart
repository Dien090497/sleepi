import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_datasource.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/gacha_spin_response/gacha_spin_response.dart';
import 'package:slee_fi/repository/gacha_repository.dart';
import 'package:slee_fi/schema/gacha/gacha_spin_schema.dart';

@Injectable(as: IGachaRepository)
class GachaImplementation extends IGachaRepository{
  final AuthDataSource _authDataSource;

  GachaImplementation(this._authDataSource);

  @override
  Future<Either<Failure, GachaSpinResponse>> spinBonus(GachaSpinSchema params) async{
    try {
      final result = await _authDataSource.gachaSpinBonus(params);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }
}
