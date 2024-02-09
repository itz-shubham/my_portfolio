import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showInfoAlert(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      textColor: const Color(0xFF000000),
      webBgColor: 'white',
      timeInSecForIosWeb: 2);
}

void showSuccessAlert(String msg) {
  Fluttertoast.showToast(
      msg: msg, webBgColor: 'MediumSeaGreen', timeInSecForIosWeb: 2);
}

void showErrorAlert(String msg) {
  Fluttertoast.showToast(msg: msg, webBgColor: 'tomato', timeInSecForIosWeb: 2);
}
