import 'package:dartz/dartz.dart';
import 'package:flutter_clean_archi/core/error/failure.dart';
import 'package:flutter_clean_archi/core/features/posts/data/models/post_model.dart';
import 'package:flutter_clean_archi/core/features/posts/domain/repositories/post_repository.dart';
import 'package:flutter_clean_archi/core/params/params.dart';
import 'package:flutter_clean_archi/core/usecases/usecase.dart';

class GetPosts implements UseCase<List<PostModel>, NoParams> {
  final PostRepository postRepository;

  GetPosts(this.postRepository);

  @override
  Future<Either<Failure, List<PostModel>>> call(NoParams params) async {
    return await postRepository.getPosts();
  }
}
