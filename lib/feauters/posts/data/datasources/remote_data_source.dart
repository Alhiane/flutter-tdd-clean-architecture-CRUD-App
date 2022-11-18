import 'package:dartz/dartz.dart';
import 'package:tddccleanarch/feauters/posts/data/models/post_model.dart';

abstract class RemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> addPost(PostModel post);
  Future<Unit> updatePost(PostModel post);
  Future<Unit> deletePost(int id);
  Future<PostModel> getPost(int id);
}

class RemoteDataSourceDio implements RemoteDataSource {
  @override
  Future<Unit> addPost(PostModel post) {
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePost(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getAllPosts() {
    throw UnimplementedError();
  }

  @override
  Future<PostModel> getPost(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePost(PostModel post) {
    throw UnimplementedError();
  }
}
