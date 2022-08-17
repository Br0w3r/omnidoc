import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:omnidoc/app/utils/msg.utils.dart';
import 'package:omnidoc/app/utils/storage.utils.dart';
import 'package:omnidoc/core/routes/pages.dart';
import 'package:omnidoc/core/values/environments.dart';
import 'package:omnidoc/core/values/globals.dart';
import 'package:omnidoc/data/models/enums/request_method.enum.dart';
import 'package:omnidoc/data/providers/api_exceptions.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class ApiProvider {
  // Singleton
  ApiProvider._privateConstructor();
  static final ApiProvider _instance = ApiProvider._privateConstructor();
  static ApiProvider get instance => _instance;
  var jsonError;
  // End Singleton

  Future<dynamic> request<T>(RequestMethod method, String endPoint,
      {bool useDefaultUrl = true,
      String body = '',
      bool returnFullResponse = false}) async {
    http.Response resp;

    final Uri url =
        Uri.parse((useDefaultUrl ? Environments.apiUrl : '') + endPoint);

    final Map<String, String> headers = <String, String>{};
    headers.putIfAbsent(
        HttpHeaders.contentTypeHeader, () => 'application/json');

    // Get and apply token
    var token = await LocalStorageUtils.getStringByKey(Globals.tokenKey);
    if (token.isNotEmpty) {
      headers.putIfAbsent(
          HttpHeaders.authorizationHeader, () => 'Bearer $token');
    }

    try {
      if (method == RequestMethod.get) {
        resp = await http.get(url, headers: headers);
      } else if (method == RequestMethod.put) {
        resp = await http.put(
          url,
          headers: headers,
          body: body,
        );
      } else if (method == RequestMethod.patch) {
        resp = await http.patch(url, headers: headers, body: body);
      } else if (method == RequestMethod.post) {
        resp = await http.post(
          url,
          headers: headers,
          body: body,
        );
      } else if (method == RequestMethod.delete) {
        resp = await http.delete(
          url,
          headers: headers,
        );
      } else {
        throw Exception('Otro error');
      }

      jsonError = resp;
      return _returnResponse(resp, returnFullResponse);
    } on TimeoutException catch (e) {
      print('Timeout error $e');
      throw Exception();
    } on SocketException catch (e) {
      print('Socket Error: $e');
      throw Exception();
    } on Error catch (_) {
      _returnResponse(jsonError, returnFullResponse);
      throw Exception();
    }
  }

  dynamic _returnResponse(http.Response response, bool returnFullResponse) {
    switch (response.statusCode) {
      case 200:
        if (returnFullResponse) return response;
        var responseJson = response;
        return responseJson;
      case 201:
        var responseJson = response;
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        LocalStorageUtils.setStringKey(Globals.currentUserKey, '');
        Get.offNamedUntil(Routes.login, ModalRoute.withName(Routes.login));
        return SnackUtils.error(
            "No tienes Permiso para esta Aplicación", "Error");
      //throw UnauthorisedException();
      case 500:
        SnackUtils.error("Ah ocurrido un error en el servidor", "Advertencia");
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
