// To parse this JSON data, do
//
//     final kurModel = kurModelFromJson(jsonString);

import 'dart:convert';

KurModel kurModelFromJson(String str) => KurModel.fromJson(json.decode(str));

String kurModelToJson(KurModel data) => json.encode(data.toJson());

class KurModel {
    KurModel({
        required this.developer,
        required this.tcmbAnlikKurBilgileri,
    });

    Developer developer;
    List<TcmbAnlikKurBilgileri> tcmbAnlikKurBilgileri;

    factory KurModel.fromJson(Map<String, dynamic> json) => KurModel(
        developer: Developer.fromJson(json["Developer"]),
        tcmbAnlikKurBilgileri: List<TcmbAnlikKurBilgileri>.from(json["TCMB_AnlikKurBilgileri"].map((x) => TcmbAnlikKurBilgileri.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Developer": developer.toJson(),
        "TCMB_AnlikKurBilgileri": List<dynamic>.from(tcmbAnlikKurBilgileri.map((x) => x.toJson())),
    };
}

class Developer {
    Developer({
        required this.name,
        required this.website,
        required this.email,
    });

    String name;
    String website;
    String email;

    factory Developer.fromJson(Map<String, dynamic> json) => Developer(
        name: json["name"],
        website: json["website"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "website": website,
        "email": email,
    };
}

class TcmbAnlikKurBilgileri {
    TcmbAnlikKurBilgileri({
        required this.isim,
        required this.currencyName,
        required this.forexBuying,
        required this.forexSelling,
        required this.banknoteBuying,
        required this.banknoteSelling,
        this.crossRateUsd,
        this.crossRateOther,
    });

    String isim;
    String currencyName;
    double forexBuying;
    dynamic forexSelling;
    dynamic banknoteBuying;
    dynamic banknoteSelling;
    dynamic crossRateUsd;
    dynamic crossRateOther;

    factory TcmbAnlikKurBilgileri.fromJson(Map<String, dynamic> json) => TcmbAnlikKurBilgileri(
        isim: json["Isim"],
        currencyName: json["CurrencyName"],
        forexBuying: json["ForexBuying"].toDouble(),
        forexSelling: json["ForexSelling"],
        banknoteBuying: json["BanknoteBuying"],
        banknoteSelling: json["BanknoteSelling"],
        crossRateUsd: json["CrossRateUSD"],
        crossRateOther: json["CrossRateOther"],
    );

    Map<String, dynamic> toJson() => {
        "Isim": isim,
        "CurrencyName": currencyName,
        "ForexBuying": forexBuying,
        "ForexSelling": forexSelling,
        "BanknoteBuying": banknoteBuying,
        "BanknoteSelling": banknoteSelling,
        "CrossRateUSD": crossRateUsd,
        "CrossRateOther": crossRateOther,
    };
}
