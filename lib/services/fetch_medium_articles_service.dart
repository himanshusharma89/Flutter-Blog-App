import 'dart:convert';

import 'package:blog_app/models/article.dart';
import 'package:blog_app/providers/medium_article_notifier.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchMediumArticleService {
  static const String API_ENDPOINT =
      'https://api.rss2json.com/v1/api.json?rss_url=https://medium.com/feed/@';

  static Future<void> getPosts(
      MediumArticleNotifier mediumArticleNotifier, String username) async {
    final String url = API_ENDPOINT + username;
    final List<Article> articleList = <Article>[];
    http.get(Uri.parse(url)).then(
      (http.Response response) {
        debugPrint('Response status: ${response.statusCode}');
        if (response.statusCode == 200) {
          final List<Map<String, dynamic>> posts =
              new List<Map<String, dynamic>>.from(
                  jsonDecode(response.body)["items"]);
          posts.forEach(
            (Map<String, dynamic> element) {
              articleList.add(
                Article.fromMap(element),
              );
            },
          );
          mediumArticleNotifier.setloader(true);
          mediumArticleNotifier.setArticleList(articleList);
        } else {
          mediumArticleNotifier.setloader(false);
        }
      },
    );
  }
}
