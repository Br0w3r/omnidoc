import 'dart:convert';

import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart';
import 'package:omnidoc/app/utils/storage.utils.dart';
import 'package:omnidoc/core/values/environments.dart';
import 'package:omnidoc/core/values/globals.dart';
import 'package:omnidoc/data/models/entities/login/login.model.dart';
import 'package:omnidoc/data/models/entities/user/user.model.dart';
import 'package:omnidoc/data/models/enums/request_method.enum.dart';
import 'package:omnidoc/data/services/base.service.dart';
import 'package:omnidoc/data/services/login/login.contract.dart';

class LoginApiService extends BaseService implements ILoginService {
  Future<UserModel?> singIn() async {
    String urlDireccion = Environments.apiAuthorization +
        "client_id=${Globals.clientId}" +
        "&response_type=code" +
        "&redirect_uri=${Globals.redirectUrl}" +
        "&scope=${Globals.scope}";

    final response = await FlutterWebAuth.authenticate(
        url: urlDireccion, callbackUrlScheme: "omnidoc");

    final error = Uri.parse(response).queryParameters['error'];
    if (error == null) {
      //Get code
      final code = Uri.parse(response).queryParameters['code'];

      String authorizationStr = "${Globals.clientId}:${Globals.clientSecret}";
      var bytes = utf8.encode(authorizationStr);
      var base64Str = base64.encode(bytes);

      String authorization64 = 'Basic $base64Str';

      Client client = Client();

      var sendDataToken =
          await client.post(Uri.parse(Environments.apiToken), body: {
        'grant_type': "authorization_code",
        'code': code,
        'redirect_uri': Globals.redirectUrl
      }, headers: {
        'Authorization': authorization64
      });

      if (sendDataToken.statusCode == 200) {
        //SAVE TOKEN
        LocalStorageUtils.setStringKey(
            Globals.tokenKey,
            AuthorizationModel.fromJson(json.decode(sendDataToken.body))
                .accessToken);

        //GET DATA USER
        var userProfile = await provider.request<UserModel>(
            RequestMethod.get, Environments.userProfile,
            useDefaultUrl: false);

        var responseProfile = json.decode(userProfile.body.toString());

        //SAVE DATA USER
        LocalStorageUtils.setStringKey(
            Globals.currentUserKey, jsonEncode(responseProfile));

        return UserModel.fromJson(responseProfile);
      } else {
        // If that call was not successful, throw an error.
        throw Exception('Failed to load post');
      }
    } else {
      print("Error al autenticar");
      return null;
    }
  }

  @override
  Future<UserModel?> checkUser() async {
    var userJson =
        await LocalStorageUtils.getStringByKey(Globals.currentUserKey);
    if (userJson.isEmpty) {
      return null;
    } else {
      return UserModel.fromJson(json.decode(userJson));
    }
  }
}
