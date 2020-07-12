import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/dart_smaple/main.dart';
import 'package:flutterdemo/dionet/apiexception/ApiException.dart';
import 'package:flutterdemo/utils.dart';

import 'ApiStateCode.dart';

class ApiExceptionHelper {
  BuildContext context;

  ApiExceptionHelper(this.context);

  void handleDioException(DioError e) {
    print(e.toString());
  }

  void handleApiException(ApiException e) {
    print(e.errorMsg);
    switch (e.errorState) {
      case ApiStateCode.StateTokenInvalid:
        print("token失效");
        Navigator.of(this.context).push(getRouter(MyApp()));
        break;
    }
  }

  void exceptionHelper(Exception e) {
    if (e is ApiException) {
      handleApiException(e);
    } else if (e is DioError) {
      handleDioException(e);
    } else {
      print(e.toString());
    }
  }
}
