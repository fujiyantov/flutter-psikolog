class Topics {
  int? id;
  String? title;
  String? category;
  String? image;
  String? description;
  int? day;
  String? time;
  String? schedule;
  String? dayName;

  Topics(
    this.id,
    this.title,
    this.category,
    this.image,
    this.description,
    this.day,
    this.time,
    this.schedule,
    this.dayName,
  );

  Topics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    category = json['category'];
    day = json['day'];
    time = json['time'];
    schedule = json['schedule'];
    dayName = json['day_name'];
  }

  Map<String, dynamic> toJson() {
    return { 
      'id': id,
      'title': title,
      'image': image,
      'content': description,
      'category': category,
      'day': day,
      'time': time,
      'schedule': schedule,
      'day_name': dayName,
    };
  }
}
