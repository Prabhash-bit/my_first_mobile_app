import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'notification.dart';

class LeaveApproval extends StatefulWidget {
  const LeaveApproval({Key? key}) : super(key: key);

  @override
  State<LeaveApproval> createState() => _LeaveApprovalState();
}

class _LeaveApprovalState extends State<LeaveApproval> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Shannon'),
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF1C212D),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false)),
          title: const Text(
            'Leave Approval',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'shannon',
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 100),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/profile.jpg'),
                            radius: 35,
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Prabhash Thakur'),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text('04/04/2022'),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text('IT'),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(flex: 1),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height /
                                        160.0),
                                child: Column(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             LeaveFormDetail()));
                                        },
                                        child: const Text('Detail')),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 255, 238, 236),
                                          ),
                                          child: Column(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  CoolAlert.show(
                                                    context: context,
                                                    type: CoolAlertType.error,
                                                    title: 'Rejected',
                                                    loopAnimation: false,
                                                  ).then((value) => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              HomeNavPage())));
                                                },
                                                child: const Icon(
                                                  Icons.close,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              const Text('Reject'),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 236, 248, 236),
                                          ),
                                          child: Column(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  CoolAlert.show(
                                                    context: context,
                                                    type: CoolAlertType.success,
                                                    title: 'Accepted',
                                                    loopAnimation: false,
                                                  ).then((value) => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              HomeNavPage())));
                                                },
                                                child: const Icon(
                                                  Icons.check,
                                                  color: Colors.green,
                                                ),
                                              ),
                                              const Text('Accept'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: const [
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 100),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/profile.jpg'),
                            radius: 35,
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Prabhash Thakur'),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text('04/04/2022'),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text('IT'),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(flex: 1),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height /
                                        160.0),
                                child: Column(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             LeaveFormDetail()));
                                        },
                                        child: const Text('Detail')),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 255, 238, 236),
                                            //borderRadius:
                                            // BorderRadius.circular(20.0)
                                          ),
                                          child: Column(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  CoolAlert.show(
                                                    context: context,
                                                    type: CoolAlertType.error,
                                                    title: 'Rejected',
                                                    //text: 'Rejected',
                                                    loopAnimation: false,
                                                  ).then((value) => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              HomeNavPage())));
                                                },
                                                child: const Icon(
                                                  Icons.close,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              const Text('Reject'),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 236, 248, 236),
                                          ),
                                          child: Column(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  CoolAlert.show(
                                                    context: context,
                                                    type: CoolAlertType.success,
                                                    title: 'Accepted',
                                                    loopAnimation: false,
                                                  ).then((value) => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              HomeNavPage())));
                                                },
                                                child: const Icon(
                                                  Icons.check,
                                                  color: Colors.green,
                                                ),
                                              ),
                                              const Text('Accept'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: const [
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
