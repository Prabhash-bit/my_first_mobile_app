// import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
// import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
// import 'dart:math' as math;

// // import 'package:get/route_manager.dart';

// // class SettingMode extends StatefulWidget {
// //   const SettingMode({Key? key}) : super(key: key);

// //   @override
// //   State<SettingMode> createState() => _SettingModeState();
// // }

// // class _SettingModeState extends State<SettingMode> {
// //   bool isFavourite = true;
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Setting'),
// //           actions: [
// //             IconButton(
// //                 icon: const Icon(Icons.lightbulb),
// //                 color: isFavourite ? Colors.black : Colors.white,
// //                 onPressed: () {
// //                   Get.isDarkMode
// //                       ? Get.changeTheme(ThemeData.light())
// //                       : Get.changeTheme(ThemeData.dark());
// //                   setState(() {
// //                     isFavourite = !isFavourite;
// //                   });
// //                 })
// //           ],
// //         ),
// //         body: Center(child: Text('Switch the mode')),
// //       ),
// //     );
// //   }
// // }

// class SphereOfDestiny extends StatefulWidget {
//   const SphereOfDestiny({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<SphereOfDestiny> createState() => _SphereOfDestinyState();
// }

// class _SphereOfDestinyState extends State<SphereOfDestiny> {
//   //final double diameter;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: GestureDetector(
//           child: Transform(
//             origin: Offset(0, 100),
//             transform: Matrix4.identity()
//               ..rotateX(math.pi / 12)
//               ..scale(1.0),
//             child: Container(
//               width: 250.0,
//               height: 250.0,
//               decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       blurRadius: 100,
//                       color: Colors.grey.withOpacity(1.0),
//                       offset: Offset(50, 20),
//                       inset: true,
//                     ),
//                     BoxShadow(
//                       offset: Offset(0.6, 50),
//                       blurRadius: 10,
//                       color: Colors.black26,
//                       inset: true,
//                     ),
//                   ],
//                   gradient: const RadialGradient(
//                     colors: [Colors.blue, Colors.black],
//                     center: Alignment(0.6, 0.2),
//                   ),
//                   shape: BoxShape.circle),
//               child: Container(
//                 transform: Matrix4.identity()
//                   ..translate(0.4 * 0.3 / 2, 0.1 * 0.2 / 2)
//                   ..scale(0.9),
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: RadialGradient(
//                         center: Alignment(0.1, 0.3),
//                         colors: const [Colors.blueGrey, Colors.black12],
//                         stops: [1 - 0.6, 0.6])),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
