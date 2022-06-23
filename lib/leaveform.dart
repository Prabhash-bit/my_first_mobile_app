import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newapp/model/statecontroller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:http/http.dart' as http;
import 'home.dart';
import 'model/Leaveform.dart';
import 'themecolors.dart';

class LeaveForm extends ConsumerStatefulWidget {
  const LeaveForm({Key? key}) : super(key: key);

  @override
  ConsumerState<LeaveForm> createState() => _LeaveFormState();
}

class _LeaveFormState extends ConsumerState<LeaveForm> {
  TextEditingController dobs = TextEditingController();
  TextEditingController dobs1 = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController mname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController empid = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController justnow = TextEditingController();
  TextEditingController reasonofleave = TextEditingController();
  TextEditingController contactpersononleave = TextEditingController();
  TextEditingController phone = TextEditingController();

  bool isInsideValleyChecked = false;
  bool isOutsideValleyChecked = false;
  String _value = "Sick";
  String _valley = "inside";

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.parse(DateTime.now().toString());
    justnow.text = now.toString();
  }

  @override
  void dispose() {
    super.dispose();
    // dobs;
    // dobs1;
    // fname;
    // lname;
    // fullname;
    // justnow;
    // reasonofleave;
    // phone;
    // contactpersononleave;
    // department;
    // designation;
    // empid;
    // mname;
  }

  Future<List<leaveDatum>> submitPost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token').toString();
    final msg = jsonEncode({
      // "emp_id": empid.text,
      "date_of_application": justnow.text,
      "date_of_leave_from": dobs.text,
      "date_of_leave_to": dobs1.text,
      "reason_of_leave": reasonofleave.text,
      "outside_inside_valley": _valley,
      "contact_person_on_leave": contactpersononleave.text,
      "leavetype": _value,
      "emergency_contact": phone.text
    });
    final response = await http.post(Uri.parse(""),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.acceptHeader: "application/json"
        },
        //encoding: Encoding.getByName("utf-8"),
        body: msg);
    final responseJson = json.decode(response.body);

    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', responseJson['access_token']);

      return (responseJson);
    } else {
      //print(response.body);

      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create');
    }
  }

  @override
  Widget build(BuildContext context) {
    final _leavedata = ref.watch(leaveDataProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: ThemeClass.darkTheme,
      home: Scaffold(
        //backgroundColor: Color.fromARGB(255, 236, 206, 206),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1C212D),
          title: const Text(
            'Leave Application Form',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Shannon',
                fontWeight: FontWeight.bold),
          ),
        ),
        body: _leavedata.when(
          data: (leaveDataProvider) {
            empid.text = leaveDataProvider[0].empId.toString();
            fname.text = leaveDataProvider[0].name!;
            designation.text = leaveDataProvider[0].designation!;
            department.text = leaveDataProvider[0].department!;
            return Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                //color: Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 15.0,
                          child: Material(
                            elevation: 1,
                            shadowColor: Colors.white12,
                            child: TextField(
                              enabled: false,
                              readOnly: true,
                              controller: empid,
                              decoration: const InputDecoration(
                                labelText: 'Employee ID',
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 225, 230, 226),
                                        width: 1.0)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 15.0,
                          child: Material(
                            elevation: 1,
                            shadowColor: Colors.white12,
                            child: TextField(
                              readOnly: true,
                              enabled: false,
                              controller: fname,
                              decoration: const InputDecoration(
                                labelText: " Full Name",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 225, 230, 226),
                                        width: 1.0)
                                    //borderRadius: BorderRadius.circular(20.0),
                                    ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 15.0,
                          child: Material(
                            elevation: 1,
                            shadowColor: Colors.white12,
                            child: TextField(
                              enabled: false,
                              controller: designation,
                              decoration: const InputDecoration(
                                labelText: 'Designation',
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 225, 230, 226),
                                        width: 1.0)
                                    //borderRadius: BorderRadius.circular(20.0),
                                    ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 15.0,
                          child: Material(
                            elevation: 1,
                            shadowColor: Colors.white12,
                            child: TextField(
                              enabled: false,
                              controller: department,
                              decoration: const InputDecoration(
                                labelText: 'Department',
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 225, 230, 226),
                                        width: 1.0)
                                    //borderRadius: BorderRadius.circular(20.0),
                                    ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 15.0,
                          child: Material(
                            elevation: 1,
                            shadowColor: Colors.white12,
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              controller: phone,
                              decoration: const InputDecoration(
                                labelText: 'Phone Number *',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 225, 230, 226),
                                      width: 1.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 15.0,
                          child: Material(
                            elevation: 1,
                            shadowColor: Colors.white12,
                            child: TextField(
                              controller: dobs,
                              keyboardType: TextInputType.datetime,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 225, 230, 226),
                                        width: 1.0)
                                    //borderRadius: BorderRadius.circular(20.0),
                                    ),
                                //isDense: true,
                                labelText: 'Leave from *',
                                suffixIcon: Icon(Icons.calendar_today),
                              ),
                              readOnly:
                                  true, //set it true, so that user will not able to edit text
                              onTap: () async {
                                var date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100));
                                dobs.text = date.toString().substring(0, 10);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 15.0,
                          child: Material(
                            elevation: 1,
                            shadowColor: Colors.white12,
                            child: TextField(
                              controller: dobs1,
                              keyboardType: TextInputType.datetime,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 225, 230, 226),
                                        width: 1.0)
                                    //borderRadius: BorderRadius.circular(20.0),
                                    ),
                                //isDense: true,
                                labelText: 'Leave To *',
                                suffixIcon: Icon(Icons.calendar_today),
                              ),
                              readOnly:
                                  true, //set it true, so that user will not able to edit text
                              onTap: () async {
                                var date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100));
                                dobs1.text = date.toString().substring(0, 10);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width,
                        //   height: MediaQuery.of(context).size.height / 15.0,
                        //   child: const Material(
                        //     elevation: 1,
                        //     shadowColor: Colors.white12,
                        //     child: TextField(
                        //       keyboardType: TextInputType.number,
                        //       decoration: InputDecoration(
                        //         labelText: 'Total Leave days *',
                        //         enabledBorder: OutlineInputBorder(
                        //             borderSide: BorderSide(
                        //                 color: Color.fromARGB(255, 225, 230, 226),
                        //                 width: 1.0)
                        //             //borderRadius: BorderRadius.circular(20.0),
                        //             ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.0,
                          height: MediaQuery.of(context).size.height / 5.0,
                          child: Material(
                            elevation: 1,
                            shadowColor: Colors.white12,
                            child: TextField(
                              controller: reasonofleave,
                              maxLines: 5,
                              decoration: const InputDecoration(
                                labelText: 'Reason for leave *',
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 225, 230, 226),
                                        width: 1.0)
                                    //borderRadius: rBorderRadius.circular(20.0),
                                    ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 15.0,
                          child: Material(
                            elevation: 1,
                            shadowColor: Colors.white12,
                            child: TextField(
                              controller: contactpersononleave,
                              decoration: const InputDecoration(
                                labelText:
                                    'Contact person in Department while on leave *',
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 225, 230, 226),
                                        width: 1.0)
                                    //borderRadius: BorderRadius.circular(20.0),
                                    ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Center(
                          child: Column(
                            children: [
                              Material(
                                elevation: 1,
                                shadowColor: Colors.white12,
                                child: DropdownButtonFormField<String>(
                                  value: _valley,
                                  decoration: const InputDecoration(
                                    labelText: 'Inside/Outside Valley *',
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 225, 230, 226),
                                            width: 1.0)
                                        //borderRadius: BorderRadius.circular(20.0),
                                        ),
                                  ),
                                  //hint: Text('Types of leave'),
                                  items: <String>[
                                    'inside',
                                    'outside',
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? valley) {
                                    setState(() {
                                      _valley = valley!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Type of leave *',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Center(
                          child: Column(
                            children: [
                              //DropdownButtonFormField(items: items, onChanged: onChanged),
                              Material(
                                elevation: 1,
                                shadowColor: Colors.white12,
                                child: DropdownButtonFormField<String>(
                                  value: _value,
                                  decoration: const InputDecoration(
                                    labelText: 'Types of leave',
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 225, 230, 226),
                                            width: 1.0)),
                                  ),
                                  //hint: Text('Types of leave'),
                                  items: <String>[
                                    'Privilege',
                                    'Sick',
                                    'Casual',
                                    'Official',
                                    //'Sick Leave',
                                    //'Sick Leave',
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? leaveType) {
                                    setState(() {
                                      _value = leaveType!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 2.0),
                          child: Center(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(255, 216, 49, 1),
                              )),
                              child: const Text(
                                "Submit for Approval",
                                style: TextStyle(
                                    color: Color(0xFF1C212D),
                                    fontFamily: 'Shannon'),
                              ),
                              onPressed: () {
                                //SubmitPost();
                                if (phone.text.isEmpty ||
                                    dobs.text.isEmpty ||
                                    dobs1.text.isEmpty ||
                                    reasonofleave.text.isEmpty ||
                                    contactpersononleave.text.isEmpty) {
                                  CoolAlert.show(
                                    context: context,
                                    type: CoolAlertType.error,
                                    text: 'Please fill required * fields',
                                    loopAnimation: false,
                                  );
                                } else if (dobs.text.compareTo(dobs1.text) ==
                                        0 ||
                                    dobs.text.compareTo(dobs1.text) > 0) {
                                  CoolAlert.show(
                                    context: context,
                                    type: CoolAlertType.error,
                                    text:
                                        'Check-out date field, something wrong',
                                    loopAnimation: false,
                                  );
                                } else {
                                  submitPost().then(
                                    (value) => CoolAlert.show(
                                      context: context,
                                      type: CoolAlertType.success,
                                      text: 'Sent for Approval, Successfully',
                                      loopAnimation: false,
                                    ).then(
                                      (value) => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomeNavPage(),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
