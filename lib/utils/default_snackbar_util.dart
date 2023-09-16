import 'package:bitcoin_price/app_constants/constants.dart';
import 'package:bitcoin_price/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarUtil {
  static showSnackBar(String text, {Widget? actionButton, Color? color}) {
    Get.showSnackbar(GetSnackBar(
      duration: const Duration(milliseconds: 2000),
      borderRadius: 16.0,
      margin: EdgeInsets.all(4.w),
      // boxShadows: CommonStyle.primaryShadowLight(),
      backgroundColor: Constants.primaryColor,
      animationDuration: const Duration(milliseconds: 500),
      mainButton: actionButton,
      messageText: Text(
        text,
        style: TextStyle(
          color: Constants.textWhite,
        ),
      ),
    ));
  }
}
