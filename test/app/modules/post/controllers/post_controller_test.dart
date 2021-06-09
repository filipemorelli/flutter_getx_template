import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_getx_template/app/data/models/post.dart';
import 'package:flutter_getx_template/app/modules/post/controllers/post_controller.dart';
import 'package:flutter_getx_template/app/repositories/post_repository.dart';

import './post_controller_test.mocks.dart';

@GenerateMocks(<Type>[IPostRepository])
void main() {
  group('Test Post controller', () {
    late PostController controller;
    late MockIPostRepository repository;

    setUp(() {
      repository = MockIPostRepository();
      controller = PostController(repository);
      controller.posts.value = <Post>[];
    });

    test('should return list of posts', () async {
      when(repository.getAll()).thenAnswer(
        (_) async => <Post>[
          Post(id: 1, text: 'text', creationDate: ''),
        ],
      );

      await controller.getPosts();
      expect(controller.posts.isNotEmpty, true);
    });

    test('should return Exception when try to get list of post', () async {
      when(repository.getAll())
          .thenAnswer((_) => Future<List<Post>>.error(Exception()));

      expect(() async => controller.getPosts(), throwsException);
    });

    test('should return null when the params is valid', () async {
      final String text = Faker().randomGenerator.string(10, min: 1);
      expect(controller.validateTextPost(text), null);
    });

    test('should return String when params is empty', () async {
      const String text = '';
      expect(controller.validateTextPost(text),
          'Please insert a message to your new post');
    });

    test('should return String when params is null', () async {
      const String? text = null;
      expect(controller.validateTextPost(text),
          'Please insert a message to your new post');
    });

    test('should return success when save new post', () async {
      final Post post = Post(
        id: Faker().randomGenerator.integer(1),
        text: Faker().randomGenerator.string(50),
        creationDate: Faker().date.dateTime().toString(),
      );
      when(repository.add(
        text: anyNamed('text'),
        creationDate: anyNamed('creationDate'),
      )).thenAnswer((_) async => post);
      when(repository.getAll()).thenAnswer((_) async => <Post>[post]);

      controller.textController.text = post.text;
      final Post p = await controller.addPost();
      expect(p.text, post.text);
    });
  });
}
