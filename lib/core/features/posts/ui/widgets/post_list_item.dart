import 'package:flutter/material.dart';
import 'package:flutter_clean_archi/core/features/posts/data/models/post_model.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({super.key, required this.post});
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(post.title),
        subtitle: Text(post.body),
      ),
    );
  }
}
