class Faculties {
  int? id;
  String? title;

  Faculties(
    this.id,
    this.title,
  );

  Faculties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
