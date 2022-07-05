import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';

@Injectable()
class ContractAddresses {
  static EthereumAddress get spending {
    // testnet
    return EthereumAddress.fromHex(
        '0x5c11e3517657B2b2731fd19d2F738f61b62a82CF');
  }

  static EthereumAddress get slft {
    // testnet
    return EthereumAddress.fromHex(
        '0x2bB8Bc1C29F34f3795661452Bf806cB5D65DF8DC');
  }
  static EthereumAddress get slgt {
    // testnet
    return EthereumAddress.fromHex(
        '0x41Dd35f9e440ADecB9A04fA839D0be2b19722Ade');
  }
}
