import 'package:flutter/material.dart';
import 'package:psikolog/models/topics.dart';
import 'package:psikolog/services/topic_service.dart';

class TopicProvider extends ChangeNotifier {
  List<Topics> _topics = [];
  Topics? _topicDetail;

  // Getter
  List<Topics> get topics => _topics;
  Topics? get topicDetail => _topicDetail;

  // Setter
  set topics(List<Topics> topics) {
    _topics = topics;
    notifyListeners();
  }

  set topicDetail(Topics? topicDetail) {
    _topicDetail = topicDetail;
    notifyListeners();
  }

  Future getAll() async {
    try {
      List<Topics>? topics = await TopicService().getAll();
      _topics = topics;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> getDetail({
    int? id,
  }) async {
    try {
      Topics topicDetail = await TopicService().getDetail(
        id: id,
      );
      _topicDetail = topicDetail;
      return true;
    } catch (e) {
      return false;
    }
  }
}
