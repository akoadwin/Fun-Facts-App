// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fun_facts_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Theme Mode",
            style: TextStyle(fontSize: 20),
          ),
          Row(
            children: [
              Switch(
                  value: themeProvider.isDarkModeChecked,
                  onChanged: (value) {
                    themeProvider.updateThemeMode(setDarkMode: value);
                  }),
              SizedBox(
                width: 15,
              ),
              Text(
                themeProvider.isDarkModeChecked ? "Dark Mode" : "Light Mode",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
