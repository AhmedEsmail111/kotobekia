class SpecificCategoryModel {
  final String message;
  final int totalPages;
  final int page;
  final int totalDocuments;
  final int remainingPages;
  final int? nextPage;
  final List<Result> posts;

  SpecificCategoryModel({
    required this.message,
    required this.totalPages,
    required this.page,
    required this.totalDocuments,
    required this.remainingPages,
    required this.nextPage,
    required this.posts,
  });

  factory SpecificCategoryModel.fromJson(Map<String, dynamic> json) =>
      SpecificCategoryModel(
        message: json["message"],
        totalPages: json["totalPages"],
        page: json["page"],
        totalDocuments: json["totalDocuments"],
        remainingPages: json["remainingPages"],
        nextPage: json["nextPage"],
        posts: List<Result>.from(
            json["result"].map((post) => Result.fromJson(post))),
      );
}

class Result {
  final String id;
  final String title;
  final String description;
  final List<String> images;
  final String? postType;
  final int price;
  final String grade;
  final String bookEdition;
  final String educationLevel;
  final String? postStatus;
  final int views;
  final String? feedback;
  final int numberOfBooks;
  final String semester;
  final String educationType;
  final String location;
  final String city;
  final String? identificationNumber;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int postId;

  Result({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.postType,
    required this.price,
    required this.grade,
    required this.bookEdition,
    required this.educationLevel,
    required this.postStatus,
    required this.views,
    required this.feedback,
    required this.numberOfBooks,
    required this.semester,
    required this.educationType,
    required this.location,
    required this.city,
    required this.identificationNumber,
    required this.createdAt,
    required this.updatedAt,
    required this.postId,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        images: List<String>.from(json["images"].map((image) => image)),
        postType: json["postType"],
        price: json["price"] != null
            ? json["price"] is int
                ? int.parse(json["price"])
                : int.parse(json["price"])
            : 55,
        grade: json["grade"],
        bookEdition: json["bookEdition"],
        educationLevel: json["educationLevel"],
        postStatus: json["postStatus"],
        views: json["views"],
        feedback: json["feedback"],
        numberOfBooks: json["numberOfBooks"],
        semester: json["educationTerm"],
        educationType: json["educationType"],
        location: json["location"],
        city: json["city"] ?? '',
        identificationNumber: json["identificationNumber"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        postId: json["postId"],
      );
}
