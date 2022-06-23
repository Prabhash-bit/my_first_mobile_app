import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newapp/model/profile_data.dart';
import 'model/statecontroller.dart';
import 'notification.dart';

class profilePage extends ConsumerStatefulWidget {
  profilePage({Key? key}) : super(key: key);
  @override
  ConsumerState<profilePage> createState() => _profilePageState();
}

class _profilePageState extends ConsumerState<profilePage> {
  TextEditingController fullname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _viewModel = ref.watch(userDataProvider);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xFF1C212D),
            title: const Text(
              'Profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'shannon',
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),

            // actions: [
            //   IconButton(
            //       icon: const Icon(Icons.lightbulb),
            //       onPressed: () {
            //         Get.isDarkMode
            //             ? Get.changeTheme(ThemeData.light())
            //             : Get.changeTheme(ThemeData.dark());
            //       })
            // ],
            actions: <Widget>[
              IconButton(
                onPressed: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const notificationPage()));
                }),
                icon: const Icon(Icons.notifications),
              ),
            ],
          ),
          body: _viewModel.when(
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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: Column(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8.0, left: 10.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: MemoryImage(base64Decode(
                                      userDataProvider[0].photo.toString())),
                                  radius: 45,
                                ),
                                const SizedBox(width: 20),
                                Title(
                                    color: const Color(0xFF1C212D),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          fullname.text,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Shannon'),
                                        ),
                                        Text(
                                          userDataProvider[0]
                                              .designation
                                              .toString(),
                                          style: const TextStyle(
                                              fontFamily: 'Shannon'),
                                        ),
                                        Text(
                                          userDataProvider[0]
                                              .department
                                              .toString(),
                                          style: const TextStyle(
                                              fontFamily: 'Shannon'),
                                        ),
                                      ],
                                    )),
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
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: const Text(
                                            'Joining Date',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Title(
                                        color: const Color(0xFF1C212D),
                                        child: Text(
                                          userDataProvider[0]
                                                  .dateOfJoinBs!
                                                  .year
                                                  .toString() +
                                              "-" +
                                              userDataProvider[0]
                                                  .dateOfJoinBs!
                                                  .month
                                                  .toString() +
                                              "-" +
                                              userDataProvider[0]
                                                  .dateOfJoinBs!
                                                  .day
                                                  .toString(),
                                          style: const TextStyle(
                                              fontFamily: 'Shannon'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 3.0),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.12,
                              height: MediaQuery.of(context).size.height / 10.0,
                              child: Card(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: const Text(
                                            'Employee ID',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: Text(
                                            userDataProvider[0]
                                                .empId
                                                .toString(),
                                            style: const TextStyle(
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 14.0,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: const Text(
                                            'Date of Birth:',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0,
                                          left: 60.0,
                                          bottom: 8.0,
                                          right: 10.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: Text(
                                            userDataProvider[0]
                                                    .dobBs!
                                                    .year
                                                    .toString() +
                                                "-" +
                                                userDataProvider[0]
                                                    .dobBs!
                                                    .month
                                                    .toString() +
                                                "-" +
                                                userDataProvider[0]
                                                    .dobBs!
                                                    .day
                                                    .toString(),
                                            style: const TextStyle(
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 14.0,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: const Text(
                                            'Gender',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0,
                                          left: 60.0,
                                          bottom: 8.0,
                                          right: 10.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: Text(
                                            userDataProvider[0]
                                                .gender
                                                .toString(),
                                            style: const TextStyle(
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 14.0,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: const Text(
                                            'Maritial Status',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0,
                                          left: 60.0,
                                          bottom: 8.0,
                                          right: 10.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: Text(
                                            userDataProvider[0]
                                                .maritialStatus
                                                .toString(),
                                            style: const TextStyle(
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 14.0,
                          child: Card(
                            //margin: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: const Text(
                                            'Qualification',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8.0, right: 10.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: Text(
                                            userDataProvider[0]
                                                .level
                                                .toString(),
                                            style: const TextStyle(
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 14.0,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: const Text(
                                            'Station',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8.0, right: 10.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: Text(
                                            userDataProvider[0]
                                                .station
                                                .toString(),
                                            style: const TextStyle(
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 14.0,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: const Text(
                                            'Probation Period',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8.0, right: 10.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: Text(
                                            userDataProvider[0]
                                                    .probationEndDateBs!
                                                    .year
                                                    .toString() +
                                                "-" +
                                                userDataProvider[0]
                                                    .probationEndDateBs!
                                                    .month
                                                    .toString() +
                                                "-" +
                                                userDataProvider[0]
                                                    .probationEndDateBs!
                                                    .day
                                                    .toString(),
                                            style: const TextStyle(
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 14.0,
                          child: Card(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: const Text(
                                            'Email',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8.0, right: 10.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: Text(
                                            userDataProvider[0]
                                                .personalEmail
                                                .toString(),
                                            style: const TextStyle(
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 3.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 14.0,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: const Text(
                                            'Contact Number',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8.0, right: 10.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: Text(
                                            userDataProvider[0]
                                                .phone
                                                .toString(),
                                            style: const TextStyle(
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 14.0,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: const Text(
                                            'Age',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8.0, right: 10.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: Text(
                                            userDataProvider[0].age.toString(),
                                            style: const TextStyle(
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 14.0,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: const Text(
                                            'Blood group',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8.0, right: 10.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: Text(
                                            userDataProvider[0]
                                                .bloodGroup
                                                .toString(),
                                            style: const TextStyle(
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 14.0,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: const Text(
                                            'Craft',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8.0, right: 10.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: Text(
                                            userDataProvider[0]
                                                .craft
                                                .toString(),
                                            style: const TextStyle(
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 14.0,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: const Text(
                                            'SSF',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8.0, right: 10.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: Text(
                                            userDataProvider[0].ssf.toString(),
                                            style: const TextStyle(
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 14.0,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: const Text(
                                            'PAN',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8.0, right: 10.0),
                                      child: Title(
                                          color: const Color(0xFF1C212D),
                                          child: Text(
                                            userDataProvider[0].pan.toString(),
                                            style: const TextStyle(
                                                fontFamily: 'Shannon'),
                                          )),
                                    ),
                                  ],
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
            //       } else if (snapshot.hasError) {
            //         return const Scaffold(
            //           body: NoInternet(),
            //         );
            //         //Text('${snapshot.error}');
            //       }
            //       return const CircularProgressIndicator();
            //     },
            //   ),
          )),
    );
  }
}
