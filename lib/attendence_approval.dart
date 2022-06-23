import 'package:flutter/material.dart';
import 'notification.dart';

class AttendenceApproval extends StatefulWidget {
  const AttendenceApproval({Key? key}) : super(key: key);

  @override
  State<AttendenceApproval> createState() => _AttendenceApprovalState();
}

class _AttendenceApprovalState extends State<AttendenceApproval> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Shannon'),
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: const Color(0xFF1C212D),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false)),
          title: const Text(
            'Attentence Approval',
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
                Card(
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                        radius: 35,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Prabhash Thakur'),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text('02/02/2022'),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text('IT'),
                        ],
                      ),
                      const Spacer(flex: 1),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 255, 238, 236),
                                ),
                                child: Column(
                                  children: [
                                    TextButton(
                                      onPressed: () {},
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
                                  color: Color.fromARGB(255, 236, 248, 236),
                                ),
                                child: Column(
                                  children: [
                                    TextButton(
                                      onPressed: () {},
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
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                        radius: 35,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Prabhash Thakur',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text('02/02/2022'),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text('IT'),
                        ],
                      ),
                      const Spacer(flex: 1),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 255, 238, 236),
                                ),
                                child: Column(
                                  children: [
                                    TextButton(
                                      onPressed: () {},
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
                                  color: Color.fromARGB(255, 236, 248, 236),
                                ),
                                child: Column(
                                  children: [
                                    TextButton(
                                      onPressed: () {},
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
  }
}
