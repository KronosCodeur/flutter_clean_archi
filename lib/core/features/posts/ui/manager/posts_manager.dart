import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_archi/core/connection/network_info.dart';
import 'package:flutter_clean_archi/core/error/failure.dart';
import 'package:flutter_clean_archi/core/features/posts/data/models/post_model.dart';
import 'package:flutter_clean_archi/core/features/posts/data/services/post_service.dart';
import 'package:flutter_clean_archi/core/features/posts/data/sources/local/post_local_source.dart';
import 'package:flutter_clean_archi/core/features/posts/data/sources/remote/post_remote_source.dart';
import 'package:flutter_clean_archi/core/features/posts/domain/usecases/get_posts.dart';
import 'package:flutter_clean_archi/core/params/params.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostManager extends ChangeNotifier {
  List<PostModel>? posts;
  Failure? failure;

  PostManager({this.posts, this.failure});

  void eitherFailureOrPosts() async {
    PostService postService = PostService(
      remoteSource: PostRemoteSource(),
      localSource: PostLocalSource(
        sharedPreferences: await SharedPreferences.getInstance(),
      ),
      iNetworkInfo: NetworkInfo(
        DataConnectionChecker(),
      ),
    );
    final failureOrPosts = await GetPosts(postService).call(
      NoParams(),
    );

    failureOrPosts.fold((newFailure) {
      posts = null;
      failure = newFailure;
      notifyListeners();
    }, (newPosts) {
      posts = newPosts;
      failure = null;
      notifyListeners();
    });
  }
}
