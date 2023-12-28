import 'package:kotobekia/models/post_model/post_model.dart';

class FavPostsModel {
  final String message;
  final List<Post> posts;

  FavPostsModel({
    required this.message,
    required this.posts,
  });

  factory FavPostsModel.fromJson(Map<String, dynamic> json) => FavPostsModel(
        message: json["message"],
        posts:
            List<Post>.from(json["result"].map((post) => Post.fromJson(post))),
      );
}
