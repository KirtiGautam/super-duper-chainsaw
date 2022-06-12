// import 'dart:async';

// import 'package:wallpaper/wallpaper.dart';

// class WPHelper {
//   static Future<String> setWallpaper(String url) async {
//     final Completer<String> c = new Completer<String>();
//     var st = Wallpaper.imageDownloadProgress(url);
//     st.listen((data) {
//       print("DataReceived: " + data);
//     }, onDone: () async {
//       var a = await Wallpaper.bothScreen();
//       print("Task Done: " + a);
//       c.complete(a);
//     }, onError: (error) {
//       c.complete(error);
//       print("Some Error");
//     });
//     return c.future;
//   }
// }
