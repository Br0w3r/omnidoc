import 'package:get/get.dart';
import 'package:omnidoc/app/utils/msg.utils.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

class LoginController extends GetxController {
  var loginText = 'Ingresar'.obs;
  var duration = const Duration(seconds: 3);
  var rondButton = RoundedLoadingButtonController().obs;

  // App specific variables
  final clientId = '9d70d33d8d284054aee70f955332556f';
  final callbackUrl = 'https://spotifydata.com/songdata';

  LoginController();

  @override
  void onClose() {
    super.onClose();
    rondButton.close();
  }

  startTime() async {
    rondButton.value.start();
    return singIn();
  }

  singIn() async {
    // Construct the url
    final url = Uri.https('accounts.spotify.com', '/authorize', {
      'response_type': 'code',
      'client_id': clientId,
      'redirect_uri': 'https://spotifydata.com/songdata',
      'scope': 'user-read-private user-read-email'
    });

    final result = await FlutterWebAuth.authenticate(
            url: url.toString(), callbackUrlScheme: 'songdata')
        .onError((error, stackTrace) {
      return SnackUtils.error(error.toString(), "advertencia");
    });

    print(result);

    // Extract code from resulting url
    final code = Uri.parse(result).queryParameters['code'];

    print("CODE: $code");
  }
}
