import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newapp/probationform.dart';

import 'notification.dart';

class probationReview extends StatefulWidget {
  const probationReview({Key? key}) : super(key: key);

  @override
  State<probationReview> createState() => _probationReviewState();
}

class _probationReviewState extends State<probationReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFF1C212D),
          title: const Text(
            'Probation Period',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Shannon',
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Card(
                  elevation: 5.0,
                  child: Container(
                    color: const Color.fromARGB(255, 221, 238, 243),
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Probation Review'),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            children: [
                              const Icon(Icons.check_circle_outline_rounded),
                              const SizedBox(width: 5.0),
                              const Text('Completed'),
                              const Spacer(flex: 1),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ProbationForm()));
                                  },
                                  child: const Text('View')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const FaIcon(FontAwesomeIcons.anglesDown),
                Card(
                  elevation: 5.0,
                  child: Container(
                    color: const Color.fromARGB(255, 221, 238, 243),
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Supervisor/HOD Review'),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            children: [
                              const Icon(Icons.check_circle_outline_rounded),
                              const SizedBox(width: 5.0),
                              const Text('Completed'),
                              const Spacer(flex: 1),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ProbationForm()));
                                  },
                                  child: const Text('View')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const FaIcon(FontAwesomeIcons.anglesDown),
                Card(
                  elevation: 5.0,
                  child: Container(
                    color: const Color.fromARGB(255, 221, 238, 243),
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('HR Review'),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            children: [
                              const Icon(Icons.check_circle_outline_rounded),
                              const SizedBox(width: 5.0),
                              const Text('Completed'),
                              const Spacer(flex: 1),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ProbationForm()));
                                  },
                                  child: const Text('View')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const FaIcon(FontAwesomeIcons.anglesDown),
                Card(
                  elevation: 5.0,
                  child: Container(
                    color: const Color.fromARGB(255, 221, 238, 243),
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('HR Review'),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            children: [
                              const Icon(Icons.check_circle_outline_rounded),
                              const SizedBox(width: 5.0),
                              const Text('Completed'),
                              const Spacer(flex: 1),
                              ElevatedButton(
                                  onPressed: () {}, child: const Text('Print')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Divider(),
                const SizedBox(
                  height: 20.0,
                ),
                Card(
                  elevation: 5.0,
                  child: Container(
                    color: const Color.fromARGB(255, 221, 238, 243),
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Self Review'),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            children: [
                              const Icon(Icons.check_circle_outline_rounded),
                              const SizedBox(width: 5.0),
                              const Text('Completed'),
                              const Spacer(flex: 1),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ProbationForm()));
                                  },
                                  child: const Text('View')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const FaIcon(FontAwesomeIcons.anglesDown),
                Card(
                  elevation: 5.0,
                  child: Container(
                    color: const Color.fromARGB(255, 221, 238, 243),
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Supervisor/HOD Review'),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            children: [
                              const FaIcon(FontAwesomeIcons.arrowsRotate),
                              const SizedBox(width: 5.0),
                              const Text('In-progress'),
                              const Spacer(flex: 1),
                              ElevatedButton(
                                  onPressed: () {}, child: const Text('View')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const FaIcon(FontAwesomeIcons.anglesDown),
                Card(
                  elevation: 5.0,
                  child: Container(
                    color: const Color.fromARGB(255, 221, 238, 243),
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('HR Review'),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            children: [
                              const FaIcon(FontAwesomeIcons.xmark),
                              const SizedBox(width: 5.0),
                              const Text('Not yet reviewed'),
                              const Spacer(flex: 1),
                              ElevatedButton(
                                  onPressed: () {}, child: const Text('View')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const FaIcon(FontAwesomeIcons.anglesDown),
                Card(
                  elevation: 5.0,
                  child: Container(
                    color: const Color.fromARGB(255, 221, 238, 243),
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(''),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            children: [
                              const FaIcon(FontAwesomeIcons.xmark),
                              const SizedBox(width: 5.0),
                              const Text('Incomplete'),
                              const Spacer(flex: 1),
                              ElevatedButton(
                                  onPressed: () {}, child: const Text('Print')),
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
        ));
  }
}
