import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AmbientMode(
      child: const HomeScreen(title:'Wear Hello'),
      builder: (context,mode,child){
        return MaterialApp(
          title: 'Wear Hello',
          theme: ThemeData(
            visualDensity: VisualDensity.compact,
            colorScheme: mode == WearMode.active
            ? const ColorScheme.dark(
              primary: Color(0xFF00B5FF),
            )
            : const ColorScheme.dark(
                primary: Color.fromARGB(179, 144, 140, 140),
                onBackground: Color.fromARGB(168, 152, 144, 144),
                onSurface: Color.fromARGB(184, 174, 168, 168),
            )
          ),
          home: child,
        );
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key:key);
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AmbientMode(
        builder: (BuildContext context, dynamic mode, Widget? child){
          final isAmbientMode = mode == WearMode.ambient;
          final textColor = isAmbientMode ? Colors.white : Colors.black;
          final backgroundColor = isAmbientMode ? Colors.black : Colors.white;

          return Container(
            color: backgroundColor,
            child: Center(
              child: Text('Hey! How are you today?',
              style: TextStyle(
                fontSize: 18, 
                color: textColor
              ),
              ),
            ),
          );
        }),
    );
  }
}