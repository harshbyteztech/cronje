class Member {
  Member({
    required this.id,
    required this.photo,
    required this.name,
    required this.description,
    required this.deleted,
  });

  int id;
  String photo;
  String name;
  String description;
  String deleted;
  bool isExpande = false;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["id"],
        photo: json["photo"],
        name: json["name"],
        description: json["description"],
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "photo": photo,
        "name": name,
        "description": description,
        "deleted": deleted,
      };
}
