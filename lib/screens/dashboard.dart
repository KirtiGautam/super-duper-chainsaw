import 'package:flutter/material.dart';

import '../widgets/action_widget.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("APOD"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ActionWidget(),
          Container(
            padding: const EdgeInsets.all(5),
            height: MediaQuery.of(context).size.height * (0.63),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: 10,
              itemBuilder: (ctx, index) =>
                  Image.network('https://picsum.photos/200', ),
            ),
          ),
        ],
      ),
    );
  }
}
