import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_datasource.dart';
import 'package:slee_fi/entities/active_code/active_code_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/bed_model/beb_model.dart';
import 'package:slee_fi/models/global_config_response/global_config_response.dart';
import 'package:slee_fi/models/swap_token_to_wallet_response/swap_token_to_wallet_response.dart';
import 'package:slee_fi/models/token_spending/token_spending.dart';
import 'package:slee_fi/models/withdraw_history_response/withdraw_history_response.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/schema/change_password_schema/change_password_schema.dart';
import 'package:slee_fi/schema/white_draw_token_schema/whit_draw_token_schema.dart';
import 'package:slee_fi/usecase/add_item_to_bed_usecase.dart';
import 'package:slee_fi/usecase/estimate_gas_withdraw.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';
import 'package:slee_fi/usecase/withdraw_history_usecase.dart';

@Injectable(as: IUserRepository)
class UserImplementation extends IUserRepository {
  final AuthDataSource _authDataSource;
  final SecureStorage _secureStorage;

  UserImplementation(this._authDataSource, this._secureStorage);

  @override
  Future<Either<FailureMessage, dynamic>> changePassword(
      ChangePasswordSchema changePasswordSchema) async {
    try {
      final result = await _authDataSource.changePassword(changePasswordSchema);
      return Right(result);
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, List<ActiveCodeEntity>>>
      fetchActivationCodes() async {
    try {
      final result = await _authDataSource.fetchActivationCodes();
      return Right(result.data.map((e) => e.toEntity()).toList());
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, List<TokenSpending>>> fetchBalanceSpending(
      String userID) async {
    try {
      final result = await _authDataSource.fetchBalanceSpending(userID);
      return Right(result);
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, SwapTokenToWalletResponse>>
      transferTokenToMainWallet(WhitDrawTokenSchema whitDrawTokenSchema) async {
    try {
      final result =
          await _authDataSource.transferTokenToWallet(whitDrawTokenSchema);
      return Right(result);
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, GlobalConfigResponse>> getGlobalConfig() async {
    try {
      final result = await _authDataSource.getGlobalConfig();
      await _secureStorage.saveAddressContract(
          addressContract: result.contract);
      await _secureStorage.saveMessage(saveMessage: result.messageSign);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  // @override
  // Future<Either<FailureMessage, dynamic>> fetchHistoryList(
  //     LoadMoreParams loadMoreParams) async {
  //   try {
  //     final result = await _authDataSource.fetchSpendingHistory(
  //         loadMoreParams.userId, loadMoreParams.limit, loadMoreParams.page);
  //     return Right(result);
  //   } on Exception catch (e) {
  //     return Left(FailureMessage.fromException(e));
  //   }
  // }
  //
  // @override
  // Future<Either<FailureMessage, dynamic>> fetchPendingList(
  //     LoadMoreParams loadMoreParams) async {
  //   try {
  //     final result = await _authDataSource.fetchSpendingHistory(
  //         loadMoreParams.userId, loadMoreParams.limit, loadMoreParams.page);
  //     return Right(result);
  //   } on Exception catch (e) {
  //     return Left(FailureMessage.fromException(e));
  //   }
  // }

  @override
  Future<Either<FailureMessage, WithdrawHistoryResponse>> withdrawHistory(
      WithdrawParam withdrawParam) async {
    try {
      var result = await _authDataSource.withdraw(
          withdrawParam.attributeWithdraw,
          withdrawParam.limit,
          withdrawParam.page);
      return Right(result);
    } on Exception catch (e) {
      // 'on load withdraw error $e'.log;
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, String>> estimateGasWithdraw(
      EstimateGasWithdrawParam estimateParam) async {
    try {
      var result = await _authDataSource.estimateGasWithdraw(
          estimateParam.type, estimateParam.contractAddress);
      return Right(result);
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, List<BedModel>>> fetchListBed(
      FetchBedParam fetchBedParam) async {
    try {
      'fetch nft ${fetchBedParam.categoryId.type}'.log;
      var result = await _authDataSource.getNftByOwner(
          fetchBedParam.limit,
          fetchBedParam.page,
          fetchBedParam.categoryId.type,
          fetchBedParam.attributeNFT);

      's ${result.toJson()}    '.log;
      return Right(result.list);
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, dynamic>> addItemToBed(
      AddItemToBedParam addItemToBedParam) async {
    try {
      var result = await _authDataSource.addItemForBed(
          addItemToBedParam.bedId, addItemToBedParam.itemId);

      return Right(result);
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, dynamic>> removeItemInBed(
      AddItemToBedParam addItemToBedParam) async {
    try {
      var result = await _authDataSource.removeItemFromBed(
          addItemToBedParam.bedId, addItemToBedParam.itemId);

      return Right(result);
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }
}
