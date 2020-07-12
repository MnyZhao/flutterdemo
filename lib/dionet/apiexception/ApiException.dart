import 'package:flutter/material.dart';

class ApiException implements Exception {
  int errorState;
  String errorMsg;
  BuildContext context;

  ApiException({this.errorState, this.errorMsg, this.context});
}
