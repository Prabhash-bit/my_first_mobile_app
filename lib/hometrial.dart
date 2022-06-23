// import 'package:flutter/material.dart';
// import 'package:newapp/Homepage.dart';
// import 'package:newapp/detailsleave.dart';
// import 'package:newapp/home.dart';
// import 'package:newapp/profile.dart';
// import 'package:newapp/todayattendence.dart';

// class trial extends StatefulWidget {
//   const trial({Key? key}) : super(key: key);

//   @override
//   State<trial> createState() => _trialState();
// }

// class _trialState extends State<trial> {
//   homenavPage g = homenavPage();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DefaultTabController(
//         length: 4,
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           bottomNavigationBar: const TabBar(
//             labelColor: Colors.black26,
//             tabs: [
//               Tab(icon: Icon(Icons.home)),
//               Tab(icon: Icon(Icons.check_box)),
//               Tab(icon: Icon(Icons.time_to_leave)),
//               Tab(icon: Icon(Icons.people)),
//             ],
//           ),
//           body: TabBarView(
//             children: [
//               homePage(),
//               TodayAttendence(),
//               DetailsLeave(),
//               profilePage()
//             ],
//           ),
//           floatingActionButton: FloatingActionButton(
//             backgroundColor: const Color.fromRGBO(255, 216, 49, 1),
//             //splashColor: Colors.red,
//             tooltip: 'Menu',
//             onPressed: () {
//               temp(context);
//             },
//             child: const Icon(Icons.menu),
//           ),
//         ),
//       ),
//     );
//   }
// }
