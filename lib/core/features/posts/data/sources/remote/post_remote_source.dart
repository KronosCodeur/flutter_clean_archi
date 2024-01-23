import 'dart:convert';

import 'package:flutter_clean_archi/core/constants/api_constants.dart';
import 'package:flutter_clean_archi/core/error/exceptions.dart';
import 'package:flutter_clean_archi/core/features/posts/data/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostRemoteSource {
  Future<List<PostModel>> getPosts() async {
    final response = await http.get(Uri.parse(host));
    if (response.statusCode == 200) {
      final jsonResponse = await jsonDecode(response.body);
      final List<PostModel> posts = (jsonResponse as List)
          .map((json) => PostModel.fromJson(json))
          .toList();
      return posts;
    } else {
      throw ServerException();
    }
  }
}
