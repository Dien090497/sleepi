import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_datasource.dart';
import 'package:slee_fi/datasources/remote/network/nft_datasource.dart';
import 'package:slee_fi/datasources/remote/nft_api/nft_api.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/entities/nft_entity/nft_entity.dart';
import 'package:slee_fi/entities/nft_sell_response_entity/nft_sell_response_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/schema/nft_sell_schema/nft_sell_schema.dart';
import 'package:slee_fi/schema/with_draw_nft_schema/with_draw_nft_schema.dart';
import 'package:web3dart/web3dart.dart';

@Injectable(as: INFTRepository)
class NFTImplementation extends INFTRepository {
  final NFTDataSource _nftDataSource;
  final NftApi _nftApi;
  final SecureStorage _secureStorage;
  final AuthDataSource _authDataSource;

  NFTImplementation(this._nftDataSource, this._nftApi, this._secureStorage, this._authDataSource);

  @override
  Future<Either<Failure, BigInt>> balanceOf(
      String address, String ownerAddress) async {
    try {
      return Right(await _nftDataSource.balanceOf(address, ownerAddress));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, List<BigInt>>> tokensOf({
    required String nftAddress,
    required String ownerAddress,
    required int count,
    required int start,
  }) async {
    try {
      final balance = await _nftDataSource.balanceOf(nftAddress, ownerAddress);
      final countBI = BigInt.from(count);
      final c = countBI <= balance ? countBI : balance;
      return Right(await _nftDataSource.tokensOf(
          nftAddress, ownerAddress, c, BigInt.from(start)));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, List<NFTEntity>>> getListNftData({
    String? nftAddress,
    required List<BigInt> tokenIds,
    required NftType nftType,
  }) async {
    try {
      if (tokenIds.isEmpty) return const Right([]);
      final listModel = await _nftApi.getListNft(
        nftType: nftType,
        tokenIds: tokenIds.join(','),
      );
      final res = await Future.wait([
        _nftDataSource.name(nftAddress!),
        _nftDataSource.symbol(nftAddress),
      ]);
      return Right(listModel.data
              ?.map((e) => e.toEntity(name: res.first, symbol: res.last))
              .toList() ??
          []);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, bool>> isApprovedForAll({
    required String nftAddress,
    required String ownerAddress,
    required String operatorAddress,
    required Credentials credentials,
  }) async {
    try {
      return Right(await _nftDataSource.isApprovedForAll(
          address: nftAddress,
          owner: ownerAddress,
          operator: operatorAddress,
          credentials: credentials));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, String>> setApprovalForAll({
    required String nftAddress,
    required String operatorAddress,
    required Credentials credentials,
  }) async {
    try {
      return Right(await _nftDataSource.setApprovalForAll(
          address: nftAddress,
          operator: operatorAddress,
          credentials: credentials));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, String>> transferNft(
      {required String nftAddress,
      required String ownerAddress,
      required String toAddress,
      required BigInt nftId,
      required Credentials credentials}) async {
    try {
      return Right(await _nftDataSource.transferFrom(
        nftAddress: nftAddress,
        from: ownerAddress,
        to: toAddress,
        tokenId: nftId,
        credentials: credentials,
      ));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, String>> depositSpending({
    String? spendingAddress,
    required String nftAddress,
    required BigInt nftId,
    required int userId,
    required Credentials credentials,
  }) async {
    try {
      return Right(await _nftDataSource.depositNft(
        userId: BigInt.from(userId),
        nftId: nftId,
        nftAddress: nftAddress,
        spendingAddress:
            spendingAddress ?? await _secureStorage.readAddressContract() ?? '',
        credentials: credentials,
      ));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, double>> estimateGasFee({
    required String nftAddress,
    required String ownerAddress,
    required String toAddress,
    required BigInt nftId,
    required String functionName,
    EtherAmount? gasPrice,
  }) async {
    try {
      final price = gasPrice ?? await _nftDataSource.getGasPrice();
      return Right(await _nftDataSource.estimateGasFee(
          nftAddress: nftAddress,
          ownerAddress: EthereumAddress.fromHex(ownerAddress),
          toAddress: EthereumAddress.fromHex(toAddress.isNotEmpty
              ? toAddress
              : '0x52839a88e9fdd2b137e32c65fec8e7b3f1f1ccc6'),
          nftId: nftId,
          gasPrice: price,
          functionName: functionName));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<TransactionReceipt?> listenTxHash(String txHash) async {
    return _nftDataSource.streamTxHash(txHash: txHash);
  }

  @override
  Future<Either<Failure, BedEntity>> nftDetail(int nftId) async {
    try {
      return Right((await _nftApi.detailOf(nftId)).toEntity());
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> withDrawNFTtoMainWallet({required WithDrawNFTSchema params}) async {
    try {
      final signature = await _secureStorage.readSignatureMessage();
      final signer = await _secureStorage.readSigner();
      final schema = WithDrawNFTSchema(
        contractAddress: params.contractAddress,
        type: params.type,
        tokenId: params.tokenId,
        signedMessage: signature,
        signer: signer,
      );
      final result = await _authDataSource.withdrawNFT(schema);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, NftSellResponseEntity>> sellNFT({required NFTSellSchema params}) async {
    try {
      print('schema123 ${params.nftId} - ${params.amount}');
      final result = await _authDataSource.nftSell(params);
      print('success123');
      return Right(result.toEntity());
    } catch (e) {
      print('nope ${e}');
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, String>> getTransactionFee() async {
    try {
      final result = await _authDataSource.getTransactionFee();
      return Right(result);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }
}
