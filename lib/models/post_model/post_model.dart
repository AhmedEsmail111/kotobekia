class PostModel {
  String? message;
  List<Result>? result;

  PostModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

}

class Result {
  String? sId;
  String? educationLevel;
  List<Posts>? posts;


  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    educationLevel = json['educationLevel'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add( Posts.fromJson(v));
      });
    }
  }
}

class Posts {
  String? sId;
  String? title;
  String? description;
  List<String>? images;
  String? postType;
  String? price;
  String? grade;
  String? bookEdition;
  String? educationLevel;
  String? postStatus;
  int? views;
  String? feedback;
  int? numberOfBooks;
  String? educationTerm;
  String? educationType;
  String? location;
  String? city;
  String? identificationNumber;
  String? createdAt;
  String? updatedAt;
  int? postId;


  Posts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    images = json['images'].cast<String>();
    postType = json['postType'];
    price = json['price'];
    grade = json['grade'];
    bookEdition = json['bookEdition'];
    educationLevel = json['educationLevel'];
    postStatus = json['postStatus'];
    views = json['views'];
    feedback = json['feedback'];
    numberOfBooks = json['numberOfBooks'];
    educationTerm = json['educationTerm'];
    educationType = json['educationType'];
    location = json['location'];
    city = json['city'];
    identificationNumber = json['identificationNumber'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    postId = json['postId'];
  }

}