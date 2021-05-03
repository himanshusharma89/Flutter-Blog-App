import 'package:blog_app/models/post.dart';
import 'package:blog_app/routes/route_constants.dart';
import 'package:blog_app/services/post_service.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostView extends StatefulWidget {
  const PostView(this.post);

  final Post post;

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.post.title,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      // backgroundColor: Color(0xffc8d9ff),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.post.body,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  )),
                ),
              ),
              const Divider(),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 4, 4, 4),
                      child: Text(
                        'Published:${timeago.format(DateTime.fromMillisecondsSinceEpoch(widget.post.date))}',
                        style: const TextStyle(
                          fontSize: 14.0,
                          // color: Color(0xff133337),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      PostService().deletePost(widget.post);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteConstant.EDIT_POST,
              arguments: widget.post);
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
