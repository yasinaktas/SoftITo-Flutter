import 'dart:convert';

CommentModel commentModelFromJson(String str) =>
    CommentModel.fromJson(json.decode(str));

String commentModelToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
  final int id;
  final String body;
  final int postId;
  final int likes;
  final User user;

  CommentModel({
    required this.id,
    required this.body,
    required this.postId,
    required this.likes,
    required this.user,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    id: json["id"],
    body: json["body"],
    postId: json["postId"],
    likes: json["likes"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "body": body,
    "postId": postId,
    "likes": likes,
    "user": user.toJson(),
  };
}

class User {
  final int id;
  final String username;
  final String fullName;

  User({required this.id, required this.username, required this.fullName});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    fullName: json["fullName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "fullName": fullName,
  };
}
