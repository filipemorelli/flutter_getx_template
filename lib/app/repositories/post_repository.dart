import 'package:dio/dio.dart';
import 'package:flutter_getx_template/app/data/models/post.dart';

abstract class IPostRepository {
  Future<List<Post>> getAll();

  Future<Post> add({
    required String text,
    required int createdAt,
  });

  Future<Post> edit(Post post);

  Future<bool> delete(int id);
}

class PostRepository extends IPostRepository {
  Dio _dio;

  PostRepository(this._dio);

  @override
  Future<Post> add({
    required String text,
    required int createdAt,
  }) async {
    try {
      final result = await _dio.post(
        '/posts',
        data: <String, dynamic>{
          "text": text,
          "createdAt": createdAt,
        },
      );
      return Post.fromJson(result.data as Map<String, dynamic>);
    } catch (e, stackTrace) {
      return Future<Post>.error(e, stackTrace);
    }
  }

  @override
  Future<bool> delete(int id) async {
    try {
      await _dio.delete('/posts/$id');
      return true;
    } catch (e, stackTrace) {
      return Future.error(e, stackTrace);
    }
  }

  @override
  Future<Post> edit(Post post) async {
    try {
      final result = await _dio.put('/posts/${post.id}', data: post.toJson());
      return Post.fromJson(result.data as Map<String, dynamic>);
    } catch (e, stackTrace) {
      return Future.error(e, stackTrace);
    }
  }

  @override
  Future<List<Post>> getAll() async {
    try {
      final result = await _dio.get('/posts');
      return List.from(result.data as List<dynamic>)
          .map((e) => Post.fromJson(e))
          .toList();
    } catch (e, stackTrace) {
      return Future.error(e, stackTrace);
    }
  }
}
