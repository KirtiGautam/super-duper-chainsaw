import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workmanager/workmanager.dart';

import './helpers/wallpaper.dart';
import './screen/apod_scren.dart';
import './services/APOD.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  runApp(MyApp());
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    print("-------Task started-----");
    var ap = APODHelper();
    return ap.getAPODUrl().then((value) {
      print("-------Attempting to apply wallpaper-----");
      return WPHelper.setWallpaper(ap.apodUrl!).then((value) {
        print(value);
        return Future.value(true);
      });
    });
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: APODHelper(),
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.purple),
          home: APODScreen(),
        ),
      );
}
