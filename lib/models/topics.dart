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
  String? noTelp;
  String? meetAt;
  String? schedule2;
  String? dayName2;

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
    this.noTelp,
    this.meetAt,
    this.schedule2,
    this.dayName2,
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
    noTelp = json['no_telp'];
    meetAt = json['meet_at'];
    schedule2 = json['schedule2'];
    dayName2 = json['day_name2'];
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
      'no_telp': noTelp,
      'meet_at': meetAt,
      'schedule2': schedule2,
      'day_name2': dayName2,
    };
  }
}
