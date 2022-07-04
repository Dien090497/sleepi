import 'package:erc20/erc20.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/abi/spending.g.dart';
import 'package:slee_fi/common/contract_addresses/contract_addresses.dart';
import 'package:slee_fi/datasources/remote/network/web3_provider.dart';
import 'package:web3dart/web3dart.dart';

@Injectable()
class SpendingDataSource {
  final Web3Provider _web3provider;

  SpendingDataSource(this._web3provider);

  Spending get _spendingContract {
    return Spending(
        address: ContractAddresses.spending, client: _web3provider.web3client);
  }

  Future<String> toSpending({
    required Credentials owner,
    required BigInt amount,
    required ERC20 token,
  }) async {
    return _spendingContract.depositToken(
        token.self.address, amount,
        credentials: owner);
  }

  Future<String> toSpendingAvax({
    required Credentials owner,
    required BigInt amount,
    required EthereumAddress avax,
    Transaction? transaction,
  }) async {
    return _spendingContract.depositToken(
        avax, amount,
        credentials: owner,
      transaction: transaction
    );
  }

  Future<String> approve(Credentials owner, BigInt value, ERC20 token) =>
      token.approve(ContractAddresses.spending, value,
          credentials: owner);

  Future<BigInt> allowance(EthereumAddress owner, ERC20 token) =>
      token.allowance(owner, _spendingContract.self.address);

// ERC20 get _slft =>
//     ERC20(address: ContractAddresses.slft, client: _web3provider.web3client);
}
