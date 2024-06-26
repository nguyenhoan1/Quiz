import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/admin_home.dart'; // Đảm bảo rằng đường dẫn này đúng với tệp của bạn
import 'package:flutter_application_1/provider/quiz_provider.dart';
import 'package:flutter_application_1/provider/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuizProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Psychological Tests Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ),
      home: AdminPage(),
      
    );
  }
}
