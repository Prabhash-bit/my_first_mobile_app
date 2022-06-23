import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:newapp/model/attendence.dart';
import 'model/statecontroller.dart';
import 'nointernet.dart';
import 'notification.dart';

class TodayAttendence extends ConsumerStatefulWidget {
  @override
  ConsumerState<TodayAttendence> createState() => _TodayAttendenceState();
}

class _TodayAttendenceState extends ConsumerState<TodayAttendence> {
  var orientation, size, height, width;

  @override
  void initState() {
    super.initState();
  }

  TextEditingController fullname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _viewprofile = ref.watch(userDataProvider);
    final _viewatendence = ref.watch(attendenceDataProvider);
    orientation = MediaQuery.of(context).orientation;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return _viewprofile.when(
      data: (userDataProvider) {
        return _viewatendence.when(
          data: (_viewatendence) {
            if (userDataProvider[0].mname.toString().isEmpty) {
              fullname.text = userDataProvider[0].fname.toString() +
                  ' ' +
                  userDataProvider[0].lname!;
            } else {
              fullname.text = userDataProvider[0].fname.toString() +
                  ' ' +
                  userDataProvider[0].mname.toString() +
                  ' ' +
                  userDataProvider[0].lname!;
            }
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color(0xFF1C212D),
                  title: const Text(
                    'Attendence',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'shannon',
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  actions: <Widget>[
                    IconButton(
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const notificationPage()));
                      }),
                      icon: const Icon(Icons.notifications),
                    ),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 4,
                          child: Card(
                            //margin: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: MemoryImage(base64Decode(
                                      userDataProvider[0].photo.toString())),
                                  radius: 45,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Title(
                                      color: const Color(0xFF1C212D),
                                      child: Text(
                                        fullname.text,
                                        // fname.toString() +
                                        //     " " +
                                        //     mname.toString() +
                                        //     " " +
                                        //     lname.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Shannon'),
                                      )),
                                ),
                                Text(
                                  userDataProvider[0].designation.toString(),
                                  style: const TextStyle(fontFamily: 'Shannon'),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  userDataProvider[0].department.toString(),
                                  style: const TextStyle(fontFamily: 'Shannon'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.12,
                              height: MediaQuery.of(context).size.height / 10.0,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Title(
                                      color: const Color(0xFF1C212D),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Check-in',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Shannon'),
                                          ),
                                          const SizedBox(height: 7.0),
                                          Text(
                                            DateFormat.jm().format(
                                                _viewatendence[0].intime!),
                                            style: const TextStyle(
                                                fontFamily: 'Shannon'),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(width: 3.0),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.12,
                              height: MediaQuery.of(context).size.height / 10.0,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Title(
                                      color: const Color(0xFF1C212D),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Check-out',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Shannon'),
                                          ),
                                          const SizedBox(height: 8.0),
                                          Text(
                                            DateFormat.jm().format(
                                                _viewatendence[0].outtime!),
                                            style: const TextStyle(
                                                fontFamily: 'Shannon'),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Title(
                          color: const Color(0xFF1C212D),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'April attendence',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'shannon'),
                              ),
                              Text('Now')
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Card(
                              //margin: EdgeInsets.only(left: 15.0, top: 10.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                    height: MediaQuery.of(context).size.height /
                                        10.0,
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(255, 51, 119, 246),
                                        child: Text(
                                          '20',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontFamily: 'Shannon'),
                                        ),
                                        radius: 37,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Title(
                                        color: const Color(0xFF1C212D),
                                        child: const Text(
                                          'Total Days',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Shannon'),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(flex: 1),
                            Card(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                    height: MediaQuery.of(context).size.height /
                                        10.0,
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(255, 255, 246, 229),
                                        child: Text(
                                          '25',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 247, 167, 26),
                                              fontFamily: 'Shannon'),
                                        ),
                                        radius: 37,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Title(
                                        color: const Color(0xFF1C212D),
                                        child: const Text(
                                          'Present',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Shannon'),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(flex: 1),
                            Card(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                    height: MediaQuery.of(context).size.height /
                                        10.0,
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(255, 255, 238, 236),
                                        child: Text(
                                          '5',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 242, 110, 82),
                                              fontFamily: 'Shannon'),
                                        ),
                                        radius: 37,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Title(
                                      color: const Color(0xFF1C212D),
                                      child: const Text(
                                        'Absent',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Shannon'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        const SizedBox(height: 10.0),
                        Title(
                          color: const Color(0xFF1C212D),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'March attendence',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'shannon'),
                              ),
                              Text('Past')
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Card(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                    height: MediaQuery.of(context).size.height /
                                        10.0,
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(255, 51, 119, 246),
                                        child: Text(
                                          '20',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontFamily: 'Shannon'),
                                        ),
                                        radius: 37,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Title(
                                        color: const Color(0xFF1C212D),
                                        child: const Text(
                                          'Total Days',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Shannon'),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(flex: 1),
                            Card(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                    height: MediaQuery.of(context).size.height /
                                        10.0,
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(255, 255, 246, 229),
                                        child: Text(
                                          '25',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 247, 167, 26),
                                              fontFamily: 'Shannon'),
                                        ),
                                        radius: 37,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Title(
                                        color: const Color(0xFF1C212D),
                                        child: const Text(
                                          'Present',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Shannon'),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(flex: 1),
                            Card(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                    height: MediaQuery.of(context).size.height /
                                        10.0,
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(255, 255, 238, 236),
                                        child: Text(
                                          '5',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 242, 110, 82),
                                              fontFamily: 'Shannon'),
                                        ),
                                        radius: 37,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Title(
                                      color: const Color(0xFF1C212D),
                                      child: const Text(
                                        'Absent',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Shannon'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Title(
                          color: const Color(0xFF1C212D),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'February attendence',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'shannon'),
                              ),
                              Text('Past')
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 18.0),
                          child: Row(
                            children: [
                              Card(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          3.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10.0,
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          backgroundColor:
                                              Color.fromARGB(255, 51, 119, 246),
                                          child: Text(
                                            '20',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontFamily: 'Shannon'),
                                          ),
                                          radius: 37,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: const Text(
                                            'Total Days',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(flex: 1),
                              Card(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          3.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10.0,
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          backgroundColor: Color.fromARGB(
                                              255, 255, 246, 229),
                                          child: Text(
                                            '25',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 247, 167, 26),
                                                fontFamily: 'Shannon'),
                                          ),
                                          radius: 37,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: const Text(
                                            'Present',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(flex: 1),
                              Card(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          3.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10.0,
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          backgroundColor: Color.fromARGB(
                                              255, 255, 238, 236),
                                          child: Text(
                                            '5',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 242, 110, 82),
                                                fontFamily: 'Shannon'),
                                          ),
                                          radius: 37,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Title(
                                        color: const Color(0xFF1C212D),
                                        child: const Text(
                                          'Absent',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Shannon'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          error: (err, s) => Center(child: Text(err.toString())),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
      },
      error: (err, s) => Center(child: Text(err.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
