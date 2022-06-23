import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

List<StationData> stationDataFromJson(String str) => List<StationData>.from(
    json.decode(str).map((x) => StationData.fromJson(x)));

String stationDataToJson(List<StationData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StationData {
  StationData({
    this.errorCode,
    this.errorMessage,
    required this.data,
  });

  String? errorCode;
  String? errorMessage;
  List<Datum> data;

  factory StationData.fromJson(Map<String, dynamic> json) => StationData(
        errorCode: json["error_code"],
        errorMessage: json["error_message"],
        data: json["Data"] != null
            ? List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "error_code": errorCode,
        "error_message": errorMessage,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.stationId,
    this.stationName,
  });

  int? stationId;
  String? stationName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        stationId: json["StationId"],
        stationName: json["StationName"],
      );

  Map<String, dynamic> toJson() => {
        "StationId": stationId,
        "StationName": stationName,
      };
}

class Station {
  Station() {
    fetchStationData();
  }
  static List<String> listedstation = <String>[];
  Future<List<Datum>> fetchStationData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token').toString();
    // print(token);
    final response = await http.get(
      Uri.parse(('')),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json"
      },
    );

    if (response.statusCode == 200) {
      var parsed = json.decode(response.body);
      List jsonResponse = parsed["Data"] as List;

      List<Datum> cname =
          parsed["Data"].map<Datum>((x) => Datum.fromJson(x)).toList();
      for (var e in cname) {
        // print(e.StationName);
        listedstation.addAll([e.stationName!]);
      }

      return jsonResponse.map((job) => Datum.fromJson(job)).toList();
    } else {
      print(response.body);
      throw Exception('Failed to load Data');
    }
  }
}
