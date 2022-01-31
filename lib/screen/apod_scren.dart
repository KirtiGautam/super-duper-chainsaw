import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/APOD.dart';

class APODScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('APOD'),
        ),
        body: FutureBuilder(
          future: Provider.of<APODHelper>(
            context,
            listen: false,
          ).getAPODUrl(),
          builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<APODHelper>(
                      builder: (cx, apod, child) => apod.apodUrl != null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    'Astronomical Pic of the day',
                                    overflow: TextOverflow.visible,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Image.network(
                                    apod.apodUrl!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ],
                            )
                          : const Center(
                              child: Text(
                                'Some error ocurred, check your internet or try again later',
                              ),
                            ),
                    ),
        ),
      );
}
