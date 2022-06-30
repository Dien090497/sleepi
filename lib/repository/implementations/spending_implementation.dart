import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/remote/network/web3_datasource.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/spending_repository.dart';

@Injectable(as: ISpendingRepository)
class SpendingImplementation extends ISpendingRepository {
  final Web3DataSource _web3dataSource;

  SpendingImplementation(this._web3dataSource);

  @override
  Future<Either<Failure, String>> depositToken() async {
   try {

   } catch(e) {
     return Left(FailureMessage('$e'));
   }
  }
}
