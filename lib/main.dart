import 'package:flutter/material.dart';
import 'package:flutter_clean_archi/config/theme/app_theme.dart';
import 'package:flutter_clean_archi/core/features/posts/ui/manager/posts_manager.dart';
import 'package:flutter_clean_archi/core/features/posts/ui/pages/post_list_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => PostManager(),
          ),
        ],
        child: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<PostManager>(context, listen: false).eitherFailureOrPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const PostListPage();
  }
}
