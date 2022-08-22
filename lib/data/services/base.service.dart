import 'package:omnidoc/data/providers/api.provider.dart';

abstract class BaseService {
  final provider = ApiProvider.instance;
}
