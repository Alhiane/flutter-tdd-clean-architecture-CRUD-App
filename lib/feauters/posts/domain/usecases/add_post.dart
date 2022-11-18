import 'package:dartz/dartz.dart';
import 'package:tddccleanarch/core/error/failures.dart';
import 'package:tddccleanarch/feauters/posts/domain/entities/post.dart';
import 'package:tddccleanarch/feauters/posts/domain/repos/posts_repository.dart';

class AddPostUsecase {
  final PostsRepository repository;

  AddPostUsecase(this.repository);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.addPost(post);
  }
}
