import 'dart:convert';

import 'package:blog_app/models/article.dart';
import 'package:blog_app/notifier/medium_Article_notifier.dart';
import 'package:http/http.dart' as http;

class FetchService {
  static const String API_ENDPOINT =
      "https://api.rss2json.com/v1/api.json?rss_url=https://medium.com/feed/@";

  static getPosts(
      MediumArticleNotifier mediumArticleNotifier, String username) async {
    String url = API_ENDPOINT + username;
    List<Article> articleList = [];
    http.get(url).then(
          (response) {
        print('Response status: ${response.statusCode}');
        if (response.statusCode == 200) {
          print('Response body: ${response.body}');
          var posts = jsonDecode(response.body);
          print("Posts : ${posts["items"]}");
          posts["items"].forEach(
                (element) {
              articleList.add(
                Article.fromMap(element),
              );
            },
          );

          print(articleList.length);
          mediumArticleNotifier.setloader(true);
          mediumArticleNotifier.setArticleList(articleList);
        } else {
          mediumArticleNotifier.setloader(false);
        }
      },
    );
  }
}
