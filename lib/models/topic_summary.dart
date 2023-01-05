class TopicSummary {
  String? topic;
  int? total;

  TopicSummary(
    this.topic,
    this.total,
  );

  TopicSummary.fromJson(Map<String, dynamic> json) {
    topic = json['topic'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    return { 
      'topic': topic,
      'total': total,
    };
  }
}
