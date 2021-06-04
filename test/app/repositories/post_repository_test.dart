import 'dart:io';

import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_getx_template/app/data/models/post.dart';
import 'package:flutter_getx_template/app/repositories/post_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../fixtures/fixture.dart';

void main() {
  group('Test Repository', () {
    late Dio dio;
    late DioAdapter dioAdapter;
    late PostRepository repository;

    setUp(() {
      dio = Dio();
      dioAdapter = DioAdapter();
      dio.httpClientAdapter = dioAdapter;
      repository = PostRepository(dio);
    });

    test('should return list of posts', () async {
      final List<dynamic> payload = fixture('post_items.json');
      dioAdapter.onGet(
        '/posts',
        (request) => request.reply(HttpStatus.ok, payload),
      );

      final result = await repository.getAll();
      expect(result, isA<List<Post>>());
      expect(result.length, payload.length);
    });

    test('should return exception in list of posts', () async {
      dioAdapter.onGet(
        '/posts',
        (request) => request.reply(HttpStatus.notFound, {}),
      );

      expect(() async => await repository.getAll(), throwsException);
    });

    test('should return add new post and return post with id', () async {
      final id = 1;
      final text = Faker().randomGenerator.string(50, min: 10);
      final createdAt = Faker().date.dateTime().millisecondsSinceEpoch;
      final data = {
        'id': id,
        'text': text,
        'createdAt': createdAt,
      };
      dioAdapter.onPost(
        '/posts',
        (request) => request.reply(HttpStatus.ok, data),
        data: data,
      );

      final result = await repository.add(text: text, createdAt: createdAt);
      expect(result, isA<Post>());
      expect(result.text, text);
      expect(result.createdAt, createdAt);
      expect(result.id, id);
    });

    test('should return updated post content', () async {
      final id = 1;
      final text = Faker().randomGenerator.string(50, min: 10);
      final createdAt = Faker().date.dateTime().millisecondsSinceEpoch;
      final data = {
        'id': id,
        'text': text,
        'createdAt': createdAt,
      };
      Post post = Post.fromJson(data);
      post.text = Faker().randomGenerator.string(100, min: 51);

      dioAdapter.onPut(
        '/posts/${post.id}',
        (request) => request.reply(HttpStatus.ok, post.toJson()),
        data: post.toJson(),
      );

      final result = await repository.edit(post);
      expect(result, isA<Post>());
      expect(result.text, post.text);
      expect(result.createdAt, post.createdAt);
      expect(result.id, post.id);
    });

    test('shouldn return true when delete one post', () async {
      final id = 1;
      dioAdapter.onDelete(
        '/posts/$id',
        (request) => request.reply(HttpStatus.ok, {}),
      );

      final result = await repository.delete(1);
      expect(result, true);
    });
  });
}
