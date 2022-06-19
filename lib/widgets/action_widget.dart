import 'package:flutter/material.dart';

class ActionWidget extends StatefulWidget {
  @override
  State<ActionWidget> createState() => _ActionWidgetState();
}

class _ActionWidgetState extends State<ActionWidget> {
  TimeOfDay _actionTime = TimeOfDay.now();
  bool _syncEnabled = false;

  Future<void> _showTimepicker(BuildContext ctx) => showTimePicker(
        context: ctx,
        initialTime: TimeOfDay.now(),
      ).then(
        (pickedTime) => pickedTime != null
            ? setState(
                () => _actionTime = pickedTime,
              )
            : null,
      );

  void _toggleSync(bool switched) => setState(() => _syncEnabled = switched);

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: BoxShadowPainter(),
        child: ClipPath(
          clipper: BottomTriangleClipper(),
          child: Container(
            color: Theme.of(context).primaryColor,
            height: MediaQuery.of(context).size.height / 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(
                          _actionTime.format(context),
                          style: const TextStyle(color: Colors.white),
                        ),
                        TextButton.icon(
                          icon: const Icon(
                            Icons.alarm_outlined,
                            color: Colors.white,
                          ),
                          label: const Text('Change'),
                          onPressed: () => _showTimepicker(context),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Sync APOD',
                          style: TextStyle(color: Colors.white),
                        ),
                        Switch(
                          activeColor: Theme.of(context).colorScheme.secondary,
                          value: _syncEnabled,
                          onChanged: (val) => _toggleSync(val),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.08,
                    bottom: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.secondary,
                      padding: const EdgeInsets.all(7),
                      //   shape: const CircleBorder(),
                    ),
                    child: const Text(
                      'Apply changes',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class BottomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var contolPoint = Offset(size.width * 0.8, size.height);
    var startPoint = Offset(size.width * 0.9, size.height - 0.07 * size.height);
    var endPoint = Offset(size.width * 0.7, size.height - 0.04 * size.height);
    Path path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height - 0.145 * size.height)
      ..lineTo(startPoint.dx, startPoint.dy)
      ..quadraticBezierTo(
          contolPoint.dx, contolPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(0, size.height - 0.2 * size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class BoxShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var contolPoint = Offset(size.width * 0.8, size.height);
    var startPoint = Offset(size.width * 0.9, size.height - 0.07 * size.height);
    var endPoint = Offset(size.width * 0.7, size.height - 0.04 * size.height);
    Path path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height - 0.145 * size.height)
      ..lineTo(startPoint.dx, startPoint.dy)
      ..quadraticBezierTo(
        contolPoint.dx,
        contolPoint.dy,
        endPoint.dx,
        endPoint.dy,
      )
      ..lineTo(0, size.height - 0.2 * size.height)
      ..close();

    canvas.drawShadow(
      path,
      const Color.fromARGB(255, 116, 116, 236),
      3.0,
      false,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
