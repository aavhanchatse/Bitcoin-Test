// To parse this JSON data, do
//
//     final currencyData = currencyDataFromJson(jsonString);

import 'dart:convert';

CurrencyData currencyDataFromJson(String str) =>
    CurrencyData.fromJson(json.decode(str));

String currencyDataToJson(CurrencyData data) => json.encode(data.toJson());

class CurrencyData {
  Time? time;
  String? disclaimer;
  String? chartName;
  Bpi? bpi;

  CurrencyData({
    this.time,
    this.disclaimer,
    this.chartName,
    this.bpi,
  });

  factory CurrencyData.fromJson(Map<String, dynamic> json) => CurrencyData(
        time: json["time"] == null ? null : Time.fromJson(json["time"]),
        disclaimer: json["disclaimer"],
        chartName: json["chartName"],
        bpi: json["bpi"] == null ? null : Bpi.fromJson(json["bpi"]),
      );

  Map<String, dynamic> toJson() => {
        "time": time?.toJson(),
        "disclaimer": disclaimer,
        "chartName": chartName,
        "bpi": bpi?.toJson(),
      };
}

class Bpi {
  Currency? usd;
  Currency? gbp;
  Currency? eur;

  Bpi({
    this.usd,
    this.gbp,
    this.eur,
  });

  factory Bpi.fromJson(Map<String, dynamic> json) => Bpi(
        usd: json["USD"] == null ? null : Currency.fromJson(json["USD"]),
        gbp: json["GBP"] == null ? null : Currency.fromJson(json["GBP"]),
        eur: json["EUR"] == null ? null : Currency.fromJson(json["EUR"]),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd?.toJson(),
        "GBP": gbp?.toJson(),
        "EUR": eur?.toJson(),
      };
}

class Currency {
  String? code;
  String? symbol;
  String? rate;
  String? description;
  double? rateFloat;

  Currency({
    this.code,
    this.symbol,
    this.rate,
    this.description,
    this.rateFloat,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"],
        symbol: json["symbol"],
        rate: json["rate"],
        description: json["description"],
        rateFloat: json["rate_float"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "symbol": symbol,
        "rate": rate,
        "description": description,
        "rate_float": rateFloat,
      };
}

class Time {
  String? updated;
  DateTime? updatedIso;
  String? updateduk;

  Time({
    this.updated,
    this.updatedIso,
    this.updateduk,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        updated: json["updated"],
        updatedIso: json["updatedISO"] == null
            ? null
            : DateTime.parse(json["updatedISO"]),
        updateduk: json["updateduk"],
      );

  Map<String, dynamic> toJson() => {
        "updated": updated,
        "updatedISO": updatedIso?.toIso8601String(),
        "updateduk": updateduk,
      };
}
