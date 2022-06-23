// import 'package:flutter/material.dart';
// import 'model/Leaveform.dart';

// class LeaveFormDetail extends StatefulWidget {
//   @override
//   State<LeaveFormDetail> createState() => _LeaveFormDetailState();
// }

// class _LeaveFormDetailState extends State<LeaveFormDetail> {
//   final Leaveapicalling leaveapi = Leaveapicalling();
//   int? empId;
//   String? mid;
//   String? eid;
//   String? name;
//   String? department;
//   String? station;
//   String? designation;
//   int? leaveApplicationId;
//   DateTime? dateOfApplication;
//   DateTime? dateOfLeaveFrom;
//   DateTime? dateOfLeaveTo;
//   int? totalLeaveDays;
//   String? reasonOfLeave;
//   String? outsideInsideValley;
//   String? contactPersonOnLeave;
//   String? leavetype;
//   String? emergencyContact;
//   String? approvedStatus;
//   String? remarks;

//   late Future<List<leaveDatum>> List_leave;

//   TextEditingController dobs = TextEditingController();
//   TextEditingController dobs1 = TextEditingController();

//   bool isInsideValleyChecked = false;
//   bool isOutsideValleyChecked = false;

//   @override
//   void initState() {
//     super.initState();
//     List_leave = leaveapi.fetchLeaveData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     String _value = "Sick Leave";
//     String _valley = "Inside Valley";
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       //backgroundColor: Color.fromARGB(255, 236, 206, 206),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF1C212D),
//         title: const Text(
//           'Leave Detail',
//           style: TextStyle(
//               fontSize: 16, fontFamily: 'Shannon', fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: FutureBuilder<List<leaveDatum>>(
//         future: List_leave,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             empId = snapshot.data![0].empId;
//             //preferencesfromprofile?.setString("fname", fname.toString());
//             name = snapshot.data![0].name.toString();
//             department = snapshot.data![0].department.toString();
//             station = snapshot.data![0].station.toString();

//             designation = snapshot.data![0].designation.toString();

//             leaveApplicationId = snapshot.data![0].leaveApplicationId;
//             print(leaveApplicationId);

//             dateOfApplication = snapshot.data![0].dateOfApplication;
//             dateOfLeaveFrom = snapshot.data![0].dateOfLeaveFrom;
//             dateOfLeaveTo = snapshot.data![0].dateOfLeaveTo;
//             totalLeaveDays = snapshot.data![0].totalLeaveDays;

//             reasonOfLeave = snapshot.data![0].reasonOfLeave;
//             outsideInsideValley = snapshot.data![0].outsideInsideValley;
//             contactPersonOnLeave = snapshot.data![0].contactPersonOnLeave;
//             leavetype = snapshot.data![0].leavetype!;
//             emergencyContact = snapshot.data![0].emergencyContact;
//             approvedStatus = snapshot.data![0].approvedStatus;
//             remarks = snapshot.data![0].remarks;

