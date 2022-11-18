import 'package:dartz/dartz.dart';
import 'package:tddccleanarch/feauters/posts/data/models/post_model.dart';

abstract class LocalDataSource {
  Future<List<PostModel>> getCahcedPosts();
  Future<Unit> setCahcedPosts(List<PostModel> posts);
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<List<PostModel>> getCahcedPosts() {
    throw UnimplementedError();
  }

  @override
  Future<Unit> setCahcedPosts(List<PostModel> posts) {
    throw UnimplementedError();
  }
}
