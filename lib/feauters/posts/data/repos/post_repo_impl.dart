import 'package:tddccleanarch/core/error/exceptions.dart';
import 'package:tddccleanarch/core/network/network_info.dart';
import 'package:tddccleanarch/feauters/posts/data/datasources/local_data_source.dart';
import 'package:tddccleanarch/feauters/posts/data/datasources/remote_data_source.dart';
import 'package:tddccleanarch/feauters/posts/data/models/post_model.dart';
import 'package:tddccleanarch/feauters/posts/domain/entities/post.dart';
import 'package:tddccleanarch/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tddccleanarch/feauters/posts/domain/repos/posts_repository.dart';

class PostRepositoryImpl implements PostsRepository {
  final RemoteDataSource postRemoteDataSource;
  final LocalDataSource postLocalDataSource;
  final NetworkInfoImpl networkInfo;

  PostRepositoryImpl(
      {required this.postRemoteDataSource,
      required this.postLocalDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    // check first if there is connection
    if (await networkInfo.isConnected) {
      try {
        final posts = await postRemoteDataSource.getAllPosts();
        postLocalDataSource.setCahcedPosts(posts);
        return right(posts);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      try {
        final posts = await postLocalDataSource.getCahcedPosts();
        return right(posts);
      } on EmptyCacheException {
        return left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    // casting from entities post to model of post
    final PostModel postModel = PostModel(
        userId: post.userId, id: post.id, title: post.title, body: post.body);
    // alwayse check for connection
    if (await networkInfo.isConnected) {
      try {
        final post = await postRemoteDataSource.addPost(postModel);
        return right(post);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final post = await postRemoteDataSource.deletePost(id);
        return right(post);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Post>> getPost(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final post = await postRemoteDataSource.getPost(id);
        return right(post);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
    // casting from entities post to model of post
    final PostModel postModel = PostModel(
        userId: post.userId, id: post.id, title: post.title, body: post.body);
    // alwayse check for connection
    if (await networkInfo.isConnected) {
      try {
        final post = await postRemoteDataSource.updatePost(postModel);
        return right(post);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }
}
