class Topics {
  int? id;
  String? title;
  String? category;
  String? image;
  String? description;

  Topics(
    this.id,
    this.title,
    this.category,
    this.image,
    this.description,
  );

  Topics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    return { 
      'id': id,
      'title': title,
      'image': image,
      'content': description,
      'category': category,
    };
  }
}
