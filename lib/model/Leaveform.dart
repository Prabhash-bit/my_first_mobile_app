// To parse this JSON data, do
//
//     final leaveData = leaveDataFromJson(jsonString);

import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

List<LeaveData> leaveDataFromJson(String str) =>
    List<LeaveData>.from(json.decode(str).map((x) => LeaveData.fromJson(x)));

String leaveDataToJson(List<LeaveData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeaveData {
  LeaveData({
    this.errorCode,
    this.errorMessage,
    required this.data,
  });

  String? errorCode;
  String? errorMessage;
  List<leaveDatum> data;

  factory LeaveData.fromJson(Map<String, dynamic> json) => LeaveData(
        errorCode: json["error_code"],
        errorMessage: json["error_message"],
        data: List<leaveDatum>.from(
            json["Data"].map((x) => leaveDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error_code": errorCode,
        "error_message": errorMessage,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class leaveDatum {
  leaveDatum({
    this.empId,
    this.mid,
    this.eid,
    this.name,
    this.department,
    this.station,
    this.designation,
    this.leaveApplicationId,
    this.dateOfApplication,
    this.dateOfLeaveFrom,
    this.dateOfLeaveTo,
    this.totalLeaveDays,
    this.reasonOfLeave,
    this.outsideInsideValley,
    this.contactPersonOnLeave,
    this.leavetype,
    this.emergencyContact,
    this.approvedStatus,
    this.remarks,
  });

  int? empId;
  String? mid;
  String? eid;
  String? name;
  String? department;
  String? station;
  String? designation;
  int? leaveApplicationId;
  DateTime? dateOfApplication;
  DateTime? dateOfLeaveFrom;
  DateTime? dateOfLeaveTo;
  int? totalLeaveDays;
  String? reasonOfLeave;
  String? outsideInsideValley;
  String? contactPersonOnLeave;
  String? leavetype;
  String? emergencyContact;
  String? approvedStatus;
  String? remarks;

  factory leaveDatum.fromJson(Map<String, dynamic> json) => leaveDatum(
        empId: json["emp_id"],
        mid: json["mid"],
        eid: json["eid"],
        name: json["Name"],
        department: json["department"],
        station: json["station"],
        designation: json["designation"],
        leaveApplicationId: json["leave_application_Id"],
        dateOfApplication: DateTime.parse(json["date_of_application"]),
        dateOfLeaveFrom: DateTime.parse(json["date_of_leave_from"]),
        dateOfLeaveTo: DateTime.parse(json["date_of_leave_to"]),
        totalLeaveDays: json["total_leave_days"],
        reasonOfLeave: json["reason_of_leave"],
        outsideInsideValley: json["outside_inside_valley"],
        contactPersonOnLeave: json["contact_person_on_leave"],
        leavetype: json["leavetype"],
        emergencyContact: json["emergency_contact"],
        approvedStatus: json["approved_status"],
        remarks: json["remarks"],
      );

  get photo => null;

  Map<String, dynamic> toJson() => {
        "emp_id": empId,
        "mid": mid,
        "eid": eid,
        "Name": name,
        "department": department,
        "station": station,
        "designation": designation,
        "leave_application_Id": leaveApplicationId,
        "date_of_application":
            "${dateOfApplication!.year.toString().padLeft(4, '0')}-${dateOfApplication!.month.toString().padLeft(2, '0')}-${dateOfApplication!.day.toString().padLeft(2, '0')}",
        "date_of_leave_from":
            "${dateOfLeaveFrom!.year.toString().padLeft(4, '0')}-${dateOfLeaveFrom!.month.toString().padLeft(2, '0')}-${dateOfLeaveFrom!.day.toString().padLeft(2, '0')}",
        "date_of_leave_to":
            "${dateOfLeaveTo!.year.toString().padLeft(4, '0')}-${dateOfLeaveTo!.month.toString().padLeft(2, '0')}-${dateOfLeaveTo!.day.toString().padLeft(2, '0')}",
        "total_leave_days": totalLeaveDays,
        "reason_of_leave": reasonOfLeave,
        "outside_inside_valley": outsideInsideValley,
        "contact_person_on_leave": contactPersonOnLeave,
        "leavetype": leavetype,
        "emergency_contact": emergencyContact,
        "approved_status": approvedStatus,
        "remarks": remarks,
      };
}

class Leaveapicalling {
  // Leaveapicalling() {
  //   fetchLeaveData();
  // }
  Future<List<leaveDatum>> fetchLeaveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token').toString();
    final response = await http.post(Uri.parse(('')),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.acceptHeader: "application/json"
        },
        body: jsonEncode(<String, dynamic>{}));

    if (response.statusCode == 200) {
      var parsed = json.decode(response.body);

      List jsonResponse = parsed["Data"] as List;

      return jsonResponse.map((job) => leaveDatum.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
