class UserDataModel {
  final String message;
  final UserData user;

  UserDataModel({
    required this.message,
    required this.user,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        message: json["message"],
        user: UserData.fromJson(json["result"]),
      );
}

class UserData {
  final bool forgetCode;
  final bool isVerified;
  final String id;
  final String fullName;
  final String email;
  final String password;
  final DateTime birthDate;
  final String role;
  final String gender;
  final bool termsAndConditions;
  final List<String> yourAds;
  final int postCount;
  final List<String> badges;
  final List<String> favorite;
  final String provider;
  final String? otp;
  final bool isActive;
  final bool isConfirmed;
  final bool isBlocked;
  final DateTime lastVisited;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  UserData({
    required this.forgetCode,
    required this.isVerified,
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
    required this.birthDate,
    required this.role,
    required this.gender,
    required this.termsAndConditions,
    required this.yourAds,
    required this.postCount,
    required this.badges,
    required this.favorite,
    required this.provider,
    required this.otp,
    required this.isActive,
    required this.isConfirmed,
    required this.isBlocked,
    required this.lastVisited,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        forgetCode: json["forgetCode"] ?? false,
        isVerified: json["isVerified"] ?? false,
        id: json["_id"],
        fullName: json["fullName"],
        email: json["email"],
        password: json["password"],
        birthDate: DateTime.parse(json["birthDate"]),
        role: json["role"],
        gender: json["gender"],
        termsAndConditions: json["termsAndConditions"] ?? false,
        yourAds: json["yourAds"] == null
            ? []
            : List<String>.from(json["yourAds"].map((ad) => ad)),
        postCount: json["postCount"],
        badges: json["badges"] == null
            ? []
            : List<String>.from(json["badges"].map((badge) => badge)),
        favorite: json["favorite"] == null
            ? []
            : List<String>.from(json["favorite"].map((fav) => fav)),
        provider: json["provider"],
        otp: json["OTP"],
        isActive: json["isActive"] ?? false,
        isConfirmed: json["isConfirmed"] ?? false,
        isBlocked: json["isBlocked"] ?? false,
        lastVisited: DateTime.parse(json["lastVisited"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}
