import 'package:omnidoc/data/models/entities/login/login.model.dart';
import 'package:omnidoc/data/models/entities/user/user.model.dart';

abstract class ILoginService {
  Future<UserModel?> singIn();
  Future<UserModel?> checkUser();
}
