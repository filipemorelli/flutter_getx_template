import 'package:json_annotation/json_annotation.dart';
part 'env.g.dart';

@JsonSerializable()
class Env {
  Env({
    required this.title,
    required this.serverHost,
    required this.serverPort,
  });

  factory Env.fromJson(Map<String, dynamic> json) => _$EnvFromJson(json);

  final String title;
  final String serverHost;
  final String serverPort;

  Map<String, dynamic> toJson() => _$EnvToJson(this);
}
