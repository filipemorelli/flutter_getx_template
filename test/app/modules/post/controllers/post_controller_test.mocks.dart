// Mocks generated by Mockito 5.0.9 from annotations
// in flutter_getx_template/test/app/modules/post/controllers/post_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:flutter_getx_template/app/data/models/post.dart' as _i2;
import 'package:flutter_getx_template/app/repositories/post_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakePost extends _i1.Fake implements _i2.Post {}

/// A class which mocks [IPostRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIPostRepository extends _i1.Mock implements _i3.IPostRepository {
  MockIPostRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i2.Post>> getAll() =>
      (super.noSuchMethod(Invocation.method(#getAll, []),
              returnValue: Future<List<_i2.Post>>.value(<_i2.Post>[]))
          as _i4.Future<List<_i2.Post>>);
  @override
  _i4.Future<_i2.Post> add({String? text, String? creationDate}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #add, [], {#text: text, #creationDate: creationDate}),
              returnValue: Future<_i2.Post>.value(_FakePost()))
          as _i4.Future<_i2.Post>);
  @override
  _i4.Future<_i2.Post> edit(_i2.Post? post) =>
      (super.noSuchMethod(Invocation.method(#edit, [post]),
              returnValue: Future<_i2.Post>.value(_FakePost()))
          as _i4.Future<_i2.Post>);
  @override
  _i4.Future<bool> delete(int? id) =>
      (super.noSuchMethod(Invocation.method(#delete, [id]),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
}
