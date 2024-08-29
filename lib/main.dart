import 'package:flutter/material.dart';
import 'package:fun_facts_app/provider/theme_provider.dart';
import 'package:fun_facts_app/screens/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Provider.of<ThemeProvider>(context, listen: false).loadMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
        theme: themeProvider.isDarkModeChecked
            ? ThemeData(
                useMaterial3: true,
                fontFamily: GoogleFonts.poppins().fontFamily,
                colorScheme: const ColorScheme.dark())
            : ThemeData(
                useMaterial3: true,
                fontFamily: GoogleFonts.poppins().fontFamily,
                colorScheme: const ColorScheme.light()),
        debugShowCheckedModeBanner: false,
        home: const MainScreen());
  }
}
