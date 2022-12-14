import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:decimal/decimal.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/datasources/local/get_storage_datasource.dart';
import 'package:slee_fi/datasources/local/isar/isar_datasource.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_datasource.dart';
import 'package:slee_fi/datasources/remote/network/web3_datasource.dart';
import 'package:slee_fi/datasources/remote/network/web3_provider.dart';
import 'package:slee_fi/datasources/remote/transaction_datasource/transaction_remote_datasource.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/isar_models/native_currency_isar/native_currency_isar_model.dart';
import 'package:slee_fi/models/isar_models/network_isar/network_isar_model.dart';
import 'package:slee_fi/models/isar_models/transaction_isar/transaction_isar_model.dart';
import 'package:slee_fi/models/isar_models/wallet_isar/wallet_isar_model.dart';
import 'package:slee_fi/models/transaction_history/transaction_history_model.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/schema/verify_user_schema/verify_user_schema.dart';
import 'package:slee_fi/usecase/get_balance_for_tokens_usecase.dart';
import 'package:slee_fi/usecase/get_history_transaction_usecase.dart';
import 'package:web3dart/web3dart.dart';

@Injectable(as: IWalletRepository)
class WalletImplementation extends IWalletRepository {
  final Web3Provider _web3provider;
  final Web3DataSource _web3DataSource;
  final GetStorageDataSource _getStorageDataSource;
  final IsarDataSource _isarDataSource;
  final TransactionRemoteDataSource _transactionRemoteDataSource;
  final SecureStorage _secureStorage;
  final AuthDataSource _authDataSource;

  WalletImplementation(
      this._web3DataSource,
      this._getStorageDataSource,
      this._transactionRemoteDataSource,
      this._isarDataSource,
      this._web3provider,
      this._secureStorage,
      this._authDataSource);

