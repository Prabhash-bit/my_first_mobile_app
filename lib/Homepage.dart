import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'detailattendence.dart';
import 'detailsleave.dart';
import 'detailtravel.dart';
import 'holiday_list.dart';
import 'model/statecontroller.dart';
import 'notification.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  String errorr = 'oh no!';

  @override
  void initState() {
    data = [
      _ChartData('Sun', 8),
      _ChartData('Mon', 8),
      _ChartData('Tue', 8),
      _ChartData('Wed', 6.4),
      _ChartData('Thu', 8),
      _ChartData('Fri', 8),
      _ChartData('Sat', 0)
    ];
    _tooltip =
        TooltipBehavior(enable: true, tooltipPosition: TooltipPosition.pointer);

    super.initState();
  }

  TextEditingController fullname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _viewprofile = ref.watch(userDataProvider);
    final _viewleave = ref.watch(leaveDataProvider);
    final _viewattendence = ref.watch(attendenceDataProvider);

    return _viewprofile.when(
      data: (userDataProvider) {
        return _viewleave.when(
          data: (leaveDataProvider) {
            return _viewattendence.when(
              data: (attendenceDataProvider) {
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
                      automaticallyImplyLeading: false,
                      backgroundColor: const Color(0xFF1C212D),
                      title: const Text(
                        'Home',
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
                    body: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              //color: Colors.white,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color(0xFFDCECFA),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    // child: Title(
                                    //color: const Color(0xFF1C212D),
                                    child: Text(
                                      "Hello, " + fullname.text,
                                      style: const TextStyle(
                                          //color: Colors.white,
                                          fontSize: 13,
                                          fontFamily: 'Shannon',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    // ),
                                  ),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.circle,
                                              color: Colors.green,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  20.0,
                                            ),
                                            const SizedBox(width: 2.0),
                                            Text(
                                              DateFormat?.jm().format(
                                                  attendenceDataProvider[0]
                                                      .intime!),
                                              style: const TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 2.0),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            color: Colors.red,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                20.0,
                                          ),
                                          const SizedBox(width: 2.0),
                                          Text(
                                            DateFormat?.jm().format(
                                                attendenceDataProvider[0]
                                                    .outtime!),
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 15.0,
                              ),
                              child: Column(
                                children: [
                                  Title(
                                    color: const Color(0xFF1C212D),
                                    child: Text(
                                      attendenceDataProvider[0]
                                          .workingHr
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Title(
                                      color: const Color(0xFF1C212D),
                                      child: const Text('Today')),
                                  SizedBox(
                                    height: 175,
                                    child: SfCartesianChart(
                                        plotAreaBorderWidth: 0,
                                        primaryXAxis: CategoryAxis(
                                          majorTickLines:
                                              const MajorTickLines(width: 0),
                                          majorGridLines:
                                              const MajorGridLines(width: 0),
                                          axisLine: const AxisLine(width: 0),
                                        ),
                                        primaryYAxis: NumericAxis(
                                          minimum: 0,
                                          maximum: 10,
                                          interval: 3,
                                          majorTickLines:
                                              const MajorTickLines(width: 0),
                                          majorGridLines:
                                              const MajorGridLines(width: 0.2),
                                          axisLine: const AxisLine(width: 0),
                                        ),
                                        tooltipBehavior: _tooltip,
                                        series: <
                                            ChartSeries<_ChartData, String>>[
                                          ColumnSeries<_ChartData, String>(
                                              enableTooltip: true,
                                              dataSource: data,
                                              xValueMapper:
                                                  (_ChartData data, _) =>
                                                      data.x,
                                              yValueMapper:
                                                  (_ChartData data, _) =>
                                                      data.y,
                                              name: 'Duration',
                                              width: 0.5,
                                              color: const Color(0xFFDCECFA),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(15))),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    detailAttendence()));
                                      },
                                      child: Card(
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              width: 100.0,
                                              height: 80,
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.green,
                                                  child: Icon(
                                                    Icons
                                                        .mark_chat_read_outlined,
                                                    color: Colors.white,
                                                    size: 40,
                                                  ),
                                                  radius: 37,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Title(
                                                color: const Color(0xFF1C212D),
                                                child: const Text(
                                                  'Attendence',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Shannon'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        //print(abc);
                                        //abc = images.text;
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsLeave()));
                                      },
                                      child: Card(
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              width: 100.0,
                                              height: 80,
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.red,
                                                  child: Icon(
                                                    Icons.home_outlined,
                                                    color: Colors.white,
                                                    size: 40,
                                                  ),
                                                  radius: 37,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Title(
                                                  color:
                                                      const Color(0xFF1C212D),
                                                  child: const Text(
                                                    'Leave',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Shannon'),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const DetailTravel()));
                                      },
                                      child: Card(
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              width: 100.0,
                                              height: 80,
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.orange,
                                                  child: Icon(
                                                    Icons
                                                        .travel_explore_outlined,
                                                    color: Colors.white,
                                                    size: 40,
                                                  ),
                                                  radius: 37,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Title(
                                                  color:
                                                      const Color(0xFF1C212D),
                                                  child: const Text(
                                                    'Travel',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Shannon'),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Card(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: const [
                                                SizedBox(
                                                  width: 100.0,
                                                  height: 80,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.blueAccent,
                                                      child: Icon(
                                                        Icons
                                                            .mark_email_read_outlined,
                                                        color: Colors.white,
                                                        size: 40,
                                                      ),
                                                      radius: 37,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Title(
                                                  color:
                                                      const Color(0xFF1C212D),
                                                  child: const Text(
                                                    'Waiting Icon',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Shannon'),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ...leaveDataProvider.map(
                              (e) => SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height / 7.0,
                                child: Card(
                                  child: Row(
                                    children: [
                                      ...userDataProvider.map(
                                        (f) => Padding(
                                          padding: EdgeInsets.all(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  37.0),
                                          child: CircleAvatar(
                                            backgroundImage: MemoryImage(
                                                base64Decode(
                                                    f.photo.toString())),
                                            radius: 37,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                40.0,
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                75.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Title(
                                                color: const Color(0xFF1C212D),
                                                child: Text(
                                                  fullname.text,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            const SizedBox(height: 5.0),
                                            Title(
                                              color: const Color(0xFF1C212D),
                                              child: Text(DateFormat.yMd()
                                                  .format(
                                                      e.dateOfApplication!)),
                                            ),
                                            const SizedBox(height: 3.0),
                                            Title(
                                              color: const Color(0xFF1C212D),
                                              child: Text(
                                                  e.totalLeaveDays.toString()),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 1,
                                      ),
                                      Column(
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              // print('Pending pressed');
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Container(
                                                child: const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 4.0,
                                                      right: 4.0,
                                                      top: 5.0,
                                                      bottom: 5.0),
                                                  child: Text(
                                                    'Pending',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 231, 190, 104),
                                                        fontSize: 15.0,
                                                        fontFamily: 'Shannon'),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  gradient:
                                                      const LinearGradient(
                                                          colors: [
                                                        Color.fromARGB(
                                                            255, 254, 245, 228),
                                                        Color.fromARGB(
                                                            255, 254, 245, 228),
                                                      ]),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 1.0),
                                          TextButton(
                                              onPressed: () {
                                                //print('Cancel pressed');
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5.0),
                                                child: Container(
                                                  child: const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10.0,
                                                        top: 5.0,
                                                        bottom: 5.0,
                                                        right: 10.0),
                                                    child: Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 247, 55, 8),
                                                          fontSize: 15.0,
                                                          fontFamily:
                                                              'Shannon'),
                                                    ),
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    gradient:
                                                        const LinearGradient(
                                                            colors: [
                                                          Color.fromARGB(255,
                                                              255, 238, 236),
                                                          Color.fromARGB(255,
                                                              255, 238, 236),
                                                        ]),
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              color: const Color.fromARGB(255, 97, 180, 248),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height / 5.0,
                                child: Stack(children: <Widget>[
                                  const Positioned(
                                    top: 10.0,
                                    left: 115.0,
                                    child: Icon(
                                      Icons.info_outline_rounded,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                  ),
                                  const Positioned(
                                    top: 15.0,
                                    left: 150.0,
                                    child: Text(
                                      'Info!',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Positioned(
                                    left: 15.0,
                                    top: 50.0,
                                    child: SizedBox(
                                      width: 320,
                                      height: 100.0,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text:
                                                    'Hello! The notice is to inform you all that................'),
                                            TextSpan(
                                                text: 'Click me',
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () async {
                                                        launchUrl(
                                                            Uri(
                                                                scheme: 'https',
                                                                host:
                                                                    'google.com',
                                                                //path:
                                                                //'guides/libraries/library-tour',
                                                                fragment:
                                                                    'numbers'),
                                                            mode: LaunchMode
                                                                .platformDefault);
                                                      })
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    //top: 1.0,
                                    right: 5.0,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          const Color.fromRGBO(255, 216, 49, 1),
                                        ),
                                      ),
                                      child: const Text(
                                        'Holiday',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Shannon',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const HolidayList()));
                                      },
                                    ),
                                  )
                                ]),
                              ),
                              //   ],
                              // ),
                            ),
                            const SizedBox(height: 5.0),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 18.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Card(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.4,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10.0,
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: CircleAvatar(
                                              backgroundColor: Color.fromARGB(
                                                  255, 51, 119, 246),
                                              child: Text(
                                                '35',
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
                                                'Presents',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Shannon'),
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                  Card(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.4,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10.0,
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: CircleAvatar(
                                              backgroundColor: Color.fromARGB(
                                                  255, 248, 231, 200),
                                              child: Text(
                                                '45',
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
                                                'Late',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Shannon'),
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                  Card(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10.0,
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: CircleAvatar(
                                              backgroundColor: Color.fromARGB(
                                                  255, 255, 238, 236),
                                              child: Text(
                                                '55',
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
                                              )),
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
                //);
              },
              error: (err, s) => Center(child: Text(err.toString())),
              loading: () => const Center(child: CircularProgressIndicator()),
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

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
