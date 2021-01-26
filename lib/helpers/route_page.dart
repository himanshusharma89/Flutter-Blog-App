import 'package:blog_app/helpers/constants.dart';
import 'package:blog_app/views/medium/medium_articles.dart';
import 'package:blog_app/views/medium/medium_articles_webview.dart';
import 'package:flutter/material.dart';

import '../models/post.dart';
import '../views/post/add_post.dart';
import '../views/post/edit_post.dart';
import '../views/home.dart';
import '../views/about.dart';
import '../views/post/view_post.dart';
import '../views/undefined_route.dart';

class RoutePage {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.ROOT:
        return MaterialPageRoute(builder: (_) => HomePage());

      case RouteConstant.ADD_POST:
        return MaterialPageRoute(builder: (_) => AddPost());

      case RouteConstant.EDIT_POST:
        Post post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => EditPost(post));

      case RouteConstant.VIEW_POST:
        Post post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post));

      case RouteConstant.ABOUT:
        return MaterialPageRoute(builder: (_) => About());

      case RouteConstant.MEDIUM_ARTICLES:
        return MaterialPageRoute(builder: (_) => MediumArticles());

      case RouteConstant.MEDIUM_ARTICLES_WEB_VIEW:
        final Map arguments = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (_) => MediumArticlesWebView(
                  title: arguments['title'],
                  url: arguments['url'],
                ));

      default:
        return MaterialPageRoute(
            builder: (_) => UndefinedView(
                  routeName: settings.name,
                ));
    }
  }
}