//             return Padding(
//               padding: const EdgeInsets.all(1.0),
//               child: Container(
//                 color: Colors.white,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height / 15.0,
//                           child: const Material(
//                             elevation: 1,
//                             shadowColor: Colors.white12,
//                             child: TextField(
//                               readOnly: true,
//                               decoration: InputDecoration(
//                                 labelText: 'Employee ID',
//                                 enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color:
//                                             Color.fromARGB(255, 225, 230, 226),
//                                         width: 1.0)
//                                     //borderRadius: BorderRadius.circular(20.0),
//                                     ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10.0),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height / 15.0,
//                           child: const Material(
//                             elevation: 1,
//                             shadowColor: Colors.white12,
//                             child: TextField(
//                               decoration: InputDecoration(
//                                 labelText: 'Employee Name',
//                                 enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color:
//                                             Color.fromARGB(255, 225, 230, 226),
//                                         width: 1.0)
//                                     //borderRadius: BorderRadius.circular(20.0),
//                                     ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10.0),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height / 15.0,
//                           child: const Material(
//                             elevation: 1,
//                             shadowColor: Colors.white12,
//                             child: TextField(
//                               decoration: InputDecoration(
//                                 labelText: 'Designation',
//                                 enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color:
//                                             Color.fromARGB(255, 225, 230, 226),
//                                         width: 1.0)
//                                     //borderRadius: BorderRadius.circular(20.0),
//                                     ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10.0),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height / 15.0,
//                           child: const Material(
//                             elevation: 1,
//                             shadowColor: Colors.white12,
//                             child: TextField(
//                               decoration: InputDecoration(
//                                 labelText: 'Department',
//                                 enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color:
//                                             Color.fromARGB(255, 225, 230, 226),
//                                         width: 1.0)
//                                     //borderRadius: BorderRadius.circular(20.0),
//                                     ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10.0),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height / 15.0,
//                           child: const Material(
//                             elevation: 1,
//                             shadowColor: Colors.white12,
//                             child: TextField(
//                               decoration: InputDecoration(
//                                 labelText: 'Phone Number',
//                                 enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color:
//                                             Color.fromARGB(255, 225, 230, 226),
//                                         width: 1.0)
//                                     //borderRadius: BorderRadius.circular(20.0),
//                                     ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10.0),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height / 15.0,
//                           child: Material(
//                             elevation: 1,
//                             shadowColor: Colors.white12,
//                             child: TextField(
//                               controller: dobs,
//                               keyboardType: TextInputType.datetime,
//                               decoration: const InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color:
//                                             Color.fromARGB(255, 225, 230, 226),
//                                         width: 1.0)
//                                     //borderRadius: BorderRadius.circular(20.0),
//                                     ),
//                                 //isDense: true,
//                                 labelText: 'Leave from',
//                                 suffixIcon: Icon(Icons.calendar_today),
//                               ),
//                               readOnly:
//                                   true, //set it true, so that user will not able to edit text
//                               onTap: () async {
//                                 var date = await showDatePicker(
//                                     context: context,
//                                     initialDate: DateTime.now(),
//                                     firstDate: DateTime(1900),
//                                     lastDate: DateTime(2100));
//                                 dobs.text = date.toString().substring(0, 10);
//                               },
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10.0),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height / 15.0,
//                           child: Material(
//                             elevation: 1,
//                             shadowColor: Colors.white12,
//                             child: TextField(
//                               controller: dobs1,
//                               keyboardType: TextInputType.datetime,
//                               decoration: const InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color:
//                                             Color.fromARGB(255, 225, 230, 226),
//                                         width: 1.0)
//                                     //borderRadius: BorderRadius.circular(20.0),
//                                     ),
//                                 //isDense: true,
//                                 labelText: 'Leave To',
//                                 suffixIcon: Icon(Icons.calendar_today),
//                               ),
//                               readOnly:
//                                   true, //set it true, so that user will not able to edit text
//                               onTap: () async {
//                                 var date = await showDatePicker(
//                                     context: context,
//                                     initialDate: DateTime.now(),
//                                     firstDate: DateTime(1900),
//                                     lastDate: DateTime(2100));
//                                 dobs1.text = date.toString().substring(0, 10);
//                               },
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10.0),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height / 15.0,
//                           child: const Material(
//                             elevation: 1,
//                             shadowColor: Colors.white12,
//                             child: TextField(
//                               keyboardType: TextInputType.number,
//                               decoration: InputDecoration(
//                                 labelText: 'Total Leave days',
//                                 enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color:
//                                             Color.fromARGB(255, 225, 230, 226),
//                                         width: 1.0)
//                                     //borderRadius: BorderRadius.circular(20.0),
//                                     ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10.0),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height / 15.0,
//                           child: const Material(
//                             elevation: 1,
//                             shadowColor: Colors.white12,
//                             child: TextField(
//                               maxLines: 3,
//                               decoration: InputDecoration(
//                                 labelText: 'Reason for leave',
//                                 enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color:
//                                             Color.fromARGB(255, 225, 230, 226),
//                                         width: 1.0)
//                                     //borderRadius: BorderRadius.circular(20.0),
//                                     ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10.0),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height / 15.0,
//                           child: const Material(
//                             elevation: 1,
//                             shadowColor: Colors.white12,
//                             child: TextField(
//                               decoration: InputDecoration(
//                                 labelText:
//                                     'Contact person in Departmrnt while on leave',
//                                 enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color:
//                                             Color.fromARGB(255, 225, 230, 226),
//                                         width: 1.0)
//                                     //borderRadius: BorderRadius.circular(20.0),
//                                     ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 12.0),
//                         Center(
//                           child: Column(
//                             children: [
//                               Material(
//                                 elevation: 1,
//                                 shadowColor: Colors.white12,
//                                 child: DropdownButtonFormField<String>(
//                                   value: _valley,
//                                   decoration: const InputDecoration(
//                                     labelText: 'Inside/Outside Valley',
//                                     enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color.fromARGB(
//                                                 255, 225, 230, 226),
//                                             width: 1.0)
//                                         //borderRadius: BorderRadius.circular(20.0),
//                                         ),
//                                   ),
//                                   //hint: Text('Types of leave'),
//                                   items: <String>[
//                                     'Inside Valley',
//                                     'Outside Valley',
//                                   ].map((String value) {
//                                     return DropdownMenuItem<String>(
//                                       value: value,
//                                       child: Text(value),
//                                     );
//                                   }).toList(),
//                                   onChanged: (_) {},
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             child: const Text(
//                               'Type of leave',
//                               style: TextStyle(fontSize: 15),
//                             ),
//                           ),
//                         ),
//                         Center(
//                           child: Column(
//                             children: [
//                               //DropdownButtonFormField(items: items, onChanged: onChanged),
//                               Material(
//                                 elevation: 1,
//                                 shadowColor: Colors.white12,
//                                 child: DropdownButtonFormField<String>(
//                                   value: _value,
//                                   decoration: const InputDecoration(
//                                     labelText: 'Types of leave',
//                                     enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color.fromARGB(
//                                                 255, 225, 230, 226),
//                                             width: 1.0)
//                                         //borderRadius: BorderRadius.circular(20.0),
//                                         ),
//                                   ),
//                                   //hint: Text('Types of leave'),
//                                   items: <String>[
//                                     'Home Leave',
//                                     'Sick Leave',
//                                     'Causal leave',
//                                     'Official Leave',
//                                     //'Sick Leave',
//                                     //'Sick Leave',
//                                   ].map((String value) {
//                                     return DropdownMenuItem<String>(
//                                       value: value,
//                                       child: Text(value),
//                                     );
//                                   }).toList(),
//                                   onChanged: (_) {},
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Text('${snapshot.error}');
//           }
//           return const CircularProgressIndicator();
//         },
//       ),
//     );
//   }
// }
