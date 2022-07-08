
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_buy_model.g.dart';

@JsonSerializable()
class ResultBuyModel {
  ResultBuyModel({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory ResultBuyModel.fromJson(Map<String, dynamic> json) => ResultBuyModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}