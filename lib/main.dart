import 'package:flutter/material.dart';
import 'package:fun_facts_app/screens/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: GoogleFonts.poppins().fontFamily,
          // colorScheme: const ColorScheme.dark()
        ),
        debugShowCheckedModeBanner: false,
        home: const MainScreen());
  }
}
