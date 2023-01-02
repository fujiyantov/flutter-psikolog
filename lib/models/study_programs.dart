class StudyPrograms {
  int? id;
  int? facultyId;
  String? title;

  StudyPrograms({
    this.id,
    this.facultyId,
    this.title,
  });

  StudyPrograms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    facultyId = json['faculty_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'faculty_id': facultyId,
    };
  }
}
