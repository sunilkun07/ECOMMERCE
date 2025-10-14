import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'pages/homepage.dart'; // Ensure this file exists and contains a Homepage widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/login",
      routes: {
        "/":(context) => const Homepage(),
        "/login":(context) => Loginpage(), // Replace with actual Loginpage widget
        // Add other routes here as needed
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
