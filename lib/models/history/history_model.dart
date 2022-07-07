import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/models/transaction_history/transaction_history_model.dart';

part 'history_model.g.dart';

@JsonSerializable()
class HistoryModel {
  String status;
  String message;
  List<TransactionHistoryModel> result;

  HistoryModel(this.status, this.message, this.result);

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryModelToJson(this);
}
