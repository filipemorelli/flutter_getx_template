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
  PostRepository(this._dio);

  final Dio _dio;

  @override
  Future<Post> add({
    required String text,
    required int createdAt,
  }) async {
    try {
      final Response<Map<String, dynamic>> result = await _dio.post(
        '/posts',
        data: <String, dynamic>{
          'text': text,
          'createdAt': createdAt,
        },
      );
      return Post.fromJson(result.data ?? <String, dynamic>{});
    } catch (e, stackTrace) {
      return Future<Post>.error(e, stackTrace);
    }
  }

  @override
  Future<bool> delete(int id) async {
    try {
      await _dio.delete<dynamic>('/posts/$id');
      return true;
    } catch (e, stackTrace) {
      return Future<bool>.error(e, stackTrace);
    }
  }

  @override
  Future<Post> edit(Post post) async {
    try {
      final Response<Map<String, dynamic>> result =
          await _dio.put('/posts/${post.id}', data: post.toJson());
      return Post.fromJson(result.data ?? <String, dynamic>{});
    } catch (e, stackTrace) {
      return Future<Post>.error(e, stackTrace);
    }
  }

  @override
  Future<List<Post>> getAll() async {
    try {
      final Response<List<dynamic>> result = await _dio.get('/posts');
      return List<Map<String, dynamic>>.from(result.data ?? <dynamic>[])
          .map((Map<String, dynamic> e) => Post.fromJson(e))
          .toList();
    } catch (e, stackTrace) {
      return Future<List<Post>>.error(e, stackTrace);
    }
  }
}
