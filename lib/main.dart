import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/attendance_provider.dart';
import 'Screens/history_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AttendanceProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Presensi Siswa',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/history': (context) => HistoryScreen(),
      },
    );
  }
}
