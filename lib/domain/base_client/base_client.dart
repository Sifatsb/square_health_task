import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:square_health_task/app/data/constants/app_text.dart';

import '../../app/utilities/message/snack_bars.dart';
import 'api_exceptions.dart';

class ApiBaseClient {
  Future<dynamic> getData({
    required String url,
    Map<String, String>? header,
  }) async {
    debugPrint('Get Request: $url');
    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: header,
          )
          .timeout(
            const Duration(seconds: 30),
          );

      return returnResponse(response);
    } on SocketException {
      showBasicFailedSnackBar(message: AppText.noInternetConnection);
      throw FetchDataException(AppText.noInternetConnection);
    } on TimeoutException {
      showBasicFailedSnackBar(message: AppText.tryAgainLater);
      throw FetchDataException(AppText.tryAgainLater);
    }
  }

  Future<dynamic> postData({
    Map<String, dynamic>? payload,
    required String url,
    required Map<String, String>? header,
  }) async {
    debugPrint('Post Request: $url');
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode(payload),
            headers: header,
          )
          .timeout(
            const Duration(seconds: 180),
          );
      // return response;
      return returnResponse(response);
    } on SocketException {
      showBasicFailedSnackBar(message: AppText.noInternetConnection);
      throw FetchDataException(AppText.noInternetConnection);
    } on TimeoutException {
      showBasicFailedSnackBar(message: AppText.tryAgainLater);
      throw FetchDataException(AppText.tryAgainLater);
    }
  }

  Future<dynamic> deleteData({
    required payload,
    required String url,
    required Map<String, String>? header,
  }) async {
    debugPrint('Delete Request: $url');
    try {
      final response = await http
          .delete(
            Uri.parse(url),
            body: (payload),
            headers: header,
          )
          .timeout(
            const Duration(seconds: 180),
          );
      return returnResponse(response);
    } on SocketException {
      showBasicFailedSnackBar(message: AppText.noInternetConnection);
      throw FetchDataException(AppText.noInternetConnection);
    } on TimeoutException {
      showBasicFailedSnackBar(message: AppText.tryAgainLater);
      throw FetchDataException(AppText.tryAgainLater);
    }
  }

  Future<dynamic> putData({
    required payload,
    required String url,
    required Map<String, String>? header,
  }) async {
    debugPrint('Put Request: $url');
    try {
      final response = await http
          .put(
            Uri.parse(url),
            body: (payload),
            headers: header,
          )
          .timeout(
            const Duration(seconds: 180),
          );
      return returnResponse(response);
    } on SocketException {
      showBasicFailedSnackBar(message: AppText.noInternetConnection);
      throw FetchDataException(AppText.noInternetConnection);
    } on TimeoutException {
      showBasicFailedSnackBar(message: AppText.tryAgainLater);
      throw FetchDataException(AppText.tryAgainLater);
    }
  }
}
