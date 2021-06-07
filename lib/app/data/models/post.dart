import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';

@JsonSerializable()
class Post {
  Post({
    required this.id,
    required this.text,
    required this.createdAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  int id;
  @JsonKey(defaultValue: '')
  String text;
  @JsonKey(defaultValue: 0)
  int createdAt;

  Map<String, dynamic> toJson() => _$PostToJson(this);

  DateTime get createdAtDatetime =>
      DateTime.fromMillisecondsSinceEpoch(createdAt);
}
