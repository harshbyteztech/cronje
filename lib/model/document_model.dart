class DocumentData {
  DocumentData({
    required this.id,
    required this.file,
    required this.name,
    required this.description,
    required this.deleted,
  });

  int id;
  String file;
  String name;
  String description;
  String deleted;
  bool isExpande = false;

  factory DocumentData.fromJson(Map<String, dynamic> json) => DocumentData(
        id: json["id"],
        file: json["file"],
        name: json["name"],
        description: json["description"],
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "file": file,
        "name": name,
        "description": description,
        "deleted": deleted,
      };
}
