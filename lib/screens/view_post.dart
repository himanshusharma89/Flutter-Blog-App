import 'package:flutter/material.dart';
import 'package:blog_app/models/post.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:blog_app/db/post_service.dart';

import 'edit_post.dart';
import 'home.dart';

class PostView extends StatefulWidget {
  final Post post;

  PostView(this.post);

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          widget.post.title,
          style: TextStyle(fontFamily: 'Roboto Mono'),
        ),
      ),
      backgroundColor: Color(0xffc8d9ff),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditPost(widget.post)));
                    //PostService postService = PostService(widget.post.toMap());
                    //postService.updatePost();
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.post.body,
                    style: TextStyle(fontFamily: 'Roboto Mono', fontSize: 16.0),
                  ),
                )),
              ),
            ),
            Divider(),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "Published:" +
                          timeago.format(DateTime.fromMillisecondsSinceEpoch(
                              widget.post.date)),
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xff133337),
                          fontFamily: 'Roboto Mono'),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    PostService postService = PostService(widget.post.toMap());
                    postService.deletePost();
                    Navigator.pop(context);
                    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
                // IconButton(icon: Icon(Icons.edit),
                // onPressed: (){
                //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EditPost(widget.post)));
                //   //PostService postService = PostService(widget.post.toMap());
                //   //postService.updatePost();
                // },
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
