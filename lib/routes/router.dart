import 'package:blog_app/routes/route_constants.dart';
import 'package:blog_app/views/about.dart';
import 'package:blog_app/views/home.dart';
import 'package:blog_app/views/medium/medium_articles.dart';
import 'package:blog_app/views/medium/medium_articles_webview.dart';
import 'package:flutter/material.dart';

import '../models/post.dart';
import '../views/post/add_post.dart';
import '../views/post/edit_post.dart';
import '../views/post/view_post.dart';
import '../views/undefined_route.dart';

class RoutePage {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.ROOT:
        return PageRouteBuilder<dynamic>(
            settings: settings,
            pageBuilder: (_, __, ___) => HomePage(),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case RouteConstant.ADD_POST:
        return PageRouteBuilder<dynamic>(
            settings: settings,
            pageBuilder: (_, __, ___) => AddPost(),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case RouteConstant.EDIT_POST:
        final Post post = settings.arguments as Post;
        return PageRouteBuilder<dynamic>(
            settings: settings,
            pageBuilder: (_, __, ___) => EditPost(post),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case RouteConstant.VIEW_POST:
        final Post post = settings.arguments as Post;
        return PageRouteBuilder<dynamic>(
            settings: settings,
            pageBuilder: (_, __, ___) => PostView(post),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case RouteConstant.ABOUT:
        return PageRouteBuilder<dynamic>(
            settings: settings,
            pageBuilder: (_, __, ___) => About(),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));
      // return MaterialPageRoute(builder: (_) => About());

      case RouteConstant.MEDIUM_ARTICLES:
        return PageRouteBuilder<dynamic>(
            settings: settings,
            pageBuilder: (_, __, ___) => MediumArticles(),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case RouteConstant.MEDIUM_ARTICLES_WEB_VIEW:
        final Map<String, String> arguments =
            settings.arguments as Map<String, String>;
        return PageRouteBuilder<dynamic>(
            settings: settings,
            pageBuilder: (_, __, ___) => MediumArticlesWebView(
                title: arguments['title']!, url: arguments['url']!),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      default:
        return PageRouteBuilder<dynamic>(
            settings: settings,
            pageBuilder: (_, __, ___) => UndefinedView(
                  routeName: settings.name!,
                ),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));
    }
  }
}
