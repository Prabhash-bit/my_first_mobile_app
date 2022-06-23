// To parse this JSON data, do
//
//     final attendenceData = attendenceDataFromJson(jsonString);
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

AttendenceData attendenceDataFromJson(String str) =>
    AttendenceData.fromJson(json.decode(str));

String attendenceDataToJson(AttendenceData data) => json.encode(data.toJson());

class AttendenceData {
  AttendenceData({
    this.errorCode,
    this.errorMessage,
    required this.data,
  });

  String? errorCode;
  String? errorMessage;
  List<Datum_attendence> data;

  factory AttendenceData.fromJson(Map<String, dynamic> json) => AttendenceData(
        errorCode: json["error_code"],
        errorMessage: json["error_message"],
        data: List<Datum_attendence>.from(
            json["Data"].map((x) => Datum_attendence.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error_code": errorCode,
        "error_message": errorMessage,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum_attendence {
  Datum_attendence({
    this.empId,
    this.mid,
    this.eid,
    this.employeeName,
    this.designation,
    this.department,
    this.station,
    this.company,
    this.tdateIn,
    this.intime,
    this.inEarly,
    this.inLate,
    this.inProcessedBy,
    this.tdateOut,
    this.outtime,
    this.outEarly,
    this.outLate,
    this.workingHr,
    this.outProcessedBy,
  });

  int? empId;
  String? mid;
  String? eid;
  String? employeeName;
  String? designation;
  String? department;
  String? station;
  String? company;
  DateTime? tdateIn;
  DateTime? intime;
  String? inEarly;
  String? inLate;
  String? inProcessedBy;
  DateTime? tdateOut;
  DateTime? outtime;
  String? outEarly;
  String? outLate;
  String? workingHr;
  String? outProcessedBy;

  factory Datum_attendence.fromJson(Map<String, dynamic> json) =>
      Datum_attendence(
        empId: json["emp_id"],
        mid: json["mid"],
        eid: json["eid"],
        employeeName: json["employee_name"],
        designation: json["designation"],
        department: json["department"],
        station: json["station"],
        company: json["company"],
        tdateIn: DateTime.parse(json["TDATE_IN"]),
        intime: DateTime.parse(json["INTIME"]),
        inEarly: json["In Early"],
        inLate: json["In Late"],
        inProcessedBy: json["In Processed By"],
        tdateOut: DateTime.parse(json["TDATE_OUT"]),
        outtime: DateTime.parse(json["OUTTIME"]),
        outEarly: json["Out Early"],
        outLate: json["Out Late"],
        workingHr: json["Working_Hr"],
        outProcessedBy: json["Out Processed By"],
      );

  Map<String, dynamic> toJson() => {
        "emp_id": empId,
        "mid": mid,
        "eid": eid,
        "employee_name": employeeName,
        "designation": designation,
        "department": department,
        "station": station,
        "company": company,
        "TDATE_IN":
            "${tdateIn!.year.toString().padLeft(4, '0')}-${tdateIn!.month.toString().padLeft(2, '0')}-${tdateIn!.day.toString().padLeft(2, '0')}",
        "INTIME": intime!.toIso8601String(),
        "In Early": inEarly,
        "In Late": inLate,
        "In Processed By": inProcessedBy,
        "TDATE_OUT":
            "${tdateOut!.year.toString().padLeft(4, '0')}-${tdateOut!.month.toString().padLeft(2, '0')}-${tdateOut!.day.toString().padLeft(2, '0')}",
        "OUTTIME": outtime!.toIso8601String(),
        "Out Early": outEarly,
        "Out Late": outLate,
        "Working_Hr": workingHr,
        "Out Processed By": outProcessedBy,
      };
}

class Attendenceapicalling extends ChangeNotifier {
  // Attendenceapicalling() {
  //   fetchAttendenceData();
  // }

  Future<List<Datum_attendence>> fetchAttendenceData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token').toString();
    final response = await http.post(Uri.parse(('')),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.acceptHeader: "application/json"
        },
        body: jsonEncode(<String, dynamic>{
          "year": "2079",
          "month": "01",
          "day": "",
          "station": "",
          "department": "",
          "company": "",
          "designation": ""
        }));

    if (response.statusCode == 200) {
      var parsed = json.decode(response.body);

      List jsonResponse = parsed["Data"] as List;

      return jsonResponse.map((job) => Datum_attendence.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
