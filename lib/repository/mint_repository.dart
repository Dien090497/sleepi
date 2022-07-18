import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/schema/minting/minting_schema.dart';

abstract class MintRepository{

  Future<Either<FailureMessage, dynamic>> getMint(int bedIdParent1, int bedIdParent2, double isInsurance);

  Future<Either<FailureMessage, dynamic>> mint(MintingSchema schema);
}