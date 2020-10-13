import 'package:blog_app/routing/route_constant.dart';
import 'package:flutter/material.dart';

import '../models/post.dart';
import '../screens/add_post.dart';
import '../screens/edit_post.dart';
import '../screens/home.dart';
import '../screens/profile.dart';
import '../screens/view_post.dart';
import 'undefined_view.dart';
import 'package:page_transition/page_transition.dart';

/*
*  we can use any type of screen transition.
*   fade,
  rightToLeft,
  leftToRight,
  upToDown,
  downToUp,
  scale,
  rotate,
  size,
  rightToLeftWithFade,
  leftToRightWithFade,
  * */

class RoutePage {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.ROOT:
        return PageTransition(child: HomePage(),duration: Duration(seconds: 1), type: PageTransitionType.leftToRight);

      case RouteConstant.ADD_POST:
        return PageTransition(child: AddPost(),duration: Duration(seconds: 1), type: PageTransitionType.leftToRight);

      case RouteConstant.EDIT_POST:
        Post post = settings.arguments as Post;
        return PageTransition(child: EditPost(post),duration: Duration(seconds: 1), type: PageTransitionType.leftToRightWithFade);

      case RouteConstant.VIEW_POST:
        Post post = settings.arguments as Post;
        return PageTransition(child: PostView(post),duration: Duration(seconds: 1), type: PageTransitionType.leftToRight);

      case RouteConstant.PROFILE:
        return PageTransition(child: Profile(),duration: Duration(seconds: 1), type: PageTransitionType.leftToRight);

      default:
        return MaterialPageRoute(
            builder: (_) => UndefinedView(
                  routeName: settings.name,
                ));
    }
  }
}
