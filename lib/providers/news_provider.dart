import 'package:flutter/material.dart';
import 'package:psikolog/models/news.dart';
import 'package:psikolog/services/news_service.dart';

class NewsProvider extends ChangeNotifier {
  List<News> _news = [];
  News? _newsDetail;

  // Getter
  List<News> get news => _news;
  News? get newsDetail => _newsDetail;

  // Setter
  set news(List<News> news) {
    _news = news;
    notifyListeners();
  }

  set newsDetail(News? newsDetail) {
    _newsDetail = newsDetail;
    notifyListeners();
  }

  Future<void> getAll({String? token}) async {
    try {
      List<News> news = await NewsService().getAll(token: token);
      _news = news;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> getDetail({
    String? token,
    int? id,
  }) async {
    try {
      News newsDetail = await NewsService().getDetail(
        token: token,
        id: id,
      );
      _newsDetail = newsDetail;
      return true;
    } catch (e) {
      return false;
    }
  }
}
