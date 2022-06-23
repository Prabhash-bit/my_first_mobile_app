import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newapp/model/statecontroller.dart';
import 'package:intl/intl.dart';

class detailAttendence extends ConsumerStatefulWidget {
  const detailAttendence({Key? key}) : super(key: key);
  @override
  ConsumerState createState() => _detailAttendenceState();
}

class _detailAttendenceState extends ConsumerState<detailAttendence>
    with SingleTickerProviderStateMixin<detailAttendence> {
  late TabController _tabController;
  TextEditingController dobs = TextEditingController();

  String _months = 'Jestha';
  String _years = '1999';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _viewattendence = ref.watch(attendenceDataProvider);
    final _viewprofile = ref.watch(userDataProvider);
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            //backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: const Color(0xFF1C212D),
              title: const Text(
                'Attendence',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            body: _viewattendence.when(
              data: (attendenceDataProvider) {
                return _viewprofile.when(
                  data: (userDataProvider) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                // Text(
                                //   'Attendence',
                                //   style: TextStyle(
                                //       fontFamily: 'Shannon',
                                //       fontSize: 20.0,
                                //       fontWeight: FontWeight.bold),
                                // ),
                                // Spacer(
                                //   flex: 1,
                                // ),
                                Container(
                                  //color: Colors.white,
                                  width:
                                      MediaQuery.of(context).size.width / 3.0,
                                  height:
                                      MediaQuery.of(context).size.height / 10.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Material(
                                      //elevation: 1,
                                      //shadowColor: Colors.white12,
                                      child: DropdownButtonFormField<String>(
                                        elevation: 0,

                                        value: _years,
                                        decoration: const InputDecoration(
                                          //labelText: 'Months',
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  //color: Color.fromARGB(
                                                  //255, 225, 230, 226),
                                                  width: 1.0)
                                              //borderRadius: BorderRadius.circular(20.0),
                                              ),
                                        ),
                                        //hint: Text('Types of leave'),
                                        items: <String>[
                                          '1999',
                                          '2000',
                                          '2001',
                                          '2002',
                                          '2003',
                                          '2004',
                                          '2005',
                                        ].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (String? monthsofyear) {
                                          setState(() {
                                            _years = monthsofyear!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                //Spacer(flex: 1),
                                Container(
                                  //color: Colors.white,
                                  width:
                                      MediaQuery.of(context).size.width / 2.0,
                                  height:
                                      MediaQuery.of(context).size.height / 10.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Material(
                                      // elevation: 1,
                                      //shadowColor: Colors.white12,
                                      child: DropdownButtonFormField<String>(
                                        elevation: 0,
                                        value: _months,
                                        decoration: const InputDecoration(
                                          //labelText: 'Months',
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  //color: Color.fromARGB(
                                                  //255, 225, 230, 226),
                                                  //width: 1.0,
                                                  )
                                              //borderRadius: BorderRadius.circular(20.0),
                                              ),
                                        ),
                                        //hint: Text('Types of leave'),
                                        items: <String>[
                                          'Baishakh',
                                          'Jestha',
                                          'Ashadh',
                                          'Shrawan',
                                          'Bhadra',
                                          'Ashwin',
                                          'Kartik',
                                        ].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (String? monthsofyear) {
                                          setState(() {
                                            _months = monthsofyear!;
                                          });
                                        },
                                      ),
                                    ),
                                    //TextField(
                                    //   controller: dobs,
                                    //   keyboardType: TextInputType.datetime,
                                    //   decoration: InputDecoration(
                                    //     border: InputBorder.none,
                                    //     //isDense: true,
                                    //     //labelText: 'Select Date',
                                    //     hintText: 'Select date',
                                    //     suffixIcon: Icon(Icons.calendar_today),
                                    //   ),
                                    //   readOnly:
                                    //       true, //set it true, so that user will not able to edit text
                                    //   onTap: () async {
                                    //     var date = await showMonthPicker(
                                    //         context: context,
                                    //         initialDate: _selected ?? DateTime.now(),
                                    //         firstDate: DateTime(1932),
                                    //         lastDate: DateTime(2040));

                                    //     dobs.text = date.toString().substring(0, 10);
                                    //   },
                                    // ),
                                  ),
                                ),
                              ],
                            ),
                            TabBar(
                              controller: _tabController,
                              automaticIndicatorColorAdjustment: true,
                              //indicatorColor: Colors.white,
                              indicatorSize: TabBarIndicatorSize.label,
                              unselectedLabelColor: const Color(0xFF1C212D),
                              tabs: [
                                Tab(
                                  height:
                                      MediaQuery.of(context).size.height / 6.60,
                                  child: Container(
                                    color: _tabController.index == 0
                                        ? const Color.fromARGB(
                                            255, 27, 103, 246)
                                        : const Color.fromARGB(
                                            0, 241, 238, 238),
                                    margin: const EdgeInsets.only(top: 1.0),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          width: 88,
                                          height: 80,
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 8.0),
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
                                ),
                                Tab(
                                  height:
                                      MediaQuery.of(context).size.height / 6.60,
                                  child: Container(
                                    color: _tabController.index == 1
                                        ? const Color.fromARGB(255, 255, 161, 1)
                                        : const Color.fromARGB(
                                            0, 241, 238, 238),
                                    margin: const EdgeInsets.only(top: 1.0),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          width: 88,
                                          height: 80,
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 8.0),
                                            child: CircleAvatar(
                                              backgroundColor: Color.fromARGB(
                                                  255, 248, 231, 200),
                                              child: Text(
                                                '36',
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
                                ),
                                Tab(
                                  height:
                                      MediaQuery.of(context).size.height / 6.60,
                                  child: Container(
                                    color: _tabController.index == 2
                                        ? const Color.fromARGB(255, 255, 92, 57)
                                        : const Color.fromARGB(
                                            0, 241, 238, 238),
                                    margin: const EdgeInsets.only(top: 1.0),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          width: 88,
                                          height: 80,
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 8.0),
                                            child: CircleAvatar(
                                              backgroundColor: Color.fromARGB(
                                                  223, 241, 202, 195),
                                              child: Text(
                                                '37',
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
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  ListView(
                                    scrollDirection: Axis.vertical,
                                    children: <Widget>[
                                      ...attendenceDataProvider.map(
                                        (e) => Card(
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: MemoryImage(
                                                    base64Decode(
                                                        userDataProvider[0]
                                                            .photo
                                                            .toString())),
                                                radius: 37,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                            'Checkin : ' +
                                                                DateFormat.jm()
                                                                    .format(e
                                                                        .intime!),
                                                            style: TextStyle(
                                                                fontSize: 12)),
                                                        const SizedBox(
                                                          width: 15.0,
                                                        ),
                                                        Text(
                                                            'Checkout : ' +
                                                                DateFormat.jm()
                                                                    .format(e
                                                                        .outtime!),
                                                            style: TextStyle(
                                                                fontSize: 12)),
                                                        const SizedBox(
                                                          width: 15.0,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 2.0,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                            'Early by : ' +
                                                                e.inEarly!,
                                                            style: TextStyle(
                                                                fontSize: 12)),
                                                        const SizedBox(
                                                          width: 15.0,
                                                        ),
                                                        Text(
                                                            'Late by : ' +
                                                                e.outEarly!,
                                                            style: TextStyle(
                                                                fontSize: 12)),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 2.0,
                                                    ),
                                                    Title(
                                                      color: const Color(
                                                          0xFF1C212D),
                                                      child: Text(
                                                          'Working hour : ' +
                                                              e.workingHr!,
                                                          style: TextStyle(
                                                              fontSize: 12)),
                                                    ),
                                                    const SizedBox(
                                                      height: 2.0,
                                                    ),
                                                    Title(
                                                      color: const Color(
                                                          0xFF1C212D),
                                                      child: Text(
                                                          'Date : ' +
                                                              DateFormat.yMd()
                                                                  .format(e
                                                                      .tdateIn!),
                                                          style: TextStyle(
                                                              fontSize: 12)),
                                                    ),
                                                    const SizedBox(
                                                      height: 2.0,
                                                    ),
                                                    Title(
                                                      color: const Color(
                                                          0xFF1C212D),
                                                      child: Text(
                                                          'Processed by :'
                                                                  ' ' +
                                                              e.inProcessedBy!,
                                                          style: TextStyle(
                                                              fontSize: 12)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Card(
                                      //   child: Row(
                                      //     children: [
                                      //       CircleAvatar(
                                      //         backgroundImage:
                                      //             MemoryImage(base64Decode(picture)),
                                      //         radius: 37,
                                      //       ),
                                      //       Padding(
                                      //         padding: const EdgeInsets.all(8.0),
                                      //         child: Column(
                                      //           crossAxisAlignment:
                                      //               CrossAxisAlignment.start,
                                      //           children: [
                                      //             Row(
                                      //               children: [
                                      //                 Text('8:30 AM'),
                                      //                 SizedBox(
                                      //                   width: 15.0,
                                      //                 ),
                                      //                 Text('5:30 PM'),
                                      //               ],
                                      //             ),
                                      //             SizedBox(
                                      //               height: 15.0,
                                      //             ),
                                      //             Title(
                                      //               color: Color(0xFF1C212D),
                                      //               child: Text(
                                      //                   'Duration : 8 Hours 30 minutes'),
                                      //             ),
                                      //             SizedBox(
                                      //               height: 15.0,
                                      //             ),
                                      //             Title(
                                      //               color: Color(0xFF1C212D),
                                      //               child:
                                      //                   Text('Processed by : Device'),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      // Card(
                                      //   child: Row(
                                      //     children: [
                                      //       CircleAvatar(
                                      //         backgroundImage:
                                      //             MemoryImage(base64Decode(picture)),
                                      //         radius: 37,
                                      //       ),
                                      //       Padding(
                                      //         padding: const EdgeInsets.all(8.0),
                                      //         child: Column(
                                      //           crossAxisAlignment:
                                      //               CrossAxisAlignment.start,
                                      //           children: [
                                      //             Row(
                                      //               children: [
                                      //                 Text('8:30 AM'),
                                      //                 SizedBox(
                                      //                   width: 15.0,
                                      //                 ),
                                      //                 Text('5:30 PM'),
                                      //               ],
                                      //             ),
                                      //             SizedBox(
                                      //               height: 15.0,
                                      //             ),
                                      //             Title(
                                      //               color: Color(0xFF1C212D),
                                      //               child: Text(
                                      //                   'Duration : 8 Hours 30 minutes'),
                                      //             ),
                                      //             SizedBox(
                                      //               height: 15.0,
                                      //             ),
                                      //             Title(
                                      //               color: Color(0xFF1C212D),
                                      //               child:
                                      //                   Text('Processed by : Device'),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      // Card(
                                      //   child: Row(
                                      //     children: [
                                      //       CircleAvatar(
                                      //         backgroundImage:
                                      //             MemoryImage(base64Decode(picture)),
                                      //         radius: 37,
                                      //       ),
                                      //       Padding(
                                      //         padding: const EdgeInsets.all(8.0),
                                      //         child: Column(
                                      //           crossAxisAlignment:
                                      //               CrossAxisAlignment.start,
                                      //           children: [
                                      //             Row(
                                      //               children: [
                                      //                 Text('8:30 AM'),
                                      //                 SizedBox(
                                      //                   width: 15.0,
                                      //                 ),
                                      //                 Text('5:30 PM'),
                                      //               ],
                                      //             ),
                                      //             SizedBox(
                                      //               height: 15.0,
                                      //             ),
                                      //             Title(
                                      //               color: Color(0xFF1C212D),
                                      //               child: Text(
                                      //                   'Duration : 8 Hours 30 minutes'),
                                      //             ),
                                      //             SizedBox(
                                      //               height: 15.0,
                                      //             ),
                                      //             Title(
                                      //               color: Color(0xFF1C212D),
                                      //               child:
                                      //                   Text('Processed by : Device'),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      // Card(
                                      //   child: Row(
                                      //     children: [
                                      //       CircleAvatar(
                                      //         backgroundImage:
                                      //             MemoryImage(base64Decode(picture)),
                                      //         radius: 37,
                                      //       ),
                                      //       Padding(
                                      //         padding: const EdgeInsets.all(8.0),
                                      //         child: Column(
                                      //           crossAxisAlignment:
                                      //               CrossAxisAlignment.start,
                                      //           children: [
                                      //             Row(
                                      //               children: [
                                      //                 Text('8:30 AM'),
                                      //                 SizedBox(
                                      //                   width: 15.0,
                                      //                 ),
                                      //                 Text('5:30 PM'),
                                      //               ],
                                      //             ),
                                      //             SizedBox(
                                      //               height: 15.0,
                                      //             ),
                                      //             Title(
                                      //               color: Color(0xFF1C212D),
                                      //               child: Text(
                                      //                   'Duration : 8 Hours 30 minutes'),
                                      //             ),
                                      //             SizedBox(
                                      //               height: 15.0,
                                      //             ),
                                      //             Title(
                                      //               color: Color(0xFF1C212D),
                                      //               child:
                                      //                   Text('Processed by : Device'),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  ListView(
                                    scrollDirection: Axis.vertical,
                                    children: <Widget>[
                                      ...attendenceDataProvider.map(
                                        (e) => SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Card(
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage: MemoryImage(
                                                      base64Decode(
                                                          userDataProvider[0]
                                                              .photo
                                                              .toString())),
                                                  radius: 37,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: const [
                                                          // Text(
                                                          //   DateFormat.jm()
                                                          //       .format(intime!),
                                                          // ),
                                                          SizedBox(
                                                            width: 15.0,
                                                          ),
                                                          // Text(
                                                          //   DateFormat.jm()
                                                          //       .format(outtime!),
                                                          // ),
                                                          SizedBox(
                                                            width: 15.0,
                                                          ),
                                                          // Text(inEarly.toString() +
                                                          //     ":" +
                                                          //     inEarly.toString()),
                                                          SizedBox(
                                                            width: 15.0,
                                                          ),
                                                          // Text(inLate.toString() +
                                                          //     ":" +
                                                          //     inLate.toString()),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 15.0,
                                                      ),
                                                      // Title(
                                                      //   color: Color(0xFF1C212D),
                                                      //   child: Text('Duration :' +
                                                      //       workingHr.toString()),
                                                      // ),
                                                      const SizedBox(
                                                        height: 15.0,
                                                      ),
                                                      // Title(
                                                      //   color: Color(0xFF1C212D),
                                                      //   child: Text('Date :' +
                                                      //       ' ' +
                                                      //       tdateIn!.year.toString() +
                                                      //       '-' +
                                                      //       tdateIn!.month.toString() +
                                                      //       '-' +
                                                      //       tdateIn!.day.toString()),
                                                      // ),
                                                      const SizedBox(
                                                        height: 15.0,
                                                      ),
                                                      // Title(
                                                      //   color: Color(0xFF1C212D),
                                                      //   child: Text('Processed by :' +
                                                      //       ' ' +
                                                      //       inProcessedBy.toString()),
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Card(
                                      //   child: Row(
                                      //     children: [
                                      //       CircleAvatar(
                                      //         backgroundImage:
                                      //             MemoryImage(base64Decode(picture)),
                                      //         radius: 37,
                                      //       ),
                                      //       Padding(
                                      //         padding: const EdgeInsets.all(8.0),
                                      //         child: Column(
                                      //           crossAxisAlignment:
                                      //               CrossAxisAlignment.start,
                                      //           children: [
                                      //             Row(
                                      //               children: [
                                      //                 Text('8:30 AM'),
                                      //                 SizedBox(
                                      //                   width: 15.0,
                                      //                 ),
                                      //                 Text('5:30 PM'),
                                      //               ],
                                      //             ),
                                      //             SizedBox(
                                      //               height: 15.0,
                                      //             ),
                                      //             Title(
                                      //               color: Color(0xFF1C212D),
                                      //               child: Text(
                                      //                   'Duration : 8 Hours 30 minutes'),
                                      //             ),
                                      //             SizedBox(
                                      //               height: 15.0,
                                      //             ),
                                      //             Title(
                                      //               color: Color(0xFF1C212D),
                                      //               child:
                                      //                   Text('Processed by : Device'),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      // Card(
                                      //   child: Row(
                                      //     children: [
                                      //       CircleAvatar(
                                      //         backgroundImage:
                                      //             MemoryImage(base64Decode(picture)),
                                      //         radius: 37,
                                      //       ),
                                      //       Padding(
                                      //         padding: const EdgeInsets.all(8.0),
                                      //         child: Column(
                                      //           crossAxisAlignment:
                                      //               CrossAxisAlignment.start,
                                      //           children: [
                                      //             Row(
                                      //               children: [
                                      //                 Text('8:30 AM'),
                                      //                 SizedBox(
                                      //                   width: 15.0,
                                      //                 ),
                                      //                 Text('5:30 PM'),
                                      //               ],
                                      //             ),
                                      //             SizedBox(
                                      //               height: 15.0,
                                      //             ),
                                      //             Title(
                                      //               color: Color(0xFF1C212D),
                                      //               child: Text(
                                      //                   'Duration : 8 Hours 30 minutes'),
                                      //             ),
                                      //             SizedBox(
                                      //               height: 15.0,
                                      //             ),
                                      //             Title(
                                      //               color: Color(0xFF1C212D),
                                      //               child:
                                      //                   Text('Processed by : Device'),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      // Card(
                                      //   child: Row(
                                      //     children: [
                                      //       CircleAvatar(
                                      //         backgroundImage:
                                      //             MemoryImage(base64Decode(picture)),
                                      //         radius: 37,
                                      //       ),
                                      //       Padding(
                                      //         padding: const EdgeInsets.all(8.0),
                                      //         child: Column(
                                      //           crossAxisAlignment:
                                      //               CrossAxisAlignment.start,
                                      //           children: [
                                      //             Row(
                                      //               children: [
                                      //                 Text('8:30 AM'),
                                      //                 SizedBox(
                                      //                   width: 15.0,
                                      //                 ),
                                      //                 Text('5:30 PM'),
                                      //               ],
                                      //             ),
                                      //             SizedBox(
                                      //               height: 15.0,
                                      //             ),
                                      //             Title(
                                      //               color: Color(0xFF1C212D),
                                      //               child: Text(
                                      //                   'Duration : 8 Hours 30 minutes'),
                                      //             ),
                                      //             SizedBox(
                                      //               height: 15.0,
                                      //             ),
                                      //             Title(
                                      //               color: Color(0xFF1C212D),
                                      //               child:
                                      //                   Text('Processed by : Device'),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  ListView(
                                    scrollDirection: Axis.vertical,
                                    children: <Widget>[
                                      ...attendenceDataProvider.map(
                                        (e) => SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Card(
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage: MemoryImage(
                                                      base64Decode(
                                                          userDataProvider[0]
                                                              .photo
                                                              .toString())),
                                                  radius: 37,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: const [
                                                          // Text(
                                                          //   DateFormat.jm()
                                                          //       .format(intime!),
                                                          // ),
                                                          SizedBox(
                                                            width: 15.0,
                                                          ),
                                                          // Text(
                                                          //   DateFormat.jm()
                                                          //       .format(outtime!),
                                                          // ),
                                                          SizedBox(
                                                            width: 15.0,
                                                          ),
                                                          // Text(inEarly.toString() +
                                                          //     ":" +
                                                          //     inEarly.toString()),
                                                          SizedBox(
                                                            width: 15.0,
                                                          ),
                                                          // Text(inLate.toString() +
                                                          //     ":" +
                                                          //     inLate.toString()),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 15.0,
                                                      ),
                                                      // Title(
                                                      //   color: Color(0xFF1C212D),
                                                      //   child: Text('Duration :' +
                                                      //       workingHr.toString()),
                                                      // ),
                                                      const SizedBox(
                                                        height: 15.0,
                                                      ),
                                                      // Title(
                                                      //   color: Color(0xFF1C212D),
                                                      //   child: Text('Date :' +
                                                      //       ' ' +
                                                      //       tdateIn!.year.toString() +
                                                      //       '-' +
                                                      //       tdateIn!.month.toString() +
                                                      //       '-' +
                                                      //       tdateIn!.day.toString()),
                                                      // ),
                                                      const SizedBox(
                                                        height: 15.0,
                                                      ),
                                                      // Title(
                                                      //   color: Color(0xFF1C212D),
                                                      //   child: Text('Processed by :' +
                                                      //       ' ' +
                                                      //       inProcessedBy.toString()),
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  error: (err, s) => Text(err.toString()),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                );
              },
              error: (err, s) => Text(err.toString()),
              loading: () => const Center(child: CircularProgressIndicator()),
            )));
  }
}
