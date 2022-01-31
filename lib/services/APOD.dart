import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:workmanager/workmanager.dart';

import '../helpers/APODBase.dart';

class APODHelper with ChangeNotifier {
  String? apodUrl;
  static Future<dynamic> getCall(String url) => http.get(
        Uri.parse(url),
      );

  Future<void> getAPODUrl() {
    return Future(() => apodUrl = {
              "copyright": "Roberto Colombari",
              "date": "2022-01-31",
              "explanation":
                  "The Great Carina Nebula is home to strange stars and iconic nebulas. Named for its home constellation, the huge star-forming region is larger and brighter than the Great Orion Nebula but less well known because it is so far south -- and because so much of humanity lives so far north.  The featured image shows in great detail the northern-most part of the Carina Nebula. Visible nebulas include the semi-circular filaments surrounding the active star Wolf-Rayet 23 (WR23) on the far left.  Just left of center is the Gabriela Mistral Nebula consisting of an emission nebula of glowing gas (IC 2599) surrounding the small open cluster of stars (NGC 3324). Above the image center is the larger star cluster NGC 3293, while to its right is the relatively faint emission nebula designated Loden 153.  The most famous occupant of the Carina Nebula, however, is not shown. Off the image to the lower right is the bright, erratic, and doomed star star known as Eta Carinae -- a star once one of the brightest stars in the sky and now predicted to explode in a supernova sometime in the next few million years.",
              "hdurl":
                  "https://apod.nasa.gov/apod/image/2201/CarinaNorth_Colombari_3000.jpg",
              "media_type": "image",
              "service_version": "v1",
              "title": "Carina Nebula North",
              "url":
                  "https://apod.nasa.gov/apod/image/2201/CarinaNorth_Colombari_960.jpg"
            }['hdurl']).then((value) => Workmanager().cancelAll()).then(
          (value) => Workmanager().registerOneOffTask(
            "1",
            "simpleTask",
            constraints: Constraints(
              networkType: NetworkType.connected,
            ),
            initialDelay: const Duration(seconds: 40),
          ),
        );
  }

  // APODHelper.getCall('$BASE_URL/planetary/apod?api_key=DEMO_KEY')
  //     .then((data) => data.entries.where((ent) {
  //           print(ent);
  //           return true;
  //         }));
}
