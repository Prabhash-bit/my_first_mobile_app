import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newapp/model/Leaveform.dart';
import 'package:newapp/model/attendence.dart';
import 'package:newapp/model/profile_data.dart';
import 'package:newapp/model/station_data.dart';

// final userDataProvider =
//     FutureProvider.autoDispose((ref) => Profileapicalling().fetchProfileData());
// final leaveDataProvider =
//     FutureProvider.autoDispose((ref) => Leaveapicalling().fetchLeaveData());
// final attendenceDataProvider = FutureProvider.autoDispose(
//     (ref) => Attendenceapicalling().fetchAttendenceData());
// final stationDataProvider =
//     FutureProvider.autoDispose((ref) => Station().fetchStationData());

final userDataProvider = FutureProvider.autoDispose((ref) {
  return Profileapicalling().fetchProfileData();
});
final leaveDataProvider = FutureProvider.autoDispose((ref) {
  ref.refresh;
  ref.read;
  return Leaveapicalling().fetchLeaveData();
});
final attendenceDataProvider = FutureProvider.autoDispose((ref) {
  ref.refresh;
  return Attendenceapicalling().fetchAttendenceData();
});
final stationDataProvider = FutureProvider.autoDispose((ref) {
  ref.refresh;
  return Station().fetchStationData();
});




// ----------------------------------------------------------------------------------

// final userDataProvider = FutureProvider<List<Datumprofile>>((ref) async {
//   return ref.read(getDatafromprofile).fetchProfileData();
// });

// final leaveDataProvider = FutureProvider<List<leaveDatum>>((ref) async {
//   return ref.read(getDatafromleave).fetchLeaveData();
// });

// final attendenceDataProvider =
//     FutureProvider<List<Datum_attendence>>((ref) async {
//   return ref.read(getDatafromattendence).fetchAttendenceData();
// });
// final stationDataProvider = FutureProvider<List<Datum>>((ref) async {
//   return ref.read(getDatafromstation).fetchStationData();
// });




//  ref.refresh(userDataProvider);
//     ref.refresh(leaveDataProvider);
//     ref.refresh(attendenceDataProvider);
//     ref.refresh(stationDataProvider);


// abstract class DisposableProvider with ChangeNotifier {
//   void disposeValues();
// }

// class AppProviders {
//   static List<DisposableProvider> getDisposableProviders(BuildContext context) {
//     return [
//       Provider.of<PostsProvider>(context, listen: false),
//       //...other disposable providers
//     ];
//   }

//   static void disposeAllDisposableProviders(BuildContext context) {
//     getDisposableProviders(context).forEach((disposableProvider) {
//       disposableProvider.disposeValues();
//     });
//   }
// }