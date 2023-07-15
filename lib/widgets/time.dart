import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wear/wear.dart';

void main() {
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fecha y Hora en Movimiento',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late StreamController<DateTime> _streamController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<DateTime>();
    _startTimer();
  }

  @override
  void dispose() {
    _streamController.close();
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _streamController.add(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fecha y Hora en Movimiento'),
      ),
      body: Center(
        child: StreamBuilder<DateTime>(
          stream: _streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
  DateTime? now = snapshot.data;
  if (now != null) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    String formattedTime = DateFormat('HH:mm:ss').format(now);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Fecha: $formattedDate',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 16),
        Text(
          'Hora: $formattedTime',
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }
} 

return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}