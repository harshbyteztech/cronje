import 'dart:convert';

CalculateModel calculateModelFromJson(String str) =>
    CalculateModel.fromJson(json.decode(str));

String calculateModelToJson(CalculateModel data) => json.encode(data.toJson());

class CalculateModel {
  CalculateModel({
    this.sale_price,
    this.attorney,
    this.deeds,
    this.stampduty,
    this.transferduty,
    this.postage,
    this.vat,
    this.total,
  });

  dynamic sale_price;
  dynamic attorney;
  dynamic deeds;
  dynamic stampduty;
  dynamic transferduty;
  dynamic postage;
  dynamic vat;
  dynamic total;

  factory CalculateModel.fromJson(Map<String, dynamic> json) => CalculateModel(
        sale_price: json["sale price"],
        attorney: json["attorney"],
        deeds: json["deeds"],
        stampduty: json["stampduty"],
        transferduty: json["transferduty"],
        postage: json["postage"],
        vat: json["vat"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "sale_price": sale_price,
        "attorney": attorney,
        "deeds": deeds,
        "stampduty": stampduty,
        "transferduty": transferduty,
        "postage": postage,
        "vat": vat,
        "total": total,
      };
}
