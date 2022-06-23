import 'package:flutter/material.dart';
import 'notification.dart';

class LeaveList extends StatefulWidget {
  @override
  State<LeaveList> createState() => _LeaveListState();
}

class _LeaveListState extends State<LeaveList> {
  Future<bool> _back() async {
    bool goBack = false;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('Are you sure'),
          actions: [
            TextButton(
              onPressed: () {
                goBack = false;
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                goBack = true;
                Navigator.pop(context);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
    return goBack;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C212D),
        title: const Text(
          'Leave List',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'shannon', fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const notificationPage()));
            }),
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.0,
              child: Card(
                child: Column(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                      radius: 45,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Title(
                          color: const Color(0xFF1C212D),
                          child: const Text(
                            'Prabhash Thakur',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Shannon'),
                          )),
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
                  height: MediaQuery.of(context).size.height / 8.0,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Title(
                              color: const Color(0xFF1C212D),
                              child: const Text(
                                'Check-in',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Shannon'),
                              )),
                          const Text('8:30 AM'),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.12,
                  height: MediaQuery.of(context).size.height / 8.0,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Title(
                            color: const Color(0xFF1C212D),
                            child: const Text(
                              'Check-out',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Shannon'),
                            ),
                          ),
                          const Text('5:30 PM')
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Title(
              color: const Color(0xFF1C212D),
              child: const Text(
                'Attendence of months',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'shannon'),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Card(
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3.5,
                        height: MediaQuery.of(context).size.height / 10.0,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 255, 238, 236),
                            child: Text(
                              '20',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(235, 116, 90, 1),
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
                              'Total Leave',
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
                        width: MediaQuery.of(context).size.width / 3.5,
                        height: MediaQuery.of(context).size.height / 10.0,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 255, 246, 229),
                            child: Text(
                              '25',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 83, 62, 62),
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
                        width: MediaQuery.of(context).size.width / 3.5,
                        height: MediaQuery.of(context).size.height / 10.0,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 231, 238, 254),
                            child: Text(
                              '5',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(132, 10, 65, 47),
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
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
