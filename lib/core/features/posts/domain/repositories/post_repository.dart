import 'package:dartz/dartz.dart';
import 'package:flutter_clean_archi/core/error/failure.dart';
import 'package:flutter_clean_archi/core/features/posts/data/models/post_model.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostModel>>> getPosts();
}
