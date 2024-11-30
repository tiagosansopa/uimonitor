import 'package:flutter/material.dart';

void main() {
  runApp(UiMonitorApp());
}

class UiMonitorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Monitor',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MeterScreen(),
    );
  }
}

class MeterScreen extends StatefulWidget {
  @override
  _MeterScreenState createState() => _MeterScreenState();
}

class _MeterScreenState extends State<MeterScreen> {
  int _currentLevel = 0;

  final List<Color> _colors = [
    Colors.red[900],
    Colors.red[200],
    Colors.orange,
    Colors.yellow,
    Colors.lightGreen,
    Colors.green,
  ];

  void _incrementMeter() {
    setState(() {
      if (_currentLevel < _colors.length - 1) {
        _currentLevel++;
      }
    });
  }

  void _decrementMeter() {
    setState(() {
      if (_currentLevel > -1) {
        _currentLevel--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meter Control'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Meter display
            Container(
              width: 100,
              height: 200,
              decoration: BoxDecoration(
                color: _colors[_currentLevel],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: Colors.black),
              ),
              child: Center(
                child: Text(
                  'Level ${_currentLevel + 1}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementMeter,
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _incrementMeter,
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
