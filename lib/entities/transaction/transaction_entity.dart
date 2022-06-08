import 'dart:typed_data';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

part 'transaction_entity.g.dart';

@CopyWith()
class TransactionEntity {
  const TransactionEntity(
      {this.blockHash,
      required this.blockNumber,
      required this.from,
      required this.gas,
      required this.gasPrice,
      required this.hash,
      required this.input,
      required this.nonce,
      this.to,
      this.transactionIndex,
      required this.value,
      required this.v,
      required this.r,
      required this.s});

  factory TransactionEntity.fromTxnInformation(TransactionInformation i) =>
      TransactionEntity(
        blockNumber: i.blockNumber,
        from: i.from,
        gas: i.gas,
        gasPrice: i.gasPrice,
        hash: i.hash,
        input: i.input,
        nonce: i.nonce,
        value: i.value,
        v: i.v,
        r: i.r,
        s: i.s,
        to: i.to,
        blockHash: i.blockHash,
        transactionIndex: i.transactionIndex,
      );

  /// The hash of the block containing this transaction. If this transaction has
  /// not been mined yet and is thus in no block, it will be `null`
  final String? blockHash;

  /// [BlockNum] of the block containing this transaction, or [BlockNum.pending]
  /// when the transaction is not part of any block yet.
  final BlockNum blockNumber;

  /// The sender of this transaction.
  final EthereumAddress from;

  /// How many units of gas have been used in this transaction.
  final int gas;

  /// The amount of Ether that was used to pay for one unit of gas.
  final EtherAmount gasPrice;

  /// A hash of this transaction, in hexadecimal representation.
  final String hash;

  /// The data sent with this transaction.
  final Uint8List input;

  /// The nonce of this transaction. A nonce is incremented per sender and
  /// transaction to make sure the same transaction can't be sent more than
  /// once.
  final int nonce;

  /// Address of the receiver. `null` when its a contract creation transaction
  final EthereumAddress? to;

  /// Integer of the transaction's index position in the block. `null` when it's
  /// pending.
  final int? transactionIndex;

  /// The amount of Ether sent with this transaction.
  final EtherAmount value;

  /// A cryptographic recovery id which can be used to verify the authenticity
  /// of this transaction together with the signature [r] and [s]
  final int v;

  /// ECDSA signature r
  final BigInt r;

  /// ECDSA signature s
  final BigInt s;

  /// The ECDSA full signature used to sign this transaction.
  MsgSignature get signature => MsgSignature(r, s, v);
}
