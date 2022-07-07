import 'dart:math';

import 'package:dio/dio.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/datasources/remote/nft_api/nft_api.dart';
import 'package:test/test.dart';

void main() {
  test('Get avax balance', () async {
    final balance =
        BigInt.parse('1000091023910239021301293012039123123123123123');
    final result = balance / BigInt.from(pow(10, 18));
    print('### $result');
    print('### ${result.runtimeType}');
  });

  test('NFT api', () async {
    final NftApi nftApi = NftApi(Dio(BaseOptions(baseUrl: Const.baseApiDev)));
    final res =
        await nftApi.getListNft(tokenIds: '11,12,13', nftType: NftType.beds);
  });

  // test('History Avax', () async {
  //   final TransactionRemoteDataSource historyDataSource = TransactionRemoteDataSource(Dio());
  //
  //   final res =
  //   await historyDataSource.getHistoryAvax();
  // });
}
