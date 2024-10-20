import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:time_saver/features/home/data_model.dart';

class TimeProvider extends ChangeNotifier {
  List<DataModel> timeList = [];

  Timer? timer;
  final timeBox = Hive.box<DataModel>("timeBox");

  void startTimer(BuildContext context) async {
    timeList = timeBox.values.toList();

    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      DateTime now = DateTime.now();
      String time = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
      notifyListeners();
      final dataModel = DataModel(time: time);
      timeBox.add(dataModel);

      timeList = timeBox.values.toList();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("TimeAdded")));

      notifyListeners();
    });
  }
}
