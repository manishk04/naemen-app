import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:naemen/utils/color_constant.dart';

class Utils {
  static void fieldFocusChange(
    BuildContext context,
    FocusNode current,
    FocusNode next,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastMessage(String msg) {
    Fluttertoast.showToast(msg: msg);
  }

  static snackBar(String message, BuildContext context, Color color) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }

  static startLoading() {
    Get.dialog(
      PopScope(
        canPop: false,
        // onPopInvokedWithResult: (didPop, result) => false,
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        ),
      ),
      barrierColor: Colors.transparent,
    );
  }

  static showError(String title, Object? error, StackTrace? stackTrace) {
    log(title, error: error, stackTrace: stackTrace);
    toastMessage("Something Went Wrong!!");
  }
}
