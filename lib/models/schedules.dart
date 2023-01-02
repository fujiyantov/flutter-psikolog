class Schedules {
  int? patientId;
  int? psikologId;
  int? topicId;
  String? date;
  String? time;
  int? type;
  String? diagnosis;
  int? status;

  Schedules({
    this.patientId,
    this.psikologId,
    this.topicId,
    this.date,
    this.time,
    this.type,
    this.diagnosis,
    this.status,
  });

  Schedules.fromJson(Map<String, dynamic> json) {
    patientId = json['patient_id'];
    psikologId = json['psikolog_id'];
    topicId = json['topic_id'];
    date = json['date'];
    time = json['time'];
    type = json['type'];
    diagnosis = json['diagnosis'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    return {
      'patient_id' : patientId,
      'psikolog_id' : psikologId,
      'topic_id' : topicId,
      'date' : date,
      'time' : time,
      'type' : type,
      'diagnosis' : diagnosis,
      'status' : status,
    };
  }
}
