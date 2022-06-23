import 'package:cool_alert/cool_alert.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newapp/model/station_data.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'model/statecontroller.dart';
import 'themecolors.dart';

class AttendenceForm extends ConsumerStatefulWidget {
  @override
  ConsumerState<AttendenceForm> createState() => _AttendenceFormState();
}

class _AttendenceFormState extends ConsumerState<AttendenceForm> {
  TextEditingController dobs = TextEditingController();
  TextEditingController dobs1 = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController time1 = TextEditingController();
  final timeController = TextEditingController();
  final timeController1 = TextEditingController();
  final Station tocall = Station();
  String station = "BYNK";
  static List<String> listedstation = <String>[];

  @override
  void initState() {
    tocall.fetchStationData();
    listedstation = Station.listedstation;

    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    timeController.dispose();
    timeController1.dispose();
    super.dispose();

    bool isInsideValleyChecked = false;
    bool isOutsideValleyChecked = false;
  }

  @override
  Widget build(BuildContext context) {
    final _viewattendence = ref.watch(stationDataProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: ThemeClass.darkTheme,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF1C212D),
            title: const Text(
              'Mannual Attendence Form',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          body: _viewattendence.when(
            data: (_viewprofile) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 16.0,
                          child: Material(
                            elevation: 1,
                            shadowColor: Colors.white12,
                            child: DropdownButtonFormField<String>(
                              value: station,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                labelText: 'Station',
                              ),
                              onChanged: (String? stations) {
                                setState(() {
                                  station = stations!;
                                });
                              },
                              items: listedstation
                                  .where((e) => e != null) //removes null items
                                  .toSet()
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 16.0,
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
                                        width: 1.0)),
                                //isDense: true,
                                labelText: 'Date',
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
                          height: MediaQuery.of(context).size.height / 16.0,
                          child: Material(
                            elevation: 1,
                            shadowColor: Colors.white12,
                            child: TextField(
                              controller: timeController,
                              keyboardType: TextInputType.datetime,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 225, 230, 226),
                                        width: 1.0)),
                                //isDense: true,
                                labelText: 'Check-in',
                                suffixIcon: Icon(Icons.timer),
                              ),
                              readOnly:
                                  true, //set it true, so that user will not able to edit text
                              onTap: () async {
                                var time = await showTimePicker(
                                  initialTime: TimeOfDay.now(),
                                  context: context,
                                );
                                timeController.text = time!.format(context);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 16.0,
                          child: Material(
                            elevation: 1,
                            shadowColor: Colors.white12,
                            child: TextField(
                              controller: timeController1,
                              keyboardType: TextInputType.datetime,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 225, 230, 226),
                                        width: 1.0)),
                                //isDense: true,
                                labelText: 'Check-Out',
                                suffixIcon: Icon(Icons.timer),
                              ),
                              readOnly:
                                  true, //set it true, so that user will not able to edit text
                              onTap: () async {
                                var date = await showTimePicker(
                                  initialTime:
                                      const TimeOfDay(hour: 1, minute: 30),
                                  context: context,
                                );

                                timeController1.text = date!.format(context);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
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
                                CoolAlert.show(
                                  context: context,
                                  type: CoolAlertType.success,
                                  text: 'Sent for Approval, Successfully',
                                  loopAnimation: false,
                                ).then((value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeNavPage())));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            error: (err, s) => Text(err.toString()),
            loading: () => const Center(child: CircularProgressIndicator()),
          )),
    );
  }
}
