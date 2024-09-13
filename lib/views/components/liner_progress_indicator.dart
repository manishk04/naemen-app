import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/utils/color_constant.dart';
import 'package:naemen/views/components/text_heading.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class LinearProgressIndicatorApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LinearProgressIndicatorAppState();
  }
}

class LinearProgressIndicatorAppState
    extends State<LinearProgressIndicatorApp> {
  late bool _loading;
  double _progressValue = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _loading = true;
    // Start the progress automatically when the app initializes.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _loading
                  ? LinearProgressIndicator(value: _progressValue)
                  : Text(
                      "Download Complete",
                      style: TextStyle(fontSize: 25),
                    ),
              SizedBox(height: 20),
              Text("${(_progressValue * 100).toStringAsFixed(0)}%"),
            ],
          ),
        ),
      ),
    );
  }
}
