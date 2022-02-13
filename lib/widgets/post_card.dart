import 'package:blog_app/helpers/colors.dart';
import 'package:blog_app/models/post.dart';
import 'package:blog_app/routes/route_constants.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({required this.post, Key? key}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RouteConstant.VIEW_POST,
              arguments: post);
        },
        child: Card(
            elevation: 4.0,
            color: AppTheme.primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.border_color,
                        size: 18.0,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        post.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    post.body,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
