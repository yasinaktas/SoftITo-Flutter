import 'package:dio/dio.dart';
import 'package:fake_api_uygulamasi/models/post_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Future<List<PostModel>> posts;
  @override
  void initState() {
    super.initState();
    posts = getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Fake Api Post"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(color: Colors.grey.shade300, height: 0),
          ),
        ),
        body: FutureBuilder(
          future: posts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var postList = snapshot.data!;
              return ListView.builder(
                itemCount: postList.length,
                itemBuilder: (context, index) {
                  var post = postList[index];
                  return ListTile(title: Text(post.title));
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Future<List<PostModel>> getAllPosts() async {
    try {
      var response = await Dio().get("https://dummyjson.com/posts");
      List<PostModel> posts = [];
      if (response.statusCode == 200) {
        posts = (response.data["posts"] as List)
            .map((postMap) => PostModel.fromJson(postMap))
            .toList();
      }
      return posts;
    } on DioException catch (e) {
      return Future.error(e.toString());
    }
  }
}
