import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/utils/color_constant.dart';
import 'package:naemen/views/components/text_heading.dart';

class ProgressIndicatorExample extends StatefulWidget {
  const ProgressIndicatorExample({super.key});

  @override
  State<ProgressIndicatorExample> createState() =>
      _ProgressIndicatorExampleState();
}

class _ProgressIndicatorExampleState extends State<ProgressIndicatorExample>
    with TickerProviderStateMixin {
  // late AnimationController controller;

  // @override
  // void initState() {
  //   controller = AnimationController(
  //     /// [AnimationController]s can be created with `vsync: this` because of
  //     /// [TickerProviderStateMixin].
  //     vsync: this,
  //     duration: const Duration(seconds: 5),
  //   )..addListener(() {
  //       setState(() {});
  //     });
  //   controller.repeat(reverse: true);
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      child: LinearProgressIndicator(
        color: AppColors.primaryColor,
        // value: controller.value,
        semanticsLabel: 'Linear progress indicator',
      ),
    );
  }
}
