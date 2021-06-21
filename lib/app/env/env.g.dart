// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Env _$EnvFromJson(Map<String, dynamic> json) {
  return Env(
    title: json['title'] as String,
    serverHost: json['serverHost'] as String,
    serverPort: json['serverPort'] as String,
  );
}

Map<String, dynamic> _$EnvToJson(Env instance) => <String, dynamic>{
      'title': instance.title,
      'serverHost': instance.serverHost,
      'serverPort': instance.serverPort,
    };
