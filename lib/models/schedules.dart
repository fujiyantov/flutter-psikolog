class Schedules {
  int? patientId;
  String? patientName;
  int? psikologId;
  String? psikologName;
  int? topicId;
  String? topicName;
  String? date;
  String? time;
  int? type;
  String? diagnosis;
  int? status;
  String? createdAt;

  Schedules({
    this.patientId,
    this.patientName,
    this.psikologId,
    this.psikologName,
    this.topicId,
    this.topicName,
    this.date,
    this.time,
    this.type,
    this.diagnosis,
    this.status,
    this.createdAt,
  });

  Schedules.fromJson(Map<String, dynamic> json) {
    patientId = json['patient_id'];
    patientName = json['patient_name'];
    psikologId = json['psikolog_id'];
    psikologName = json['psikolog_name'];
    topicId = json['topic_id'];
    topicName = json['topic_name'];
    date = json['date'];
    time = json['time'];
    type = json['type'];
    diagnosis = json['diagnosis'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    return {
      'patient_id' : patientId,
      'patient_name' : patientName,
      'psikolog_id' : psikologId,
      'psikolog_name' : psikologName,
      'topic_id' : topicId,
      'topic_name' : topicName,
      'date' : date,
      'time' : time,
      'type' : type,
      'diagnosis' : diagnosis,
      'status' : status,
      'created_at' : createdAt,
    };
  }
}
