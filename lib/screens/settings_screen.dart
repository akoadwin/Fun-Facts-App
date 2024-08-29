import 'package:flutter/material.dart';
import 'package:fun_facts_app/provider/theme_provider.dart';
import 'package:fun_facts_app/widgets/theme_switcher.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    // var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: const Column(
        children: [
          ThemeSwitcher(),
          // ElevatedButton(
          //     onPressed: () {
          //       themeProvider.updateStringData(
          //           data: "Updated from settings screesan");
          //     },
          //     child: Text("Update Global State Value")),
          // Text(themeProvider.dataToUpdate)
        ],
      ),
    );
  }
}
