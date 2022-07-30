import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/datasources/local/get_storage_datasource.dart';
import 'package:slee_fi/datasources/local/isar/isar_datasource.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_datasource.dart';
import 'package:slee_fi/datasources/remote/network/web3_datasource.dart';
import 'package:slee_fi/entities/active_code/active_code_entity.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/entities/jewel_entity/jewel_entity.dart';
import 'package:slee_fi/entities/tracking_result_chart_data_entity/tracking_result_chart_data_entity.dart';
import 'package:slee_fi/entities/tracking_result_chart_days_entity/tracking_result_chart_days_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/estimate_sleep_response/estimate_sleep_response.dart';
import 'package:slee_fi/models/global_config_response/global_config_response.dart';
import 'package:slee_fi/models/lucky_box/lucky_box.dart';
import 'package:slee_fi/models/lucky_box_response/lucky_box_response.dart';
import 'package:slee_fi/models/response_model/response_model.dart';
import 'package:slee_fi/models/swap_token_to_wallet_response/swap_token_to_wallet_response.dart';
import 'package:slee_fi/models/token_spending/token_spending.dart';
import 'package:slee_fi/models/upgrade_jewel_info_response/upgrade_info_response.dart';
import 'package:slee_fi/models/withdraw_history_response/withdraw_history_response.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/schema/add_jewel_schema/add_jewel_schema.dart';
import 'package:slee_fi/schema/change_password_schema/change_password_schema.dart';
import 'package:slee_fi/schema/param_filler_item_fetch/filter_item_schema.dart';
import 'package:slee_fi/schema/speed_up_lucky_box_schema/speed_up_lucky_box_schema.dart';
import 'package:slee_fi/schema/upgrade_jewel_schame/upgrade_jewel_schema.dart';
import 'package:slee_fi/schema/white_draw_token_schema/whit_draw_token_schema.dart';
import 'package:slee_fi/usecase/add_item_to_bed_usecase.dart';
import 'package:slee_fi/usecase/estimate_gas_withdraw.dart';
import 'package:slee_fi/usecase/estimate_tracking_usecase.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';
import 'package:slee_fi/usecase/fetch_data_chart_usecase.dart';
import 'package:slee_fi/usecase/fetch_home_bed_usecase.dart';
import 'package:slee_fi/usecase/upgrade_info_usecase.dart';
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

      for (var element in result.tokens) {
        await _secureStorage.setTokenAddress(element.symbol, element.address);
      }

      await Future.wait([
        _secureStorage.saveAddressContract(
            addressContract: result.contract.contractTreasury),
        _secureStorage.saveMessage(saveMessage: result.messageSign),
        _secureStorage.setNftAddress(result.nftAddress.toJson()),
      ]);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, WithdrawHistoryResponse>> withdrawHistory(
      WithdrawParam withdrawParam) async {
    try {
      final result = await _authDataSource.withdraw(
        withdrawParam.attributeWithdraw,
        withdrawParam.limit,
        withdrawParam.page,
        'token',
      );
      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, String>> estimateGasWithdraw(
      EstimateGasWithdrawParam estimateParam) async {
    try {
      final contractAddr = estimateParam.type.toLowerCase() != 'avax'
          ? estimateParam.contractAddress
          : Const.deadAddress;
      final result = await _authDataSource.estimateGasWithdraw(
          estimateParam.type, contractAddr);
      return Right(result);
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, List<BedEntity>>> fetchListBed(
      FetchBedParam fetchBedParam) async {
    try {
      final result = await _authDataSource.getNftByOwner(
        fetchBedParam.limit,
        fetchBedParam.page,
        fetchBedParam.categoryId.type,
        fetchBedParam.bedType,
      );
      return Right(result.list.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, ResponseModel>> addItemToBed(
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
  Future<Either<FailureMessage, ResponseModel>> removeItemInBed(
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
  Future<Either<FailureMessage, List<BedEntity>>> fetchItemOwner(
      FilterItemSchema filterItemSchema) async {
    try {
      final result = await _authDataSource.fetchItemOwner(filterItemSchema);
      return Right(result.list.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, List<LuckyBox>>> fetchLuckyBox() async {
    try {
      var result = await _authDataSource.fetchLuckyBox();
      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, OpenLuckyBoxResponse>> openLuckyBox(
      int luckyBoxId) async {
    try {
      var result = await _authDataSource.openLuckyBox(luckyBoxId);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, dynamic>> speedUpLuckyBox(
      SpeedUpLuckyBoxSchema speedUpLuckyBoxSchema) async {
    try {
      var result = await _authDataSource.speedUpLuckyBox(speedUpLuckyBoxSchema);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, EstimateSleepResponse>> estimateTracking(
      EstimateTrackingParam estimateTrackingParam) async {
    try {
      var result = await _authDataSource.estimateSleepEarn(
          estimateTrackingParam.bedId,
          estimateTrackingParam.itemId!,
          estimateTrackingParam.isEnableInsurance);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, TrackingResultChartDataEntity>> fetchDataChart(
      ParamsGetDataChart paramsGetDataChart) async {
    try {
      final result = await _authDataSource.fetchDataChart(
          paramsGetDataChart.fdate,
          paramsGetDataChart.tdate,
          paramsGetDataChart.type);
      return Right(result.toEntity());
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, BedEntity>> bedDetail(
      int bedId, bool isBase) async {
    try {
      final result = await _authDataSource.bedDetail(bedId, isBase);
      return Right(result.toEntity());
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, ResponseModel>> addJewel(
      AddJewelSchema addJewelSchema) async {
    try {
      final result = await _authDataSource.addJewel(addJewelSchema);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, ResponseModel>> openSocket(int bedId) async {
    try {
      final result = await _authDataSource.openSocket(bedId);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, ResponseModel>> removeJewel(
      AddJewelSchema addJewelSchema) async {
    try {
      final result = await _authDataSource.removeJewel(addJewelSchema);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, TrackingResultChartDaysEntity>>
      fetchDataDaysChart(ParamsGetDataChart params) async {
    try {
      final result = await _authDataSource.fetchDataDaysChart(
          params.fdate, params.tdate, params.type);
      return Right(result.toEntity());
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, List<BedEntity>>> fetchHomeBed(
      FetchHomeBedParam param) async {
    try {
      final result =
          await _authDataSource.fetchBedInHomePage(param.limit, param.page);

      final list = result.list.map((e) => e.toEntity()).toList();
      return Right(list);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, List<JewelEntity>>> fetchListJewel(
      FetchHomeBedParam param) async {
    try {
      final result =
          await _authDataSource.getListJewel(param.limit, param.page);
      var list = result.list.map((e) => e.toEntity()).toList();
      return Right(list);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, String>> getSlftPrice() async {
    try {
      final result = await _authDataSource.slftPrice();
      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, BedEntity>> upgradeJewel(
      UpgradeSchema param) async {
    try {
      final result = await _authDataSource.upgradeJewel(param);
      return Right(result.nftAttribute.toEntity());
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, UpgradeInfoResponse>> upgradeInfo(
      UpgradeInfoParam param) async {
    try {
      final result = await _authDataSource.upgradeInfo(
        param.level,
        param.categoryType.type,
      );
      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, List<BedEntity>>> fetchListUpgrade(
      FetchBedParam fetchBedParam) async {
    try {
      if (fetchBedParam.categoryId == CategoryType.jewel) {
        var result = await _authDataSource.getListJewels(
            fetchBedParam.limit, fetchBedParam.page);
        return Right(result.list.map((e) => e.toEntity()).toList());
      } else if (fetchBedParam.categoryId == CategoryType.item) {
        var result = await _authDataSource.fetchItemOwner(FilterItemSchema(
          page: fetchBedParam.page,
          limit: fetchBedParam.limit,
          maxLevel: 5,
          minLevel: 1,
          type: [],
        ));

        return Right(result.list.map((e) => e.toEntity()).toList());
      }
      return const Left(FailureMessage('please select only jewel or item'));
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, BedEntity>> openBedBox(int bedId) async {
    try {
      final result = await _authDataSource.openBedBox(bedId);
      return Right(result.toEntity());
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }
}
