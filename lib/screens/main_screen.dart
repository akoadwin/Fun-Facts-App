// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fun_facts_app/screens/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<dynamic> facts = [];

  bool isLoading = false;

  Future<void> getData() async {
    isLoading = true;
    try {
      Response respone = await Dio().get(
          "https://raw.githubusercontent.com/akoadwin/flutter_dummy_api/main/facts.json");

      facts = jsonDecode(respone.data);
      isLoading = false;
      setState(() {});
      print(respone);
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      print(e);
    }
  }

  Widget loadingScreen() {
    return const Center(
        child: CircularProgressIndicator(
      color: Colors.blueGrey,
    ));
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SettingsScreen();
                    }));
                    print("Clicked Settings");
                  },
                  child: const Icon(Icons.settings)),
            )
          ],
          title: const Text("Fun Facts"),
          centerTitle: true,
        ),
        body: isLoading
            ? loadingScreen()
            : Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: facts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.all(5),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                textAlign: TextAlign.center,
                                facts[index],
                                style: const TextStyle(fontSize: 20),
                              ),
                            )),
                          );
                        }),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text("Swipe left to view more"),
                    // child: ElevatedButton(
                    //     onPressed: () async {
                    //       getData();
                    //       print(getData());
                    //     },
                    //     child: const Text("Fetch Data ")),
                  )
                ],
              ));
  }
}
