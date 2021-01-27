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
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => HomePage(),
            transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
        );

      case RouteConstant.ADD_POST:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => AddPost(),
            transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
        );

      case RouteConstant.EDIT_POST:
        Post post = settings.arguments as Post;
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => EditPost(post),
            transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
        );

      case RouteConstant.VIEW_POST:
        Post post = settings.arguments as Post;
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => PostView(post),
            transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
        );

      case RouteConstant.ABOUT:
        return PageRouteBuilder(
          settings: settings,
            pageBuilder: (_, __, ___) => About(),
            transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
        );
        // return MaterialPageRoute(builder: (_) => About());

      case RouteConstant.MEDIUM_ARTICLES:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => MediumArticles(),
            transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
        );

      case RouteConstant.MEDIUM_ARTICLES_WEB_VIEW:
        final Map arguments = settings.arguments as Map;
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => MediumArticlesWebView(
                title: arguments['title'],
                url: arguments['url']
            ),
            transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
        );

      default:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => UndefinedView(
              routeName: settings.name,
            ),
            transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
        );
    }
  }
}
