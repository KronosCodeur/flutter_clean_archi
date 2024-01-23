import 'dart:convert';

import 'package:flutter_clean_archi/core/features/posts/data/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostLocalSource {
  final SharedPreferences sharedPreferences;

  PostLocalSource({
    required this.sharedPreferences,
  });

  Future<void> cachePosts(List<PostModel> posts) async {
    final jsonList = posts.map((post) => jsonEncode(post.toJson())).toList();
    await sharedPreferences.setStringList('posts', jsonList);
  }

  Future<List<PostModel>> getCachedPosts() async {
    final jsonStringList = sharedPreferences.getStringList('posts') ?? [];
    final cachePosts = jsonStringList
        .map((jsonString) => PostModel.fromJson(jsonDecode(jsonString)))
        .toList();
    return cachePosts.cast<PostModel>();
  }
}
