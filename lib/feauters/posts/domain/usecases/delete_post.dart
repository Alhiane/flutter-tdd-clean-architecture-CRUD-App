import 'package:dartz/dartz.dart';
import 'package:tddccleanarch/core/error/failures.dart';
import 'package:tddccleanarch/feauters/posts/domain/repos/posts_repository.dart';

class DeletePostUsecase {
  final PostsRepository repository;

  DeletePostUsecase(this.repository);

  Future<Either<Failure, Unit>> call(int id) async {
    return await repository.deletePost(id);
  }
}
