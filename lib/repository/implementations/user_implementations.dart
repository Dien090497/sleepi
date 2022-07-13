import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/local/get_storage_datasource.dart';
import 'package:slee_fi/datasources/local/isar/isar_datasource.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_datasource.dart';
import 'package:slee_fi/datasources/remote/network/web3_datasource.dart';
import 'package:slee_fi/entities/active_code/active_code_entity.dart';
import 'package:slee_fi/entities/item_entity/item_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/bed_model/beb_model.dart';
import 'package:slee_fi/models/global_config_response/global_config_response.dart';
import 'package:slee_fi/models/swap_token_to_wallet_response/swap_token_to_wallet_response.dart';
import 'package:slee_fi/models/token_spending/token_spending.dart';
import 'package:slee_fi/models/withdraw_history_response/withdraw_history_response.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/schema/change_password_schema/change_password_schema.dart';
import 'package:slee_fi/schema/param_filler_item_fetch/filter_item_chema.dart';
import 'package:slee_fi/schema/white_draw_token_schema/whit_draw_token_schema.dart';
import 'package:slee_fi/usecase/add_item_to_bed_usecase.dart';
import 'package:slee_fi/usecase/estimate_gas_withdraw.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';
import 'package:slee_fi/usecase/withdraw_history_usecase.dart';

@Injectable(as: IUserRepository)
class UserImplementation extends IUserRepository {
  final AuthDataSource _authDataSource;
  final SecureStorage _secureStorage;
  final GetStorageDataSource _getStorageDataSource;
  final IsarDataSource _isarDataSource;
  final Web3DataSource _web3DataSource;

  UserImplementation(this._authDataSource, this._secureStorage,
      this._getStorageDataSource, this._isarDataSource, this._web3DataSource);

  @override
  Future<Either<FailureMessage, dynamic>> changePassword(
      ChangePasswordSchema changePasswordSchema) async {
    try {
      final result = await _authDataSource.changePassword(changePasswordSchema);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, List<ActiveCodeEntity>>>
      fetchActivationCodes() async {
    try {
      final result = await _authDataSource.fetchActivationCodes();
      return Right(result.data.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, List<TokenSpending>>> fetchBalanceSpending(
      String userID) async {
    try {
      final result = await _authDataSource.fetchBalanceSpending(userID);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, SwapTokenToWalletResponse>>
      transferTokenToMainWallet(WhitDrawTokenSchema whitDrawTokenSchema) async {
    try {
      final walletId = _getStorageDataSource.getCurrentWalletId();
      final wallet = await _isarDataSource.getWalletAt(walletId);
      final credentials =
          _web3DataSource.credentialsFromPrivateKey(wallet!.privateKey);
      final message = await _secureStorage.readMessage();
      final ethereumAddress = await credentials.extractAddress();
      final signature = _web3DataSource.generateSignature(
          privateKey: wallet.privateKey, message: message ?? '');
      WhitDrawTokenSchema schema = WhitDrawTokenSchema(
        amount: whitDrawTokenSchema.amount,
        tokenAddress: whitDrawTokenSchema.tokenAddress,
        type: whitDrawTokenSchema.type,
        signedMessage: signature,
        signer: ethereumAddress.hexEip55,
      );
      final result = await _authDataSource.transferTokenToWallet(schema);
      return Right(result);
    } catch (e) {
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

  @override
  Future<Either<FailureMessage, WithdrawHistoryResponse>> withdrawHistory(
      WithdrawParam withdrawParam) async {
    try {
      final result = await _authDataSource.withdraw(
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
      final result = await _authDataSource.estimateGasWithdraw(
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
      final result = await _authDataSource.getNftByOwner(
          fetchBedParam.limit,
          fetchBedParam.page,
          fetchBedParam.categoryId.type,
          fetchBedParam.attributeNFT);
      return Right(result.list);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, dynamic>> addItemToBed(
      AddItemToBedParam addItemToBedParam) async {
    try {
      final result = await _authDataSource.addItemForBed(
          addItemToBedParam.bedId, addItemToBedParam.itemId);

      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, dynamic>> removeItemInBed(
      AddItemToBedParam addItemToBedParam) async {
    try {
      final result = await _authDataSource.removeItemFromBed(
          addItemToBedParam.bedId, addItemToBedParam.itemId);

      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, List<ItemEntity>>> fetchItemOwner(
      FilterItemSchema filterItemSchema) async {
    // try {
    final result = await _authDataSource.fetchItemOwner(filterItemSchema);
    return Right(result.list.map((e) => e.toEntity()).toList());
    // } catch (e) {
    //   return Left(FailureMessage.fromException(e));
    // }
  }
}
