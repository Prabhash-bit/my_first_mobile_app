import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

List<ProfileData> profileDataFromJson(String str) => List<ProfileData>.from(
    json.decode(str).map((x) => ProfileData.fromJson(x)));

String profileDataToJson(List<ProfileData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProfileData {
  ProfileData({
    this.errorCode,
    this.errorMessage,
    required this.data,
  });

  String? errorCode;
  String? errorMessage;
  List<Datumprofile> data;

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        errorCode: json["error_code"],
        errorMessage: json["error_message"],
        data: List<Datumprofile>.from(
            json["Data"].map((x) => Datumprofile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error_code": errorCode,
        "error_message": errorMessage,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datumprofile {
  Datumprofile({
    this.empId,
    this.fname,
    this.mname,
    this.lname,
    this.dobAd,
    this.dobBs,
    this.age,
    this.personalEmail,
    this.phone,
    this.taddress,
    this.paddress,
    this.gender,
    this.citizenshipNo,
    this.citizenshipIssuePlace,
    this.citizenshipIssueDate,
    this.passportNo,
    this.passportIssuePlace,
    this.passportIssueDate,
    this.photo,
    this.mid,
    this.eid,
    this.maritialStatus,
    this.bloodGroup,
    this.employeeType,
    this.designation,
    this.department,
    this.station,
    this.company,
    this.workingStatus,
    this.dateOfJoinAd,
    this.dateOfJoinBs,
    this.appointmentType,
    this.craft,
    this.level,
    this.probationEndDateAd,
    this.probationEndDateBs,
    this.reportsTo,
    this.permanentDateBs,
    this.permanentDateAd,
    this.lastWorkDateBs,
    this.bankAccount,
    this.pan,
    this.cit,
    this.ssf,
    this.yearAtCe,
    // this.emergenyDetails,
    // this.academicDetails,
    // this.trainingDetails,
    // this.experienceDetails,
  });

  int? empId;
  String? fname;
  String? mname;
  String? lname;
  DateTime? dobAd;
  DateTime? dobBs;
  String? age;
  String? personalEmail;
  String? phone;
  String? taddress;
  String? paddress;
  String? gender;
  String? citizenshipNo;
  String? citizenshipIssuePlace;
  DateTime? citizenshipIssueDate;
  String? passportNo;
  String? passportIssuePlace;
  DateTime? passportIssueDate;

  String? photo;
  String? mid;
  String? eid;
  String? maritialStatus;
  String? bloodGroup;
  String? employeeType;
  String? designation;
  String? department;
  String? station;
  String? company;
  String? workingStatus;
  DateTime? permanentDateAd;
  DateTime? dateOfJoinAd;
  DateTime? dateOfJoinBs;
  String? appointmentType;
  String? craft;
  String? level;
  DateTime? probationEndDateAd;
  DateTime? probationEndDateBs;
  String? reportsTo;
  DateTime? permanentDateBs;
  DateTime? lastWorkDateBs;
  String? bankAccount;
  String? pan;
  String? cit;
  String? ssf;
  String? yearAtCe;
  // List<EmergenyDetail> emergenyDetails;
  // List<AcademicDetail> academicDetails;
  // List<TrainingDetail> trainingDetails;
  // List<ExperienceDetail> experienceDetails;

  factory Datumprofile.fromJson(Map<String, dynamic> json) => Datumprofile(
        empId: json["emp_id"],
        fname: json["fname"],
        mname: json["mname"],
        lname: json["lname"],
        dobAd: DateTime.parse(json["dob_ad"]),
        dobBs: DateTime.parse(json["dob_bs"]),
        age: json["age"],
        personalEmail: json["personal_email"],
        phone: json["phone"],
        taddress: json["taddress"],
        paddress: json["paddress"],
        gender: json["gender"],
        citizenshipNo: json["citizenship_no"],
        citizenshipIssuePlace: json["citizenship_issue_place"],
        citizenshipIssueDate: DateTime.tryParse(json["citizenship_issue_date"]),
        passportNo: json["pass_no"],
        passportIssuePlace: json["pass_issue_place"],
        //passportIssueDate: DateTime.tryParse(json["pass_issue_date"]),
        photo: json["photo"],
        mid: json["mid"],
        eid: json["eid"],
        maritialStatus: json["maritial_status"],
        bloodGroup: json["blood_group"],
        employeeType: json["employee_type"],
        designation: json["designation"],
        department: json["department"],
        station: json["station"],
        company: json["company"],
        workingStatus: json["working_status"],
        permanentDateAd: DateTime.tryParse(
            json["permanent_date_ad"] == "null-null-null"
                ? "-"
                : json["permanent_date_ad"]),
        dateOfJoinAd: DateTime.tryParse(json["date_of_join_ad"]),
        dateOfJoinBs: DateTime.tryParse(json["date_of_join_bs"]),
        appointmentType: json["appointment_type"],
        craft: json["craft"],
        level: json["level"],
        probationEndDateAd: DateTime.tryParse(json["probation_end_date_ad"]),
        probationEndDateBs: DateTime.tryParse(json["probation_end_date_bs"]),
        reportsTo: json["reports_to"],
        permanentDateBs: DateTime.tryParse(json["permanent_date_bs"]),
        lastWorkDateBs: DateTime.tryParse(json["last_work_date_bs"]),
        bankAccount: json["bank_account"],
        pan: json["PAN"],
        cit: json["CIT"],
        ssf: json["SSF"],
        yearAtCe: json["Year_at_CE"],
        // emergenyDetails: List<EmergenyDetail>.from(json["emergeny_details"].map((x) => EmergenyDetail.fromJson(x))),
        // academicDetails: List<AcademicDetail>.from(json["academic_details"].map((x) => AcademicDetail.fromJson(x))),
        // trainingDetails: List<TrainingDetail>.from(json["training_details"].map((x) => TrainingDetail.fromJson(x))),
        // experienceDetails: List<ExperienceDetail>.from(json["experience_details"].map((x) => ExperienceDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "emp_id": empId,
        "fname": fname,
        "mname": mname,
        "lname": lname,
        "dob_ad":
            "${dobAd!.year.toString().padLeft(4, '0')}-${dobAd!.month.toString().padLeft(2, '0')}-${dobAd!.day.toString().padLeft(2, '0')}",
        "dob_bs":
            "${dobBs!.year.toString().padLeft(4, '0')}-${dobBs!.month.toString().padLeft(2, '0')}-${dobBs!.day.toString().padLeft(2, '0')}",
        "age": age,
        "personalEmail": personalEmail,
        "phone": phone,
        "taddress": taddress,
        "paddress": paddress,
        "gender": gender,
        "citizenship_no": citizenshipNo,
        "citizenship_issue_place": citizenshipIssuePlace,
        "citizenship_issue_date":
            "${citizenshipIssueDate!.year.toString().padLeft(4, '0')}-${citizenshipIssueDate!.month.toString().padLeft(2, '0')}-${citizenshipIssueDate!.day.toString().padLeft(2, '0')}",
        "pass_no": passportNo,
        "pass_issue_place": passportIssuePlace,
        "pass_issue_date":
            "${passportIssueDate!.year.toString().padLeft(4, '0')}-${passportIssueDate!.month.toString().padLeft(2, '0')}-${passportIssueDate!.day.toString().padLeft(2, '0')}",
        "photo": photo,

        "mid": mid,
        "eid": eid,
        "maritial_status": maritialStatus,
        "blood_group": bloodGroup,
        "employee_type": employeeType,
        "designation": designation,
        "department": department,
        "station": station,
        "company": company,
        "working_status": workingStatus,
        "permanent_date_ad":
            "${permanentDateAd!.year.toString().padLeft(4, '0')}-${permanentDateAd!.month.toString().padLeft(2, '0')}-${permanentDateAd!.day.toString().padLeft(2, '0')}",
        "date_of_join_ad":
            "${dateOfJoinAd!.year.toString().padLeft(4, '0')}-${dateOfJoinAd!.month.toString().padLeft(2, '0')}-${dateOfJoinAd!.day.toString().padLeft(2, '0')}",
        "date_of_join_bs":
            "${dateOfJoinBs!.year.toString().padLeft(4, '0')}-${dateOfJoinBs!.month.toString().padLeft(2, '0')}-${dateOfJoinBs!.day.toString().padLeft(2, '0')}",
        "appointment_type": appointmentType,
        "craft": craft,
        "level": level,
        "probation_end_date_ad":
            "${probationEndDateAd!.year.toString().padLeft(4, '0')}-${probationEndDateAd!.month.toString().padLeft(2, '0')}-${probationEndDateAd!.day.toString().padLeft(2, '0')}",
        "probation_end_date_bs":
            "${probationEndDateBs!.year.toString().padLeft(4, '0')}-${probationEndDateBs!.month.toString().padLeft(2, '0')}-${probationEndDateBs!.day.toString().padLeft(2, '0')}",
        "reports_to": reportsTo,
        "permanent_date_bs":
            "${permanentDateBs!.year.toString().padLeft(4, '0')}-${permanentDateBs!.month.toString().padLeft(2, '0')}-${permanentDateBs!.day.toString().padLeft(2, '0')}",
        "last_work_date_bs":
            "${lastWorkDateBs!.year.toString().padLeft(4, '0')}-${lastWorkDateBs!.month.toString().padLeft(2, '0')}-${lastWorkDateBs!.day.toString().padLeft(2, '0')}",
        "bank_account": bankAccount,
        "PAN": pan,
        "CIT": cit,
        "SSF": ssf,
        "Year_at_CE": yearAtCe,
        // "emergeny_details": List<dynamic>.from(emergenyDetails.map((x) => x.toJson())),
        // "academic_details": List<dynamic>.from(academicDetails.map((x) => x.toJson())),
        // "training_details": List<dynamic>.from(trainingDetails.map((x) => x.toJson())),
        // "experience_details": List<dynamic>.from(experienceDetails.map((x) => x.toJson())),
      };
}

// class AcademicDetail {
//     AcademicDetail({
//         this.id,
//         this.empId,
//         this.nameOfCourse,
//         this.nameOfInstitution,
//         this.nameOfUniversity,
//         this.courseDuration,
//         this.gradYrAd,
//         this.gradYrBs,
//         this.grade,
//         this.specialization,
//     });

// int id;
// int empId;
// String nameOfCourse;
// String nameOfInstitution;
// String nameOfUniversity;
// String courseDuration;
// DateTime gradYrAd;
// DateTime gradYrBs;
// String grade;
// String specialization;

//     factory AcademicDetail.fromJson(Map<String, dynamic> json) => AcademicDetail(
//         id: json["id"],
//         empId: json["emp_id"],
//         nameOfCourse: json["name_of_course"],
//         nameOfInstitution: json["name_of_institution"],
//         nameOfUniversity: json["name_of_university"],
//         courseDuration: json["course_duration"],
//         gradYrAd: DateTime.parse(json["grad_yr_ad"]),
//         gradYrBs: DateTime.parse(json["grad_yr_bs"]),
//         grade: json["grade"],
//         specialization: json["specialization"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "emp_id": empId,
//         "name_of_course": nameOfCourse,
//         "name_of_institution": nameOfInstitution,
//         "name_of_university": nameOfUniversity,
//         "course_duration": courseDuration,
//         "grad_yr_ad": "${gradYrAd.year.toString().padLeft(4, '0')}-${gradYrAd.month.toString().padLeft(2, '0')}-${gradYrAd.day.toString().padLeft(2, '0')}",
//         "grad_yr_bs": "${gradYrBs.year.toString().padLeft(4, '0')}-${gradYrBs.month.toString().padLeft(2, '0')}-${gradYrBs.day.toString().padLeft(2, '0')}",
//         "grade": grade,
//         "specialization": specialization,
//     };
// }

// class EmergenyDetail {
//     EmergenyDetail({
//         this.id,
//         this.empId,
//         this.emergencyName,
//         this.emergencyRelation,
//         this.emergencyContact,
//     });

//     int id;
//     int empId;
//     String emergencyName;
//     String emergencyRelation;
//     String emergencyContact;

//     factory EmergenyDetail.fromJson(Map<String, dynamic> json) => EmergenyDetail(
//         id: json["id"],
//         empId: json["emp_id"],
//         emergencyName: json["emergency_name"],
//         emergencyRelation: json["emergency_relation"],
//         emergencyContact: json["emergency_contact"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "emp_id": empId,
//         "emergency_name": emergencyName,
//         "emergency_relation": emergencyRelation,
//         "emergency_contact": emergencyContact,
//     };
// }

// class ExperienceDetail {
//     ExperienceDetail({
//         this.id,
//         this.empId,
//         this.nameOfEmployer,
//         this.nameOfDesingation,
//         this.serviceDuration,
//     });

//     int id;
//     int empId;
//     String nameOfEmployer;
//     String nameOfDesingation;
//     String serviceDuration;

//     factory ExperienceDetail.fromJson(Map<String, dynamic> json) => ExperienceDetail(
//         id: json["id"],
//         empId: json["emp_id"],
//         nameOfEmployer: json["name_of_employer"],
//         nameOfDesingation: json["name_of_desingation"],
//         serviceDuration: json["service_duration"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "emp_id": empId,
//         "name_of_employer": nameOfEmployer,
//         "name_of_desingation": nameOfDesingation,
//         "service_duration": serviceDuration,
//     };
// }

// class TrainingDetail {
//     TrainingDetail({
//         this.id,
//         this.empId,
//         this.nameOfTraining,
//         this.nameOfTrainingInstitution,
//         this.trainingDuration,
//     });

//     int id;
//     int empId;
//     String nameOfTraining;
//     String nameOfTrainingInstitution;
//     String trainingDuration;

//     factory TrainingDetail.fromJson(Map<String, dynamic> json) => TrainingDetail(
//         id: json["id"],
//         empId: json["emp_id"],
//         nameOfTraining: json["name_of_training"],
//         nameOfTrainingInstitution: json["name_of_training_institution"],
//         trainingDuration: json["training_duration"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "emp_id": empId,
//         "name_of_training": nameOfTraining,
//         "name_of_training_institution": nameOfTrainingInstitution,
//         "training_duration": trainingDuration,
//     };
// }

class Profileapicalling extends ChangeNotifier {
  // Profileapicalling() {
  //   fetchProfileData();
  // }

  Future<List<Datumprofile>> fetchProfileData() async {
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

      return jsonResponse.map((job) => Datumprofile.fromJson(job)).toList();

      //print();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
