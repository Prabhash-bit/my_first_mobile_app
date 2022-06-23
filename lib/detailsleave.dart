import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:newapp/model/statecontroller.dart';

class DetailsLeave extends ConsumerStatefulWidget {
  const DetailsLeave({
    Key? key,
  }) : super(key: key);

  @override
  _DetailsLeaveState createState() => _DetailsLeaveState();
}

class _DetailsLeaveState extends ConsumerState<DetailsLeave>
    with SingleTickerProviderStateMixin<DetailsLeave> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _viewprofile = ref.watch(userDataProvider);
    final _viewleave = ref.watch(leaveDataProvider);

    return _viewprofile.when(
      data: (userDataProvider) {
        return _viewleave.when(
          data: (leaveDataProvider) {
            return Scaffold(

                //backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: const Color(0xFF1C212D),
                  title: const Text(
                    'Leave',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Shannon',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                body: ListView(
                  children: [
                    // Container(
                    //   width: MediaQuery.of(context).size.width / 2.0,
                    //   height: MediaQuery.of(context).size.height / 18.0,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: TextField(
                    //       controller: dobs,
                    //       keyboardType: TextInputType.datetime,
                    //       decoration: InputDecoration(
                    //         hintText: 'Select Date',
                    //         border: InputBorder.none,
                    //         suffixIcon: Icon(Icons.calendar_today),
                    //       ),
                    //       readOnly:
                    //           true, //set it true, so that user will not able to edit text
                    //       onTap: () async {
                    //         var date = await showMonthPicker(
                    //             context: context,
                    //             initialDate: DateTime.now(),
                    //             firstDate: DateTime(1900),
                    //             lastDate: DateTime(2100));
                    //         dobs.text = date.toString().substring(0, 10);
                    //       },
                    //     ),
                    //   ),
                    // ),
                    Row(
                      children: [
                        Card(
                          //margin: EdgeInsets.only(left: 15.0, top: 10.0),
                          child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3.5,
                                height:
                                    MediaQuery.of(context).size.height / 10.0,
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 238, 236),
                                    child: Text(
                                      '20',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 255, 92, 57),
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
                                      'Remaining',
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
                                height:
                                    MediaQuery.of(context).size.height / 10.0,
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
                                          color:
                                              Color.fromARGB(255, 237, 164, 34),
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
                                      'Leave Taken',
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
                                height:
                                    MediaQuery.of(context).size.height / 10.0,
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 231, 238, 254),
                                    child: Text(
                                      '5',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 28, 103, 246),
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
                      ],
                    ),
                    ...leaveDataProvider.map(
                      (e) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              ...userDataProvider.map(
                                (i) => CircleAvatar(
                                  backgroundImage: MemoryImage(
                                      base64Decode(i.photo.toString())),
                                  radius: 35,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 120.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Leave ID: ' +
                                            e.leaveApplicationId.toString()),
                                        Text("Date:" ' ' +
                                            DateFormat.yMd()
                                                .format(e.dateOfApplication!)),
                                        const SizedBox(
                                          height: 4.0,
                                        ),
                                        Text('Days: ' +
                                            e.totalLeaveDays.toString()),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                        color: Colors.lightGreen,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Title(
                                        color: Colors.white,
                                        child: const Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Text(
                                            'Approved',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.0),
                                          ),
                                        )),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (BuildContext bc) {
                                              return SizedBox(
                                                height: 900.0,
                                                child: ListView(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 30.0,
                                                              left: 300.0),
                                                      child: IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        // ignore: prefer_const_constructors
                                                        icon: Icon(
                                                          Icons.close,
                                                          //color: Color(0xFF1C212D),
                                                          size: 20.0,
                                                        ),
                                                      ),
                                                    ),
                                                    //const SizedBox(height: 30.0),
                                                    ListTile(
                                                      title: const Text(
                                                          'Leave application ID'),
                                                      subtitle: Text(e
                                                          .leaveApplicationId
                                                          .toString()),
                                                    ),
                                                    ListTile(
                                                      title: const Text(
                                                          'Employee Name'),
                                                      subtitle: Text(
                                                          e.name.toString()),
                                                    ),
                                                    ListTile(
                                                      title: const Text(
                                                          'Employee ID'),
                                                      subtitle: Text(
                                                          e.empId.toString()),
                                                    ),
                                                    ListTile(
                                                      title: const Text(
                                                          'Department'),
                                                      subtitle: Text(e
                                                          .department
                                                          .toString()),
                                                    ),
                                                    ListTile(
                                                      title: const Text(
                                                          'Station '),
                                                      subtitle: Text(
                                                          e.station.toString()),
                                                    ),
                                                    ListTile(
                                                      title: const Text(
                                                          'Designation'),
                                                      subtitle: Text(e
                                                          .designation
                                                          .toString()),
                                                    ),
                                                    ListTile(
                                                      title: const Text(
                                                          'Date of Application'),
                                                      subtitle: Text(e
                                                          .dateOfApplication
                                                          .toString()),
                                                    ),
                                                    ListTile(
                                                      title: const Text(
                                                          'Leave From'),
                                                      subtitle: Text(e
                                                              .dateOfLeaveFrom!
                                                              .year
                                                              .toString() +
                                                          '-' +
                                                          e.dateOfLeaveFrom!
                                                              .month
                                                              .toString() +
                                                          '-' +
                                                          e.dateOfLeaveFrom!
                                                              .year
                                                              .toString()),
                                                    ),
                                                    ListTile(
                                                      title: const Text(
                                                          'Leave To'),
                                                      subtitle: Text(e
                                                              .dateOfLeaveTo!
                                                              .year
                                                              .toString() +
                                                          '-' +
                                                          e.dateOfLeaveTo!.month
                                                              .toString() +
                                                          '' +
                                                          e.dateOfLeaveTo!.day
                                                              .toString()),
                                                    ),
                                                    ListTile(
                                                      title: const Text(
                                                          'Total Leave Days'),
                                                      subtitle: Text(e
                                                          .totalLeaveDays
                                                          .toString()),
                                                    ),
                                                    ListTile(
                                                      title: const Text(
                                                          'Reason OF leave'),
                                                      subtitle: Text(e
                                                          .reasonOfLeave
                                                          .toString()),
                                                    ),
                                                    ListTile(
                                                      title: const Text(
                                                          'Inside/Outside valley'),
                                                      subtitle: Text(e
                                                          .outsideInsideValley
                                                          .toString()),
                                                    ),
                                                    ListTile(
                                                      title: const Text(
                                                          'Contact Person on leave'),
                                                      subtitle: Text(e
                                                          .contactPersonOnLeave
                                                          .toString()),
                                                    ),
                                                    ListTile(
                                                      title: const Text(
                                                          'Emergency Contact'),
                                                      subtitle: Text(e
                                                          .emergencyContact
                                                          .toString()),
                                                    ),
                                                    ListTile(
                                                      title:
                                                          const Text('Status'),
                                                      subtitle: Text(e
                                                          .approvedStatus
                                                          .toString()),
                                                    ),
                                                    ListTile(
                                                      title:
                                                          const Text('Remarks'),
                                                      subtitle: Text(
                                                          e.remarks.toString()),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             LeaveFormDetail()));
                                      },
                                      child: const Text(
                                        'Details',
                                        style: TextStyle(fontSize: 12.0),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // ...snapshot.data!.map(
                    //   (f) => Card(
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Row(
                    //         children: [
                    //           CircleAvatar(
                    //             backgroundImage:
                    //                 MemoryImage(base64Decode(widget.imagee)),
                    //             radius: 35,
                    //           ),
                    //           Padding(
                    //             padding: const EdgeInsets.all(8.0),
                    //             child: Container(
                    //               width: 120.0,
                    //               child: Padding(
                    //                 padding: const EdgeInsets.all(8.0),
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.start,
                    //                   crossAxisAlignment: CrossAxisAlignment.start,
                    //                   children: [
                    //                     Text('Leave ID: ' +
                    //                         f.leaveApplicationId.toString()),
                    //                     Text('Date: ' +
                    //                         f.dateOfApplication!.year.toString() +
                    //                         '-' +
                    //                         f.dateOfApplication!.month.toString() +
                    //                         '-' +
                    //                         f.dateOfApplication!.day.toString()),
                    //                     SizedBox(
                    //                       height: 4.0,
                    //                     ),
                    //                     Text(
                    //                         'Days: ' + f.totalLeaveDays.toString()),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //           Spacer(
                    //             flex: 1,
                    //           ),
                    //           Column(
                    //             children: [
                    //               Container(
                    //                 height: 20.0,
                    //                 decoration: BoxDecoration(
                    //                     color: Colors.red,
                    //                     borderRadius: BorderRadius.circular(30)),
                    //                 child: Title(
                    //                     color: Colors.white,
                    //                     child: Padding(
                    //                       padding: const EdgeInsets.all(4.0),
                    //                       child: Text('Rejected',
                    //                           style: TextStyle(
                    //                               color: Colors.white,
                    //                               fontSize: 12.0)),
                    //                     )),
                    //               ),
                    //               TextButton(
                    //                   onPressed: () {
                    //                     temp(context);
                    //                     // Navigator.push(
                    //                     //     context,
                    //                     //     MaterialPageRoute(
                    //                     //         builder: (context) =>
                    //                     //             LeaveFormDetail()));
                    //                   },
                    //                   child: Text(
                    //                     'Details',
                    //                     style: TextStyle(fontSize: 12.0),
                    //                   )),
                    //             ],
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // ...snapshot.data!.map(
                    //   (g) => Card(
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Row(
                    //         children: [
                    //           CircleAvatar(
                    //             backgroundImage:
                    //                 MemoryImage(base64Decode(widget.imagee)),
                    //             radius: 35,
                    //           ),
                    //           Padding(
                    //             padding: const EdgeInsets.all(8.0),
                    //             child: Container(
                    //               width: 120.0,
                    //               child: Padding(
                    //                 padding: const EdgeInsets.all(8.0),
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.start,
                    //                   crossAxisAlignment: CrossAxisAlignment.start,
                    //                   children: [
                    //                     Text('Leave ID: ' +
                    //                         g.leaveApplicationId.toString()),
                    //                     Text('Date: ' +
                    //                         g.dateOfApplication!.year.toString() +
                    //                         '-' +
                    //                         g.dateOfApplication!.month.toString() +
                    //                         '-' +
                    //                         g.dateOfApplication!.day.toString()),
                    //                     SizedBox(
                    //                       height: 4.0,
                    //                     ),
                    //                     Text(
                    //                         'Days: ' + g.totalLeaveDays.toString()),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //           Spacer(
                    //             flex: 1,
                    //           ),
                    //           Column(
                    //             children: [
                    //               Container(
                    //                 height: 20.0,
                    //                 decoration: BoxDecoration(
                    //                     color: Color.fromRGBO(255, 216, 49, 1),
                    //                     borderRadius: BorderRadius.circular(30)),
                    //                 child: Title(
                    //                     color: Colors.white,
                    //                     child: Padding(
                    //                       padding: const EdgeInsets.all(4.0),
                    //                       child: Text('Pending',
                    //                           style: TextStyle(
                    //                               color: Colors.white,
                    //                               fontSize: 12.0)),
                    //                     )),
                    //               ),
                    //               TextButton(
                    //                   onPressed: () {
                    //                     temp(context);
                    //                     // Navigator.push(
                    //                     //     context,
                    //                     //     MaterialPageRoute(
                    //                     //         builder: (context) =>
                    //                     //             LeaveFormDetail()));
                    //                   },
                    //                   child: Text(
                    //                     'Details',
                    //                     style: TextStyle(fontSize: 12.0),
                    //                   )),
                    //             ],
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ));
          },
          error: (err, s) => Center(child: Text(err.toString())),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
      },
      error: (err, s) => Center(child: Text(err.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

//   void temp(context) {
//     showModalBottomSheet(
//         isScrollControlled: true,
//         context: context,
//         builder: (BuildContext bc) {
//           final viewleavedata = ref.watch(leaveDataProvider);
//           return viewleavedata.when(
//             data: (viewleavedata) {
//               return SizedBox(
//                 height: 900.0,
//                 child: ListView(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 30.0, left: 300.0),
//                       child: IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         // ignore: prefer_const_constructors
//                         icon: Icon(
//                           Icons.close,
//                           //color: Color(0xFF1C212D),
//                           size: 20.0,
//                         ),
//                       ),
//                     ),
//                     //const SizedBox(height: 30.0),
//                     ListTile(
//                       title: const Text('Leave application ID'),
//                       subtitle:
//                           Text(viewleavedata[0].leaveApplicationId.toString()),
//                     ),
//                     ListTile(
//                       title: const Text('Employee Name'),
//                       subtitle: Text(viewleavedata[0].name.toString()),
//                     ),
//                     ListTile(
//                       title: const Text('Employee ID'),
//                       subtitle: Text(viewleavedata[0].empId.toString()),
//                     ),
//                     ListTile(
//                       title: const Text('Department'),
//                       subtitle: Text(viewleavedata[0].department.toString()),
//                     ),
//                     ListTile(
//                       title: const Text('Station '),
//                       subtitle: Text(viewleavedata[0].station.toString()),
//                     ),
//                     ListTile(
//                       title: const Text('Designation'),
//                       subtitle: Text(viewleavedata[0].designation.toString()),
//                     ),
//                     ListTile(
//                       title: const Text('Date of Application'),
//                       subtitle:
//                           Text(viewleavedata[0].dateOfApplication.toString()),
//                     ),
//                     ListTile(
//                       title: const Text('Leave From'),
//                       subtitle: Text(viewleavedata[0]
//                               .dateOfLeaveFrom!
//                               .year
//                               .toString() +
//                           '-' +
//                           viewleavedata[0].dateOfLeaveFrom!.month.toString() +
//                           '-' +
//                           viewleavedata[0].dateOfLeaveFrom!.year.toString()),
//                     ),
//                     ListTile(
//                       title: const Text('Leave To'),
//                       subtitle: Text(
//                           viewleavedata[0].dateOfLeaveTo!.year.toString() +
//                               '-' +
//                               viewleavedata[0].dateOfLeaveTo!.month.toString() +
//                               '' +
//                               viewleavedata[0].dateOfLeaveTo!.day.toString()),
//                     ),
//                     ListTile(
//                       title: const Text('Total Leave Days'),
//                       subtitle:
//                           Text(viewleavedata[0].totalLeaveDays.toString()),
//                     ),
//                     ListTile(
//                       title: const Text('Reason OF leave'),
//                       subtitle: Text(viewleavedata[0].reasonOfLeave.toString()),
//                     ),
//                     ListTile(
//                       title: const Text('Inside/Outside valley'),
//                       subtitle:
//                           Text(viewleavedata[0].outsideInsideValley.toString()),
//                     ),
//                     ListTile(
//                       title: const Text('Contact Person on leave'),
//                       subtitle: Text(
//                           viewleavedata[0].contactPersonOnLeave.toString()),
//                     ),
//                     ListTile(
//                       title: const Text('Emergency Contact'),
//                       subtitle:
//                           Text(viewleavedata[0].emergencyContact.toString()),
//                     ),
//                     ListTile(
//                       title: const Text('Status'),
//                       subtitle:
//                           Text(viewleavedata[0].approvedStatus.toString()),
//                     ),
//                     ListTile(
//                       title: const Text('Remarks'),
//                       subtitle: Text(viewleavedata[0].remarks.toString()),
//                     ),
//                   ],
//                 ),
//               );
//             },
//             error: (err, s) => Text(err.toString()),
//             loading: () => const Center(child: CircularProgressIndicator()),
//           );
//         });
//   }
}
