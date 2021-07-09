// Name: Afifah Binti Salimi

// Future: Asynchronous request that focuses on one request and one response. Frequently used for http request.
// Stream: Asynchronous request that enables single request to listen to continuous series of responses. Mostly used in web-sockets or event listeners.

// Methods to make responsive design:
// 1. Use MediaQuery.of() to get size and orientation of the app.
// 2. Use  BoxConstraints to set min or max height or width of a widget.
// 3. Use LayoutBuilder to build child widgets that can depends on the parent widget’s size.

import 'dart:convert';

import 'package:explore_flutter/core/constant/mock_data.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  DutyResponse dutyResponse;

  @override
  void initState() {
    dutyResponse = DutyResponse.fromJson(json.decode(dutyData));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Duty Time'),
      ),
      body: ListView.builder(
        itemCount: dutyResponse?.duties?.length ?? 0,
        itemBuilder: (context, index) => Column(
          children: [
            Text(dutyResponse?.duties[index]?.day ?? ''),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              itemCount: dutyResponse?.duties[index]?.shifts?.length ?? 0,
              itemBuilder: (context, idx) => Column(
                children: [
                  Text(dutyResponse?.duties[index]?.shifts[idx]?.timeStart ??
                      ''),
                  Text(dutyResponse?.duties[index]?.shifts[idx]?.timeEnd ?? ''),
                  Text(dutyResponse?.duties[index]?.shifts[idx]?.timeShift ??
                      ''),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShiftInfo {
  String timeStart;
  String timeEnd;
  String timeShift;

  ShiftInfo.fromJson(Map<String, dynamic> json) {
    timeStart = json['time_start'] as String;
    timeEnd = json['time_end'] as String;
    timeShift = json['time_shift'] as String;
  }
}

class DutyInfo {
  String day;
  List<ShiftInfo> shifts;

  DutyInfo({this.day, this.shifts});
}

class DutyResponse {
  List<DutyInfo> duties = [];

  DutyResponse.fromJson(Map<String, dynamic> json) {
    duties = (json['duty_time'] as Map)
        .entries
        .map((e) => DutyInfo(
            day: e.key,
            shifts: (e.value as List ?? [])
                .map((s) => ShiftInfo.fromJson(s))
                .toList()))
        .toList();
  }
}
