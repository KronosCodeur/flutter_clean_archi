import 'package:flutter/material.dart';
import 'package:flutter_clean_archi/core/error/failure.dart';
import 'package:flutter_clean_archi/core/features/posts/data/models/post_model.dart';
import 'package:flutter_clean_archi/core/features/posts/ui/manager/posts_manager.dart';
import 'package:flutter_clean_archi/core/features/posts/ui/widgets/post_list_item.dart';
import 'package:provider/provider.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<PostModel>? posts = Provider.of<PostManager>(context).posts;
    Failure? failure = Provider.of<PostManager>(context).failure;
    late Widget widget;
    if (posts != null) {
      widget = ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return PostListItem(post: posts[index]);
          });
    } else if (failure != null) {
      widget = Center(
        child: Text(failure.errorMessage),
      );
    } else {
      widget = const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lists of posts'),
      ),
      body: widget,
    );
  }
}
