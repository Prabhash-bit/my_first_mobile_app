// import 'package:flutter/material.dart';

// import 'notification.dart';

// class TravelList extends StatefulWidget {
//   @override
//   State<TravelList> createState() => _TravelListState();
// }

// class _TravelListState extends State<TravelList> {
//   Future<bool> _back() async {
//     bool goBack = false;
//     await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Text('Are you sure'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 goBack = false;
//                 Navigator.pop(context);
//               },
//               child: Text('No'),
//             ),
//             TextButton(
//               onPressed: () {
//                 goBack = true;
//                 Navigator.pop(context);
//               },
//               child: Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//     return goBack;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF1C212D),
//         title: const Text(
//           'Travel List',
//           textAlign: TextAlign.center,
//           style: TextStyle(fontFamily: 'shannon'),
//         ),
//         actions: <Widget>[
//           IconButton(
//             onPressed: (() {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => notificationPage()));
//             }),
//             icon: Icon(Icons.notifications),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 250.0,
//             width: 350.0,
//             child: Card(
//               margin: EdgeInsets.only(left: 10.0, top: 10.0),
//               child: Column(
//                 children: [
//                   CircleAvatar(
//                     //backgroundImage: AssetImage('assets/images/er.jpg'),
//                     radius: 45,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Title(
//                         color: Colors.black,
//                         child: Text(
//                           'Name',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Shannon'),
//                         )),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 10.0),
//           Row(
//             children: [
//               Container(
//                 height: 100.0,
//                 width: 172.5,
//                 child: Card(
//                   margin: EdgeInsets.only(left: 10.0, top: 10.0),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Title(
//                             color: Colors.black,
//                             child: Text(
//                               'Checkin',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'Shannon'),
//                             )),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(width: 3.0),
//               Container(
//                 height: 100.0,
//                 width: 172.5,
//                 child: Card(
//                   margin: EdgeInsets.only(left: 10.0, top: 10.0),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Title(
//                             color: Colors.black,
//                             child: Text(
//                               'Check out',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'Shannon'),
//                             )),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 10.0),
//           Title(
//             color: Colors.black,
//             child: Padding(
//               padding: const EdgeInsets.only(right: 150.0),
//               child: Text(
//                 'July attendence',
//                 style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'shannon'),
//               ),
//             ),
//           ),
//           SizedBox(height: 10.0),
//           Row(
//             children: [
//               Container(
//                 height: 100.0,
//                 width: 115.5,
//                 child: Card(
//                   margin: EdgeInsets.only(left: 10.0, top: 10.0),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Title(
//                             color: Colors.black,
//                             child: Text(
//                               'Travel',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'Shannon'),
//                             )),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Spacer(
//                 flex: 1,
//               ),
//               Container(
//                 height: 100.0,
//                 width: 115.5,
//                 child: Card(
//                   margin: EdgeInsets.only(left: 10.0, top: 10.0),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Title(
//                             color: Colors.black,
//                             child: Text(
//                               'Travel',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'Shannon'),
//                             )),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Spacer(
//                 flex: 1,
//               ),
//               Container(
//                 height: 100.0,
//                 width: 115.5,
//                 child: Card(
//                   margin: EdgeInsets.only(left: 10.0, top: 10.0),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Title(
//                             color: Colors.black,
//                             child: Text(
//                               'Travel',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'Shannon'),
//                             )),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 10.0),
//           // Row(
//           //   children: [
//           //     Container(
//           //       height: 100.0,
//           //       width: 172.5,
//           //       child: Card(
//           //         margin: EdgeInsets.only(left: 10.0, top: 10.0),
//           //         child: Column(
//           //           children: [
//           //             Padding(
//           //               padding: const EdgeInsets.all(8.0),
//           //               child: Title(
//           //                   color: Colors.black,
//           //                   child: Text(
//           //                     'Travel',
//           //                     style: TextStyle(
//           //                         fontWeight: FontWeight.bold,
//           //                         fontFamily: 'Shannon'),
//           //                   )),
//           //             ),
//           //           ],
//           //         ),
//           //       ),
//           //     ),
//           //     SizedBox(width: 3.0),
//           //     Container(
//           //       height: 100.0,
//           //       width: 172.5,
//           //       child: Card(
//           //         margin: EdgeInsets.only(left: 10.0, top: 10.0),
//           //         child: Column(
//           //           children: [
//           //             Padding(
//           //               padding: const EdgeInsets.all(8.0),
//           //               child: Title(
//           //                   color: Colors.black,
//           //                   child: Text(
//           //                     'Travel',
//           //                     style: TextStyle(
//           //                         fontWeight: FontWeight.bold,
//           //                         fontFamily: 'Shannon'),
//           //                   )),
//           //             ),
//           //           ],
//           //         ),
//           //       ),
//           //     ),
//           //   ],
//           // ),
//         ],
//       ),
//     );
//   }
// }
