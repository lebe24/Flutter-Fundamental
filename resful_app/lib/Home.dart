import 'package:flutter/material.dart';
import 'package:resful_app/src/model/model.dart';
import 'package:resful_app/src/services/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post>? post;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    post = await FetchPost().getPost();
    if (post != null) {
      setState((() => isLoading = true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: isLoading,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: post?.length,
          itemBuilder: (context, index) => ListTile(
            leading: Container(
              margin: EdgeInsets.all(3),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
              ),
            ),
            title: Text(post![index].title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Color(0xFF1989E6))),
          ),
        ),
      ),
    );
  }
}
