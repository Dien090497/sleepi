import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/abi/nft.g.dart';
import 'package:slee_fi/datasources/remote/network/web3_provider.dart';
import 'package:web3dart/web3dart.dart';

@Injectable()
class NFTDataSource {
  final Web3Provider _web3provider;

  NFTDataSource(this._web3provider);

  Future<BigInt> balanceOf(String address, String ownerAddress) {
    return _nft(address).balanceOf(EthereumAddress.fromHex(ownerAddress));
  }

  Future<List<BigInt>> tokensOf(
      String address, String owner, int count, int start) {
    return _nft(address).getTokensOfOwner(
        EthereumAddress.fromHex(owner), BigInt.from(count), BigInt.from(start));
  }

  Future<String> name(String address) => _nft(address).name();

  Future<String> symbol(String address) => _nft(address).symbol();

  // Future<String> transferFrom(String address) =>
  //     _nft(address).transferFrom(from, to, tokenId, credentials: credentials);

  Nft _nft(String address) => Nft(
      address: EthereumAddress.fromHex(address),
      client: _web3provider.web3client);
}