  @override
  Future<Either<Failure, WalletInfoEntity>> createWallet() async {
    try {
      final String mnemonic = _web3DataSource.createMnemonic();
      final derivedIndex = _getStorageDataSource.getDerivedIndexAndIncrease();
      final network = await _getCurrentNetwork();
      final privateKey =
          _web3DataSource.mnemonicToPrivateKey(mnemonic, 0, network.slip44);
      final credentials = _web3DataSource.credentialsFromPrivateKey(privateKey);
      final ethereumAddress = await credentials.extractAddress();
      final message = await _secureStorage.readMessage();
      final signature = _web3DataSource.generateSignature(
          privateKey: privateKey, message: message ?? 'welcome to sleefi');
      VerifyUserSchema schema = VerifyUserSchema(
        signedMessage: signature,
        signer: ethereumAddress.hexEip55,
      );
      try {
        final resultResponse = await _authDataSource.verifyUser(schema);
        if (resultResponse.status) {
          /// Store Wallet
          await _secureStorage.saveSignatureMessage(
              signatureMessage: signature);
          await _secureStorage.saveSigner(signer: ethereumAddress.hexEip55);
          final model = WalletIsarModel(
            mnemonic: mnemonic,
            privateKey: privateKey,
            name: 'Account $derivedIndex',
            address: ethereumAddress.hex,
            derivedIndex: derivedIndex,
          );
          final int walletId = await _isarDataSource.putWallet(model);
          model.id = walletId;
          await _getStorageDataSource.setCurrentWalletId(walletId);
          final nativeCurrency = await _getNativeCurrency();
          final result = await _web3DataSource.getBalance(ethereumAddress.hex);
          final balance = result / BigInt.from(pow(10, 18));
          return Right(model.toEntity(
            credentials,
            derivedIndex: derivedIndex,
            networkName: network.name,
            nativeCurrency: nativeCurrency!.toEntity(balance: balance),
            chainId: network.chainId,
          ));
        } else {
          return const Left(FailureMessage(LocaleKeys.wallet_already));
        }
      } on Exception catch (e) {
        return Left(FailureMessage.fromException(e));
      }
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  Future<NativeCurrencyIsarModel?> _getNativeCurrency() async {
    final chainId = _getStorageDataSource.getCurrentChainId();
    if (chainId == null) return null;
    return _isarDataSource.getNativeCurrency(chainId);
  }

  Future<NetworkIsarModel> _getCurrentNetwork() async {
    final chainId = _getStorageDataSource.getCurrentChainId();
    return (await _isarDataSource.getNetworkAt(chainId!))!;
  }

  @override
  Future<Either<Failure, WalletInfoEntity>> importWallet(
      String mnemonic) async {
    try {
      if (_web3DataSource.validateMnemonic(mnemonic)) {
        final network = await _getCurrentNetwork();
        final privateKey =
            _web3DataSource.mnemonicToPrivateKey(mnemonic, 0, network.slip44);
        final credentials =
            _web3DataSource.credentialsFromPrivateKey(privateKey);
        final ethereumAddress = await credentials.extractAddress();
        final message = await _secureStorage.readMessage();
        final signature = _web3DataSource.generateSignature(
            privateKey: privateKey, message: message ?? 'welcome to sleefi');
        VerifyUserSchema schema = VerifyUserSchema(
          signedMessage: signature,
          signer: ethereumAddress.hexEip55,
        );
        await _authDataSource.verifyUser(schema);
        final derivedIndex = _getStorageDataSource.getDerivedIndexAndIncrease();

        /// Store Wallet
        final model = WalletIsarModel(
          privateKey: privateKey,
          name: 'Account $derivedIndex',
          address: ethereumAddress.hex,
          derivedIndex: derivedIndex,
          mnemonic: mnemonic,
        );
        final int walletId = await _isarDataSource.putWallet(model);
        model.id = walletId;
        await _getStorageDataSource.setCurrentWalletId(walletId);
        final nativeCurrency = await _getNativeCurrency();
        final result = await _web3DataSource.getBalance(ethereumAddress.hex);
        final balance = result / BigInt.from(pow(10, 18));
        if (nativeCurrency == null) {
          return const Left(FailureMessage(LocaleKeys.some_thing_wrong));
        }

        return Right(model.toEntity(
          credentials,
          derivedIndex: derivedIndex,
          networkName: network.name,
          nativeCurrency: nativeCurrency.toEntity(balance: balance),
          chainId: network.chainId,
        ));
      }
      return const Left(
          FailureMessage(LocaleKeys.invalid_mnemonic_please_try_again));
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }

    // } catch (e) {
    //   return Left(FailureMessage.fromException(e));
    // }
  }

  @override
  Future<Either<Failure, WalletInfoEntity>> currentWallet() async {
    try {
      // final testNetwork = (await _isarDataSource.getAllNetwork()).first;
      // _web3provider.setCurrentNetwork(testNetwork);
      // _getStorageDataSource.setCurrentChainId(testNetwork.chainId);
      // final testNetwork = (await _isarDataSource.getAllNetwork()).last;
      // _web3DataSource.setCurrentNetwork(testNetwork);
      // _getStorageDataSource.setCurrentChainId(testNetwork.chainId);
      final walletId = _getStorageDataSource.getCurrentWalletId();
      final wallet = await _isarDataSource.getWalletAt(walletId);

      if (wallet == null) {
        return const Left(FailureMessage('Invalid Wallet'));
      }

      final network = await _getCurrentNetwork();
      final privateKey = _web3DataSource.mnemonicToPrivateKey(
          wallet.mnemonic, wallet.derivedIndex!, network.slip44);
      final credentials = _web3DataSource.credentialsFromPrivateKey(privateKey);
      final result = await _web3DataSource.getBalance(wallet.address);
      final balance = result / BigInt.from(pow(10, 18));
      final nativeCurrency = await _getNativeCurrency();
      return Right(
        wallet.toEntity(credentials,
            networkName: network.name,
            nativeCurrency: nativeCurrency!.toEntity(balance: balance),
            chainId: network.chainId),
      );
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<double>>> getBalanceOfTokens(
      ParamsBalanceOfToken params) async {
    try {
      final List<double> values = [];
      for (int i = 0; i < params.addressContract.length; i++) {
        if (params.addressContract[i].isEmpty) {
          values.add(0);
          break;
        }
        if (params.addressContract[i] == Const.deadAddress) {
          final balance =
              await _web3DataSource.getBalance(params.walletInfoEntity.address);
          values.add(balance.toEther());
        } else {
          final erc20 = _web3DataSource.token(params.addressContract[i]);
          final value = await erc20.balanceOf(
              EthereumAddress.fromHex(params.walletInfoEntity.address));
          final decimals = await erc20.decimals();
          values.add(value.toEther(decimals: decimals));
        }
      }
      return Right(values);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<Failure, String>> approveToken(String contractAddress) async {
    try {
      final walletId = _getStorageDataSource.getCurrentWalletId();
      final wallet = await _isarDataSource.getWalletAt(walletId);
      Credentials credentials = EthPrivateKey.fromHex(wallet!.privateKey);
      String txh = await _web3DataSource.approveToken(
          wallet.address, contractAddress, credentials);
      if (txh == LocaleKeys.not_enough_to_pay_the_fee) {
        return Left(
            FailureMessage.fromException(LocaleKeys.not_enough_to_pay_the_fee));
      }
      return Right(txh);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  Future<Either<Failure, String>> swapAvaxToken(
      double value, String contractAddress) async {
    try {
      final walletId = _getStorageDataSource.getCurrentWalletId();
      final wallet = await _isarDataSource.getWalletAt(walletId);
      String success = await _web3DataSource.swapExactAVAXForTokens(
          wallet!.privateKey, wallet.address, contractAddress, value);
      return Right(success);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  Future<Either<Failure, String>> swapTokenAvax(
      double value, String contractAddress) async {
    try {
      final walletId = _getStorageDataSource.getCurrentWalletId();
      final wallet = await _isarDataSource.getWalletAt(walletId);
      String success = await _web3DataSource.swapExactTokensForAvax(
          wallet!.privateKey, wallet.address, contractAddress, value);
      return Right(success);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> checkAllowance(
      double value, String contractAddress) async {
    try {
      final walletId = _getStorageDataSource.getCurrentWalletId();
      final wallet = await _isarDataSource.getWalletAt(walletId);
      BigInt allowanceNumber = await _web3DataSource.allowance(
          EthereumAddress.fromHex(wallet!.address), contractAddress);
      return Right(value > allowanceNumber.toDouble());
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  Future<Either<Failure, String>> swapTokenForToken(double value,
      String contractAddressFrom, String contractAddressTo) async {
    try {
      final walletId = _getStorageDataSource.getCurrentWalletId();
      final wallet = await _isarDataSource.getWalletAt(walletId);
      String success = await _web3DataSource.swapExactTokensForTokens(
          wallet!.privateKey,
          wallet.address,
          contractAddressFrom,
          contractAddressTo,
          value);
      return Right(success);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<Failure, double>> getBalanceToken(
      String contractAddress) async {
    try {
      BigInt balance = BigInt.from(0);
      final walletId = _getStorageDataSource.getCurrentWalletId();
      final wallet = await _isarDataSource.getWalletAt(walletId);
      if (contractAddress == Const.deadAddress) {
        balance = await _web3DataSource.getBalance(wallet!.address);
        return Right(balance / BigInt.from(pow(10, 18)));
      } else {
        balance = await _web3DataSource.getBalanceOf(
            wallet!.address, contractAddress);
        final decimals = await _web3DataSource.getDecimals(contractAddress);
        return Right(balance / BigInt.from(pow(10, decimals.toInt())));
      }
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<Failure, String>> swapToken(
      double value, String contractAddressFrom, String contractAddressTo) {
    if (contractAddressFrom == Const.deadAddress) {
      return swapAvaxToken(value, contractAddressTo);
    } else {
      if (contractAddressTo == Const.deadAddress) {
        return swapTokenAvax(value, contractAddressFrom);
      } else {
        return swapTokenForToken(value, contractAddressFrom, contractAddressTo);
      }
    }
  }

  @override
  Future<Either<Failure, bool>> checkFirstOpenWallet() async {
    return const Right(true);
  }

  @override
  Future<Either<FailureMessage, String>> getCurrentMnemonic() async {
    final walletId = _getStorageDataSource.getCurrentWalletId();
    final wallet = await _isarDataSource.getWalletAt(walletId);

    if (wallet == null) {
      return const Left(FailureMessage('Invalid Wallet'));
    }

    return Right(wallet.mnemonic);
  }

  @override
  Future<Either<Failure, double>> getAmountOutMin(double value,
      String contractAddressFrom, String contractAddressTo) async {
    final walletId = _getStorageDataSource.getCurrentWalletId();
    final wallet = await _isarDataSource.getWalletAt(walletId);
    double amount = await _web3DataSource.getAmountOutMin(
        wallet!.address, contractAddressFrom, contractAddressTo, value);
    return Right(amount);
  }

  @override
  Future<Either<FailureMessage, NetworkIsarModel>> getCurrentNetWork(
      NetWorkEnum? params) async {
    try {
      if (params == null) {
        final network = await _getCurrentNetwork();
        return Right(network);
      } else {
        if (params == NetWorkEnum.mainNet) {
          final network = (await _isarDataSource.getAllNetwork())[1];
          _web3provider.setCurrentNetwork(network);
          _getStorageDataSource.setCurrentChainId(network.chainId);
          final networkCurrent = await _getCurrentNetwork();
          return Right(networkCurrent);
        } else {
          final testnet = (await _isarDataSource.getAllNetwork()).first;
          _web3provider.setCurrentNetwork(testnet);
          _getStorageDataSource.setCurrentChainId(testnet.chainId);
          final networkCurrent = await _getCurrentNetwork();
          return Right(networkCurrent);
        }
      }
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, NetworkIsarModel>> switchNetWork() async {
    try {
      final network = await _getCurrentNetwork();
      return Right(network);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, bool>> validateMnemonic(String mnemonic) async {
    try {
      if (_web3DataSource.validateMnemonic(mnemonic)) {
        final network = await _getCurrentNetwork();
        final privateKey =
            _web3DataSource.mnemonicToPrivateKey(mnemonic, 0, network.slip44);
        final credentials =
            _web3DataSource.credentialsFromPrivateKey(privateKey);
        final message = await _secureStorage.readMessage();
        final ethereumAddress = await credentials.extractAddress();
        final signature = _web3DataSource.generateSignature(
            privateKey: privateKey, message: message ?? 'welcome to sleefi');
        final VerifyUserSchema schema = VerifyUserSchema(
          signedMessage: signature,
          signer: ethereumAddress.hexEip55,
        );
        try {
          final result = await _authDataSource.verifyUser(schema);
          if (result.status) {
            await _secureStorage.saveSignatureMessage(
                signatureMessage: signature);
            await _secureStorage.saveSigner(signer: ethereumAddress.hexEip55);
            return Right(result.status);
          } else {
            return const Left(FailureMessage(LocaleKeys.wallet_already));
          }
        } on Exception catch (e) {
          return Left(FailureMessage.fromException(e));
        }
      } else {
        return const Left(
            FailureMessage(LocaleKeys.invalid_mnemonic_please_try_again));
      }
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<TransactionIsarModel>>> getHistoryTransaction(
      HistoryTransactionParams params) async {
    try {
      List<TransactionHistoryModel> transactionHistoryList = [];
      final result =
          await _transactionRemoteDataSource.getHistoryTransaction(params);
      int decimal = 18;
      result.fold(
        (l) {},
        (history) {
          if (params.tokenSymbol == "AVAX") {
            transactionHistoryList = history;
          } else if (params.tokenSymbol != null) {
            transactionHistoryList = history
                .where((i) => i.tokenSymbol == params.tokenSymbol)
                .toList();
          } else {
            transactionHistoryList = history;
          }
        },
      );
      if (transactionHistoryList.isNotEmpty) {
        if (transactionHistoryList.first.tokenName != null) {
          final erc20 = _web3DataSource
              .token(transactionHistoryList.first.contractAddress);
          final decimalToken = await erc20.decimals();
          decimal = decimalToken.toInt();
        }
      }
      List<TransactionIsarModel> transactionList = [];
      for (int i = 0; i < transactionHistoryList.length; i++) {
        // final transactionInfo = await _web3DataSource.getDetailTransaction(historyList.elementAt(i).transactionHash);
        // final transactionReceipt = await _web3DataSource.getTransactionReceipt(historyList.elementAt(i).transactionHash);
        // final getTimeStamp = await _web3DataSource.getDetailBlock(transactionInfo.blockNumber.toBlockParam());

        final model = TransactionIsarModel(
            transactionHash: transactionHistoryList.elementAt(i).hash,
            valueInEther:
                (Decimal.parse(transactionHistoryList.elementAt(i).value) /
                        Decimal.fromBigInt(BigInt.from(pow(10, decimal))))
                    .toDouble(),
            timeStamp: DateTime.fromMillisecondsSinceEpoch(
                int.parse(transactionHistoryList.elementAt(i).timeStamp) *
                    1000),
            gasPrice:
                BigInt.parse(transactionHistoryList.elementAt(i).gasPrice) /
                    BigInt.from(pow(10, 18)),
            addressFrom: transactionHistoryList.elementAt(i).from,
            addressTo: transactionHistoryList.elementAt(i).to,
            status: transactionHistoryList.elementAt(i).txReceiptStatus != null
                ? int.parse(
                    transactionHistoryList.elementAt(i).txReceiptStatus!)
                : 1);
        transactionList.add(model);
      }
      return Right(transactionList);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> hasWallet() async {
    try {
      return Right((await _isarDataSource.countWallet()) > 0);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Either<Failure, String> createNewMnemonic() {
    try {
      return Right(_web3DataSource.createMnemonic());
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }
}
