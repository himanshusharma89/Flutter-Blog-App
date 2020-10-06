import 'package:blog_app/models/article.dart';
import 'package:flutter/material.dart';

class MediumArticleNotifier with ChangeNotifier {
  List<Article> _articleList = [];

  setArticleList(List<Article> articleList) {
    _articleList = [];
    _articleList = articleList;
    notifyListeners();
  }

  List<Article> getArticleList() {
    return _articleList;
  }
}
