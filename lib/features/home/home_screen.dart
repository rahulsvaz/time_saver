import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_saver/features/home/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final provider = Provider.of<TimeProvider>(context, listen: false);

    Future.microtask(() async {
      provider.startTimer(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TimeProvider>(builder: (context, provider, _) {

        return provider.timeList.isEmpty
            ? Center(
                child: Text("N Data"),
              )
            : ListView.builder(
                itemCount: provider.timeList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      provider.timeList[index].time,
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w600),
                    )),
                  );
                });
      }),
    );
  }
}
