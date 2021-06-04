import 'package:envify/envify.dart';

part 'env.g.dart';

@Envify()
abstract class Env {
  static const String title = _Env.title;
  static const String serverHost = _Env.serverHost;
}
