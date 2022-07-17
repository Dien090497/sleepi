import 'package:dartz/dartz.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/entities/nft_entity/nft_entity.dart';
import 'package:slee_fi/entities/nft_sell_response_entity/nft_sell_response_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/schema/nft_sell_schema/nft_sell_schema.dart';
import 'package:slee_fi/schema/repair_schema/repair_schema.dart';
import 'package:slee_fi/schema/with_draw_nft_schema/with_draw_nft_schema.dart';
import 'package:web3dart/web3dart.dart';

abstract class INFTRepository {
  Future<Either<Failure, BigInt>> balanceOf(
      String address, String ownerAddress);

  Future<Either<Failure, List<BigInt>>> tokensOf(
      {required String nftAddress,
      required String ownerAddress,
      required int count,
      required int start});

  Future<Either<Failure, List<NFTEntity>>> getListNftData({
    String? nftAddress,
    required List<BigInt> tokenIds,
    required NftType nftType,
  });

  Future<Either<Failure, bool>> isApprovedForAll({
    required String nftAddress,
    required String ownerAddress,
    required String operatorAddress,
    required Credentials credentials,
  });

  Future<Either<Failure, String>> setApprovalForAll({
    required String nftAddress,
    required String operatorAddress,
    required Credentials credentials,
  });

  Future<Either<Failure, String>> transferNft({
    required String nftAddress,
    required String ownerAddress,
    required String toAddress,
    required BigInt nftId,
    required Credentials credentials,
  });

  Future<Either<Failure, String>> depositSpending({
    required String spendingAddress,
    required String nftAddress,
    required BigInt nftId,
    required int userId,
    required Credentials credentials,
  });

  Future<Either<Failure, double>> estimateGasFee({
    required String nftAddress,
    required String ownerAddress,
    required String toAddress,
    required BigInt nftId,
    EtherAmount? gasPrice,
    required String functionName,
  });

  Future<TransactionReceipt?> listenTxHash(String txHash);

  Future<Either<Failure, BedEntity>> nftDetail(int nftId);

  Future<Either<Failure, dynamic>> withDrawNFTtoMainWallet({required WithDrawNFTSchema params});

  Future<Either<Failure, NftSellResponseEntity>> sellNFT({required NFTSellSchema params});

  Future<Either<Failure, String>> getTransactionFee();

  Future<Either<Failure, dynamic>> getRepair({required num bedId});

  Future<Either<Failure, dynamic>> nftRepair({required RepairSchema repairSchema});
}
