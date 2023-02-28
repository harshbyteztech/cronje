// To parse this JSON data, do
//
//     final mergerModel = mergerModelFromJson(jsonString);

import 'dart:convert';

MergerModel mergerModelFromJson(String str) => MergerModel.fromJson(json.decode(str));

String mergerModelToJson(MergerModel data) => json.encode(data.toJson());

class MergerModel {
  MergerModel({
    this.acquirerTurnover,
    this.acquirerAssets,
    this.targetTurnover,
    this.targetAssets,
    this.filingFee,
    this.mergerRequired,
  });

  String? acquirerTurnover;
  String? acquirerAssets;
  String? targetTurnover;
  String? targetAssets;
  String? filingFee;
  String? mergerRequired;

  factory MergerModel.fromJson(Map<String, dynamic> json) => MergerModel(
    acquirerTurnover: json["Acquirer Turnover"],
    acquirerAssets: json["Acquirer Assets"],
    targetTurnover: json["Target Turnover"],
    targetAssets: json["Target Assets"],
    filingFee: json["filing_fee"],
    mergerRequired: json["merger_required"],
  );

  Map<String, dynamic> toJson() => {
    "Acquirer Turnover": acquirerTurnover,
    "Acquirer Assets": acquirerAssets,
    "Target Turnover": targetTurnover,
    "Target Assets": targetAssets,
    "filing_fee": filingFee,
    "merger_required": mergerRequired,
  };
}
