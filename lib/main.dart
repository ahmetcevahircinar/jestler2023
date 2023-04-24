import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: AnaSayfa());
  }
}

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jestler'),
      ),
      body: Center(
        child: Container(
          color: Colors.grey,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.red,
                  child: GestureDetector(
                    child: const Text('Tek tıkla'),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Tek tıkladın')));
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.blue,
                  child: GestureDetector(
                    child: const Text('Çift tıkla'),
                    onDoubleTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Çift tıkladın')));
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.red,
                  child: GestureDetector(
                    child: const Text('Tıklama bittiği an tetiklenecek'),
                    onTapUp: (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                          Text('$e onTapUp tetiklendi')));
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.red,
                  child: GestureDetector(
                    child: const Text('Tıklama başladığı an tetiklenecek'),
                    onTapDown: (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              '$e onTapDown tetiklendi')));
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.red,
                  child: GestureDetector(
                    child: const Text('Tıklar gibi yap vazgeç'),
                    onTapCancel: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Tıklar gibi yaptın vazgeçtin')));
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.red,
                  child: GestureDetector(
                    child: const Text('Uzun bas'),
                    onLongPress: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Uzun bastın')));
                    },
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(8.0), child: Hareketli()),
            ],
          ),
        ),
      ),
    );
  }
}

class Hareketli extends StatefulWidget {
  const Hareketli({super.key});

  @override
  _HareketliState createState() => _HareketliState();
}

class _HareketliState extends State<Hareketli> {
  String dragDirection = '';
  String startDXPoint = '';
  String startDYPoint = '';
  String velocity = '';
  String distance = '';

  /// Track starting point of a horizontal gesture
  void _onHorizontalDragStartHandler(DragStartDetails details) {
    setState(() {
      dragDirection = "YATAY";
      startDXPoint = '${details.globalPosition.dx.floorToDouble()}';
      startDYPoint = '${details.globalPosition.dy.floorToDouble()}';
    });
  }

  /// Track starting point of a vertical gesture
  void _onVerticalDragStartHandler(DragStartDetails details) {
    setState(() {
      dragDirection = "DİKEY";
      startDXPoint = '${details.globalPosition.dx.floorToDouble()}';
      startDYPoint = '${details.globalPosition.dy.floorToDouble()}';
    });
  }

  /// Track current point of a gesture
  void _onDragUpdateHandler(DragUpdateDetails details) {
    setState(() {
      dragDirection = "GEZİNİYOR";
      startDXPoint = '${details.globalPosition.dx.floorToDouble()}';
      startDYPoint = '${details.globalPosition.dy.floorToDouble()}';
    });
  }

  /// Track current point of a gesture
  void _onHorizontalDragUpdateHandler(DragUpdateDetails details) {
    setState(() {
      dragDirection = "YATAY GEZİNİYOR";
      startDXPoint = '${details.globalPosition.dx.floorToDouble()}';
      startDYPoint = '${details.globalPosition.dy.floorToDouble()}';
    });
  }

  /// Track current point of a gesture
  void _onVerticalDragUpdateHandler(DragUpdateDetails details) {
    setState(() {
      dragDirection = "DİKEY GEZİNİYOR";
      startDXPoint = '${details.globalPosition.dx.floorToDouble()}';
      startDYPoint = '${details.globalPosition.dy.floorToDouble()}';
    });
  }

  /// What should be done at the end of the gesture ?
  void _onDragEnd(DragEndDetails details) {
    double result = details.velocity.pixelsPerSecond.dx.abs().floorToDouble();
    setState(() {
      velocity = '$result';
    });
  }

  void _onScaleUpdateHandler(ScaleUpdateDetails details) {
    double deg = details.rotation.abs() * (180 / math.pi);
    setState(() {
      distance = deg.toStringAsFixed(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      dragStartBehavior: DragStartBehavior.start,

      onHorizontalDragStart: _onHorizontalDragStartHandler,
      //onVerticalDragStart: _onVerticalDragStartHandler,

      //onHorizontalDragUpdate: _onDragUpdateHandler,
      //onVerticalDragUpdate: _onDragUpdateHandler,

      onHorizontalDragUpdate: _onHorizontalDragUpdateHandler,
      //onVerticalDragUpdate: _onVerticalDragUpdateHandler,

      onHorizontalDragEnd: _onDragEnd,
      //onVerticalDragEnd: _onDragEnd,

      onScaleUpdate: _onScaleUpdateHandler,

      behavior: HitTestBehavior.translucent,
      child: Container(
        color: Colors.amberAccent,
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  dragDirection,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Start DX point: $startDXPoint',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  'Start DY point: $startDYPoint',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  'Sürükleme Bitiş Değeri: $velocity',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Text(
                  'Uzaklık: $distance',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}