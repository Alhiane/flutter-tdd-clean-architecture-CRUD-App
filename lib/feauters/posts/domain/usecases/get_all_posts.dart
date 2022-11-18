import 'package:dartz/dartz.dart';
import 'package:tddccleanarch/core/error/failures.dart';
import 'package:tddccleanarch/feauters/posts/domain/entities/post.dart';
import 'package:tddccleanarch/feauters/posts/domain/repos/posts_repository.dart';

class GetAllPostsUsecase {
  final PostsRepository repository;

  GetAllPostsUsecase(this.repository);

  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getAllPosts();
  }
}
