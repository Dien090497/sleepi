import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/minting/info_minting_model.dart';
import 'package:slee_fi/schema/minting/minting_schema.dart';

abstract class MintRepository{

  Future<Either<FailureMessage, InfoMintingModel>> getMint(int bedIdParent1, int bedIdParent2);

  Future<Either<FailureMessage, dynamic>> mint(MintingSchema schema);
}