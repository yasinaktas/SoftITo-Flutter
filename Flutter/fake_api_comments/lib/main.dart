import 'package:dio/dio.dart';
import 'package:fake_api_comments/models/comment_model.dart';
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
  late Future<List<CommentModel>> comments;
  @override
  void initState() {
    super.initState();
    comments = getAllComments();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Comments"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(color: Colors.grey.shade300, height: 0),
          ),
        ),
        body: Center(
          child: FutureBuilder(
            future: comments,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<CommentModel> commentList = snapshot.data!;
                return ListView.builder(
                  itemCount: commentList.length,
                  itemBuilder: (context, index) {
                    CommentModel comment = commentList[index];
                    return ListTile(title: Text(comment.body));
                  },
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  Future<List<CommentModel>> getAllComments() async {
    try {
      List<CommentModel> comments = [];
      var response = await Dio().get("https://dummyjson.com/comments");
      if (response.statusCode == 200) {
        comments = (response.data["comments"] as List)
            .map((commentMap) => CommentModel.fromJson(commentMap))
            .toList();
      }
      return comments;
    } on DioException catch (e) {
      return Future.error(e.toString());
    }
  }
}
