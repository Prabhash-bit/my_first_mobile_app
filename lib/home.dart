import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newapp/loginAuth.dart';
import 'package:newapp/logincard.dart';
import 'package:newapp/model/statecontroller.dart';
import 'package:newapp/profile.dart';
import 'package:newapp/travel_request.dart';
import 'Homepage.dart';
import 'attendence_approval.dart';
import 'detailsleave.dart';
import 'leave_approval.dart';
import 'leaveform.dart';
import 'mannual_attendence_form.dart';
import 'performance_appraisal_review.dart';
import 'probation_review.dart';
import 'settingpage.dart';
import 'themecolors.dart';
import 'todayattendence.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeNavPage extends ConsumerStatefulWidget {
  const HomeNavPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<HomeNavPage> createState() => _HomeNavPageState();
}

class _HomeNavPageState extends ConsumerState<HomeNavPage> {
  int tabselected = 0;
  void onTabTapped(int index) {
    setState(() {
      tabselected = index;
    });
  }

  Future<bool> _back() async {
    //Future.delayed(Duration(seconds: 0)(){});
    bool goBack = false;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          darkTheme: ThemeClass.darkTheme,
          home: AlertDialog(
            content: const Text('Are you sure'),
            actions: [
              TextButton(
                onPressed: () {
                  goBack = false;
                  Navigator.of(context).pop();
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  goBack = true;
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginAuthPage()));
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        );
      },
    );
    return goBack;
  }

  final _pageOptions = [
    HomePage(),
    TodayAttendence(),
    DetailsLeave(),
    profilePage(),
  ];
  TextEditingController fullname = TextEditingController();
  void temp(context) {
    final _viewprofilee = ref.watch(userDataProvider);
    showModalBottomSheet(
        //isScrollControlled: false,
        context: context,
        builder: (BuildContext bc) {
          return _viewprofilee.when(
            data: (userDataProvider) {
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
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode: ThemeMode.system,
                //theme: ThemeClass.lightTheme,
                darkTheme: ThemeClass.darkTheme,
                home: Scaffold(
                  body: SizedBox(
                    //color: Colors.white,
                    //height: 900,
                    width: 400,
                    child: Column(
                      children: [
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 310.0),
                            child: SizedBox(
                              height: 30,
                              width: 40,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: Color(0xFF1C212D),
                                  size: 20.0,
                                ),
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: MemoryImage(base64Decode(
                                    userDataProvider[0].photo.toString())),
                                radius: 45,
                              ),
                              const SizedBox(width: 30.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Title(
                                    color: const Color(0xFF1C212D),
                                    child: Text(
                                      fullname.text,
                                      style: const TextStyle(
                                          fontFamily: 'Shannon',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 2.0),
                                  Title(
                                    color: const Color(0xFF1C212D),
                                    child: Text(
                                      userDataProvider[0]
                                          .designation
                                          .toString(),
                                      style: const TextStyle(
                                        fontFamily: 'Shannon',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 2.0),
                                  Title(
                                    color: const Color(0xFF1C212D),
                                    child: Text(
                                      userDataProvider[0].department.toString(),
                                      style: const TextStyle(
                                        fontFamily: 'Shannon',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          height: 280,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ListTile(
                                  title: const Text(
                                    'Leave request',
                                    style: TextStyle(fontFamily: 'Shannon'),
                                  ),
                                  leading: FaIcon(
                                    FontAwesomeIcons.personWalking,
                                    color: Color.fromARGB(255, 119, 145, 182),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LeaveForm()));
                                  },
                                ),
                                ListTile(
                                  title: const Text(
                                    'Leave approval',
                                    style: TextStyle(fontFamily: 'Shannon'),
                                  ),
                                  leading: const FaIcon(
                                    FontAwesomeIcons.personCircleCheck,
                                    color: Color.fromARGB(255, 119, 145, 182),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LeaveApproval()));
                                  },
                                ),
                                ListTile(
                                  title: const Text(
                                    'Travel request',
                                    style: TextStyle(fontFamily: 'Shannon'),
                                  ),
                                  leading: const FaIcon(
                                    FontAwesomeIcons.mapLocationDot,
                                    color: Color.fromARGB(255, 119, 145, 182),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TravelForm()));
                                  },
                                ),
                                ListTile(
                                  title: const Text(
                                    'Mannual attendence',
                                    style: TextStyle(fontFamily: 'Shannon'),
                                  ),
                                  leading: const FaIcon(
                                    FontAwesomeIcons.listCheck,
                                    color: Color.fromARGB(255, 119, 145, 182),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AttendenceForm()));
                                  },
                                ),
                                ListTile(
                                  title: const Text(
                                    'Attendence approval',
                                    style: TextStyle(fontFamily: 'Shannon'),
                                  ),
                                  leading: const FaIcon(
                                    FontAwesomeIcons.clipboardCheck,
                                    color: Color.fromARGB(255, 119, 145, 182),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AttendenceApproval()));
                                  },
                                ),
                                const ListTile(
                                    title: Text(
                                      'Report',
                                      style: TextStyle(fontFamily: 'Shannon'),
                                    ),
                                    leading: FaIcon(
                                      FontAwesomeIcons.bookAtlas,
                                      color: Color.fromARGB(255, 119, 145, 182),
                                    )),
                                const Divider(),
                                ListTile(
                                  title: const Text(
                                    'Performance Appraisal',
                                    style: TextStyle(fontFamily: 'Shannon'),
                                  ),
                                  leading: const FaIcon(
                                    FontAwesomeIcons.award,
                                    color: Color.fromARGB(255, 119, 145, 182),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const performanceAppraisal()));
                                  },
                                ),
                                ListTile(
                                  title: const Text(
                                    'Probation Review',
                                    style: TextStyle(fontFamily: 'Shannon'),
                                  ),
                                  leading: const FaIcon(
                                    FontAwesomeIcons.clock,
                                    color: Color.fromARGB(255, 119, 145, 182),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const probationReview()));
                                  },
                                ),
                                const Divider(),
                                ListTile(
                                  title: const Text(
                                    'Setting',
                                    style: TextStyle(fontFamily: 'Shannon'),
                                  ),
                                  leading: const Icon(
                                    Icons.settings,
                                    color: Color.fromARGB(255, 119, 145, 182),
                                  ),
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             SphereOfDestiny()));
                                  },
                                ),
                                ListTile(
                                  title: const Text(
                                    'Log-out',
                                    style: TextStyle(fontFamily: 'Shannon'),
                                  ),
                                  leading: const Icon(
                                    Icons.logout_outlined,
                                    color: Color.fromARGB(255, 119, 145, 182),
                                  ),
                                  onTap: () async {
                                    Future.delayed(Duration(seconds: 1), () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const loginCard()));
                                    });
                                  },
                                ),
                              ],
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
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.refresh(userDataProvider);
    ref.refresh(leaveDataProvider);
    ref.refresh(attendenceDataProvider);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Future.delayed(Duration(seconds: 0), () {
          _back();
        });
        return false;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        //theme: ThemeClass.lightTheme,
        darkTheme: ThemeClass.darkTheme,
        home: Scaffold(
          // extendBody: true,
          // backgroundColor: const Color.fromARGB(255, 250, 249, 255),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromRGBO(255, 216, 49, 1),
            //splashColor: Colors.red,
            tooltip: 'Menu',
            onPressed: () {
              temp(context);
            },
            child: const Icon(Icons.menu),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: _pageOptions[tabselected],
          bottomNavigationBar: BottomAppBar(
            //color: Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 5,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 65,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      children: [
                        IconButton(
                          iconSize: 30,
                          icon: Icon(
                            Icons.home,
                            color: tabselected == 0
                                ? const Color.fromRGBO(255, 216, 49, 1)
                                : const Color(0xFF1C212D),
                          ),
                          onPressed: () {
                            onTabTapped(0);
                          },
                        ),
                        const Text(
                          'Home',
                          style: TextStyle(
                            fontFamily: 'Shannon',
                            fontWeight: FontWeight.bold,
                            //color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 65,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.check_box,
                            color: tabselected == 1
                                ? const Color.fromRGBO(255, 216, 49, 1)
                                : const Color(0xFF1C212D),
                          ),
                          onPressed: () {
                            onTabTapped(1);
                          },
                        ),
                        const Text(
                          'Attendence',
                          style: TextStyle(
                            fontFamily: 'Shannon',
                            fontWeight: FontWeight.bold,
                            //color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 65,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.time_to_leave,
                            color: tabselected == 2
                                ? const Color.fromRGBO(255, 216, 49, 1)
                                : const Color(0xFF1C212D),
                          ),
                          onPressed: () {
                            onTabTapped(2);
                          },
                        ),
                        const Text(
                          'Leave',
                          style: TextStyle(
                            fontFamily: 'Shannon',
                            fontWeight: FontWeight.bold,
                            //color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 65,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.people,
                            color: tabselected == 3
                                ? const Color.fromRGBO(255, 216, 49, 1)
                                : const Color(0xFF1C212D),
                          ),
                          onPressed: () {
                            onTabTapped(3);
                          },
                        ),
                        const Text(
                          'Profile',
                          style: TextStyle(
                            fontFamily: 'Shannon',
                            fontWeight: FontWeight.bold,
                            // color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // );
  }
}
