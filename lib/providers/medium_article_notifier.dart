import 'package:blog_app/models/article.dart';
import 'package:flutter/material.dart';

class MediumArticleNotifier with ChangeNotifier {
  List<Article> _articleList = <Article>[];
  bool _status = false;

  void setArticleList(List<Article> articleList) {
    _articleList = <Article>[];
    _articleList = articleList;
    notifyListeners();
  }

  List<Article> getArticleList() {
    return _articleList;
  }

  void clearArticleList(){
    _articleList = <Article>[];
    notifyListeners();
  }

  void setloader(bool status) {
    _status = status;
    notifyListeners();
  }

  bool getLoader() {
    return _status;
  }
}
