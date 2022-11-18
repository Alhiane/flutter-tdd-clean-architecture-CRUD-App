import 'package:dartz/dartz.dart';
import 'package:tddccleanarch/core/error/failures.dart';
import 'package:tddccleanarch/feauters/posts/domain/entities/post.dart';

abstract class PostsRepository {
  // getting all posts
  Future<Either<Failure, List<Post>>> getAllPosts();
  // getting single post
  Future<Either<Failure, Post>> getPost(int id);
  // add new post
  Future<Either<Failure, Unit>> addPost(Post post);
  // update x post
  Future<Either<Failure, Unit>> updatePost(Post post);
  // delete x post
  Future<Either<Failure, Unit>> deletePost(int id);
}
