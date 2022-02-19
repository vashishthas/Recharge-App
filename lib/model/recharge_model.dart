// To parse this JSON data, do
//
//     final rechargeModel = rechargeModelFromJson(jsonString);

import 'dart:convert';

RechargeModel rechargeModelFromJson(String str) =>
    RechargeModel.fromJson(json.decode(str));

String rechargeModelToJson(RechargeModel data) => json.encode(data.toJson());

class RechargeModel {
  RechargeModel({
    required this.error,
    required this.message,
    required this.status,
    required this.response,
  });

  String error;
  String message;
  String status;
  Response response;

  factory RechargeModel.fromJson(Map<String, dynamic> json) => RechargeModel(
        error: json["error"],
        message: json["message"],
        status: json["status"],
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status": status,
        "response": response.toJson(),
      };
}

class Response {
  Response({
    required this.apiTransId,
    required this.status,
    required this.errorMessage,
    required this.operatorRef,
    required this.transactionDate,
  });

  String apiTransId;
  String status;
  String errorMessage;
  String operatorRef;
  String transactionDate;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        apiTransId: json["ApiTransID"],
        status: json["Status"],
        errorMessage: json["ErrorMessage"],
        operatorRef: json["OperatorRef"],
        transactionDate: json["TransactionDate"],
      );

  Map<String, dynamic> toJson() => {
        "ApiTransID": apiTransId,
        "Status": status,
        "ErrorMessage": errorMessage,
        "OperatorRef": operatorRef,
        "TransactionDate": transactionDate,
      };
}
