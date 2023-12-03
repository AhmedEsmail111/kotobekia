// used when sending the level to the API
Map<String, String> levels = {
  'حضانة': '655b4ec133dd362ae53081f7',
  'إبتدائي': '655b4ecd33dd362ae53081f9',
  'إعدادي': '655b4ee433dd362ae53081fb',
  'ثانوي': '655b4efb33dd362ae53081fd',
  'عام': '655b4f0a33dd362ae53081ff',
};
// used when sending the level to the API
Map<String, String> reversedLevels = {
  '655b4ec133dd362ae53081f7': 'حضانة',
  '655b4ecd33dd362ae53081f9': 'إبتدائي',
  '655b4ee433dd362ae53081fb': 'إعدادي',
  '655b4efb33dd362ae53081fd': 'ثانوي',
  '655b4f0a33dd362ae53081ff': 'عام',
};

class Post {
  final String? id;
  final String title;
  final List<dynamic> images;

  final int price;
  final String grade;
  final String educationLevel;
  final String location;
  final int numberOfBooks;
  final int seen;
  final String description;
  final String createdSince;
  final String educationType;
  final String bookEdition;
  final String semester;

  Post({
    this.id,
    required this.title,
    required this.images,
    required this.price,
    required this.grade,
    required this.educationLevel,
    required this.location,
    required this.numberOfBooks,
    required this.seen,
    required this.description,
    required this.createdSince,
    required this.educationType,
    required this.bookEdition,
    required this.semester,
  });
}
