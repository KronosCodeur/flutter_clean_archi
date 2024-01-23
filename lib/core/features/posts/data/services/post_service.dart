import 'package:dartz/dartz.dart';
import 'package:flutter_clean_archi/core/connection/network_info.dart';
import 'package:flutter_clean_archi/core/error/exceptions.dart';
import 'package:flutter_clean_archi/core/error/failure.dart';
import 'package:flutter_clean_archi/core/features/posts/data/models/post_model.dart';
import 'package:flutter_clean_archi/core/features/posts/data/sources/local/post_local_source.dart';
import 'package:flutter_clean_archi/core/features/posts/data/sources/remote/post_remote_source.dart';
import 'package:flutter_clean_archi/core/features/posts/domain/repositories/post_repository.dart';

class PostService implements PostRepository {
  final PostRemoteSource remoteSource;
  final PostLocalSource localSource;
  final INetworkInfo iNetworkInfo;

  PostService({
    required this.remoteSource,
    required this.localSource,
    required this.iNetworkInfo,
  });

  @override
  Future<Either<Failure, List<PostModel>>> getPosts() async {
    if (await iNetworkInfo.isConnected!) {
      try {
        final remotePosts = await remoteSource.getPosts();
        localSource.cachePosts(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      }
    } else {
      try {
        final posts = await localSource.getCachedPosts();
        return Right(posts);
      } on CacheException {
        return Left(CacheFailure(errorMessage: 'No local data found'));
      }
    }
  }
}
