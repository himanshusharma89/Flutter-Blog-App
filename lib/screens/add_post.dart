import 'package:blog_app/db/post_service.dart';
import 'package:blog_app/models/post.dart';
import 'package:blog_app/screens/home.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final GlobalKey<FormState> formkey = new GlobalKey();
  Post post = Post(0, " ", " ");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.deepPurple,
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        centerTitle: true,
        title: Text(
          "Add Post",
          style: TextStyle(
            fontFamily: 'Roboto Mono',
            color: Colors.deepPurple,
            fontSize: 22.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Post Title",
                    labelStyle: TextStyle(
                      fontFamily: 'Roboto Mono',
                    ),
                    border: OutlineInputBorder()),
                onSaved: (val) => post.title = val,
                validator: (val) {
                  if (val.isEmpty) {
                    return "Title filed can't be empty";
                  }
                  return val;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
              child: Container(
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Post Body",
                      labelStyle: TextStyle(fontFamily: 'Roboto Mono'),
                      border: OutlineInputBorder()),
                  onSaved: (val) => post.body = val,
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Body field can't be empty";
                    }
                    return val;
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          insertPost();
          Navigator.pop(context);
          //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Icon(
          Icons.add,
          //color=Colors.white,
        ),
        backgroundColor: Colors.deepPurple,
        tooltip: "Add a post",
      ),
    );
  }

  void insertPost() {
    final FormState form = formkey.currentState;
    if (form.validate()) {
      form.save();
      form.reset();
      post.date = DateTime.now().millisecondsSinceEpoch;
      PostService postService = PostService(post.toMap());
      postService.addPost();
    }
  }
}
