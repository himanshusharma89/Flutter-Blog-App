import 'package:blog_app/models/article.dart';
import 'package:flutter/material.dart';

class MediumArticleNotifier with ChangeNotifier {
  List<Article> _articleList = [];
  bool _status = false;

  setArticleList(List<Article> articleList) {
    _articleList = [];
    _articleList = articleList;
    notifyListeners();
  }

  List<Article> getArticleList() {
    return _articleList;
  }

  clearArticleList(){
    _articleList = [];
    notifyListeners();
  }

  setloader(bool status) {
    _status = status;
    notifyListeners();
  }

  bool getLoader() {
    return _status;
  }
}
