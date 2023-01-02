class News {
  int? id;
  String? title;
  String? image;
  String? content;
  String? createdBy;
  String? createdAt;

  News(
    this.id,
    this.title,
    this.image,
    this.content,
    this.createdBy,
    this.createdAt,
  );

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    content = json['content'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    return { 
      'id': id,
      'title': title,
      'image': image,
      'content': content,
      'created_by': createdBy,
      'created_at': createdAt,
    };
  }
}
