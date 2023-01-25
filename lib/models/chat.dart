class Chat {
  int? id;
  int? scheduleId;
  int? patientId;
  int? psikologId;
  String? messages;
  int? isRead;
  String? createdAt;
  bool? isSender;

  Chat(
    this.id,
    this.scheduleId,
    this.patientId,
    this.psikologId,
    this.messages,
    this.isRead,
    this.createdAt,
    this.isSender,
  );

  Chat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scheduleId = json['schedule_id'];
    patientId = json['patient_id'];
    psikologId = json['psikolog_id'];
    messages = json['messages'];
    isRead = json['is_read'];
    createdAt = json['created_at'];
    isSender = json['is_sender'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'schedule_id': scheduleId,
      'patient_id': patientId,
      'psikolog_id': psikologId,
      'messages': messages,
      'is_read': isRead,
      'created_at': createdAt,
      'is_sender': isSender,
    };
  }
}
