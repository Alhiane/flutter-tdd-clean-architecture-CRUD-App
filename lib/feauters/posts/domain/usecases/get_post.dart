import 'package:dartz/dartz.dart';
import 'package:tddccleanarch/core/error/failures.dart';
import 'package:tddccleanarch/feauters/posts/domain/entities/post.dart';
import 'package:tddccleanarch/feauters/posts/domain/repos/posts_repository.dart';

class GetPostUsecase {
  final PostsRepository repository;

  GetPostUsecase(this.repository);

  Future<Either<Failure, Post>> call(int id) async {
    return await repository.getPost(id);
  }
}
