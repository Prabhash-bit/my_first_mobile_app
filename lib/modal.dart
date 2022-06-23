// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// import 'attendence_approval.dart';
// import 'leave_approval.dart';
// import 'leaveform.dart';
// import 'logincard.dart';
// import 'mannual_attendence_form.dart';
// import 'model/profile_data.dart';
// import 'performance_appraisal_review.dart';
// import 'probation_review.dart';
// import 'travel_request.dart';

// // final Profileapicalling profileapi = Profileapicalling();
// // late Future<List<Datumprofile>> userDetail;

// TextEditingController fname = TextEditingController();
// TextEditingController mname = TextEditingController();
// TextEditingController lname = TextEditingController();
// TextEditingController fullname = TextEditingController();
// TextEditingController designation = TextEditingController();
// TextEditingController department = TextEditingController();
// TextEditingController photo = TextEditingController();
// String picture = "";

// Future<void> getpreference() async {
//   final preferencesfromprofile = await SharedPreferences.getInstance();
//   final getfname = preferencesfromprofile.getString('fnamed');
//   fname.text = getfname.toString();
//   final getmname = preferencesfromprofile.getString('mnamed');
//   mname.text = getmname.toString();
//   final getlname = preferencesfromprofile.getString('lnamed');
//   lname.text = getlname.toString();
//   final getfullname = "$getfname" + " " + "$getmname" + " " + "$getlname";
//   fullname.text = getfullname.toString();
//   //print(getfullname);
//   final getdegination = preferencesfromprofile.getString('designation');
//   designation.text = getdegination.toString();
//   final getdepartment = preferencesfromprofile.getString('department');
//   department.text = getdepartment.toString();
//   final getphoto = preferencesfromprofile.getString('photo');
//   photo.text = getphoto.toString();
//   picture = photo.text; //.substring(22);
// }

// // @override
// // void initState() {
// //   getpreference();
// //   userDetail = profileapi.fetchProfileData();

// //   super.initState();
// // }

// class showmodal {
//   void temp(context) {
//     showModalBottomSheet(
//         isScrollControlled: false,
//         context: context,
//         builder: (BuildContext bc) {
//           return Container(
//             color: Colors.white,
//             //height: 900,
//             width: 200,
//             child: Column(
//               children: [
//                 SizedBox(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 310.0),
//                     child: Container(
//                       height: 30,
//                       width: 40,
//                       child: TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: Icon(
//                           Icons.close,
//                           color: Color(0xFF1C212D),
//                           size: 20.0,
//                         ),
//                         style: TextButton.styleFrom(
//                             primary: Colors.white,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(50))),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20.0),
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundImage: MemoryImage(base64Decode(picture)),
//                         radius: 45,
//                       ),
//                       SizedBox(width: 30.0),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Title(
//                             color: Color(0xFF1C212D),
//                             child: Text(
//                               fullname.text,
//                               style: TextStyle(
//                                   fontFamily: 'Shannon',
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           SizedBox(height: 2.0),
//                           Title(
//                             color: Color(0xFF1C212D),
//                             child: Text(
//                               designation.text,
//                               style: TextStyle(
//                                 fontFamily: 'Shannon',
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 2.0),
//                           Title(
//                             color: Color(0xFF1C212D),
//                             child: Text(
//                               department.text,
//                               style: TextStyle(
//                                 fontFamily: 'Shannon',
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Divider(),
//                 Container(
//                   height: 280,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         ListTile(
//                           title: Text(
//                             'Leave request',
//                             style: TextStyle(fontFamily: 'Shannon'),
//                           ),
//                           leading: Icon(Icons.request_page),
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => LeaveForm()));
//                           },
//                         ),
//                         ListTile(
//                           title: Text(
//                             'Leave approval',
//                             style: TextStyle(fontFamily: 'Shannon'),
//                           ),
//                           leading: FaIcon(FontAwesomeIcons.envelopesBulk),
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => LeaveApproval()));
//                           },
//                         ),
//                         ListTile(
//                           title: Text(
//                             'Travel request',
//                             style: TextStyle(fontFamily: 'Shannon'),
//                           ),
//                           leading: Icon(Icons.travel_explore),
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => TravelForm()));
//                           },
//                         ),
//                         ListTile(
//                           title: Text(
//                             'Mannual attendence',
//                             style: TextStyle(fontFamily: 'Shannon'),
//                           ),
//                           leading: FaIcon(FontAwesomeIcons.fileLines),
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => AttendenceForm()));
//                           },
//                         ),
//                         ListTile(
//                           title: Text(
//                             'Attendence approval',
//                             style: TextStyle(fontFamily: 'Shannon'),
//                           ),
//                           leading: Icon(Icons.approval),
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         AttendenceApproval()));
//                           },
//                         ),
//                         ListTile(
//                             title: Text(
//                               'Report',
//                               style: TextStyle(fontFamily: 'Shannon'),
//                             ),
//                             leading: FaIcon(FontAwesomeIcons.bookOpen)),
//                         Divider(),
//                         ListTile(
//                           title: Text(
//                             'Performance Appraisal',
//                             style: TextStyle(fontFamily: 'Shannon'),
//                           ),
//                           leading: FaIcon(FontAwesomeIcons.award),
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         performanceAppraisal()));
//                           },
//                         ),
//                         ListTile(
//                           title: Text(
//                             'Probation Review',
//                             style: TextStyle(fontFamily: 'Shannon'),
//                           ),
//                           leading: FaIcon(FontAwesomeIcons.clock),
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => probationReview()));
//                           },
//                         ),
//                         Divider(),
//                         ListTile(
//                           title: Text(
//                             'Setting',
//                             style: TextStyle(fontFamily: 'Shannon'),
//                           ),
//                           leading: Icon(Icons.settings),
//                         ),
//                         ListTile(
//                           title: Text(
//                             'Log-out',
//                             style: TextStyle(fontFamily: 'Shannon'),
//                           ),
//                           leading: Icon(Icons.logout_outlined),
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => loginCard()));
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//   }
// }
