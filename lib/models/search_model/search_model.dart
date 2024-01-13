import 'package:kotobekia/models/post_model/post_model.dart';

class SearchModel {
  final String message;
  final List<Post> posts;

  SearchModel({
    required this.message,
    required this.posts,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        message: json["message"],
        posts: List<Post>.from(
          json["result"].map(
            (post) => Post.fromJson(post),
          ),
        ),
      );
}
