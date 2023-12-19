class UserModel {
  int id;
  String title;
  String category;
  String image;

  UserModel(
      {required this.id,
      required this.title,
      required this.category,
      required this.image});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        image: json["image"],
      );
}
