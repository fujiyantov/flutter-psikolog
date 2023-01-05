class Schedules {
  int? id;
  int? patientId;
  String? patientName;
  int? psikologId;
  String? psikologName;
  int? topicId;
  String? topicName;
  String? topicImage;
  String? date;
  String? time;
  int? type;
  String? diagnosis;
  int? status;
  String? createdAt;

  Schedules({
    this.id,
    this.patientId,
    this.patientName,
    this.psikologId,
    this.psikologName,
    this.topicId,
    this.topicName,
    this.topicImage,
    this.date,
    this.time,
    this.type,
    this.diagnosis,
    this.status,
    this.createdAt,
  });

  Schedules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    patientName = json['patient_name'];
    psikologId = json['psikolog_id'];
    psikologName = json['psikolog_name'];
    topicId = json['topic_id'];
    topicName = json['topic_name'];
    topicImage = json['topic_image'];
    date = json['date'];
    time = json['time'];
    type = json['type'];
    diagnosis = json['diagnosis'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'patient_id' : patientId,
      'patient_name' : patientName,
      'psikolog_id' : psikologId,
      'psikolog_name' : psikologName,
      'topic_id' : topicId,
      'topic_name' : topicName,
      'topic_image' : topicImage,
      'date' : date,
      'time' : time,
      'type' : type,
      'diagnosis' : diagnosis,
      'status' : status,
      'created_at' : createdAt,
    };
  }
}
