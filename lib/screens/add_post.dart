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
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.deepPurple),
          onPressed: ()=> Navigator.pop(context),
        ),
        title: Text(
          "Add Post",
          style: TextStyle(
              fontFamily: 'Roboto Mono',
              color: Colors.deepPurple
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 30),
            icon: Icon(
              Icons.add,
              color: Colors.deepPurple,
            ),
            onPressed: (){
              insertPost();
              Navigator.pop(context);
            },
          )
        ],
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
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
              child: Container(
                child: TextFormField(
                  maxLines: 15,
                  decoration: InputDecoration(
                      hintText: "Post Body",
                      hintStyle: TextStyle(fontFamily: 'Roboto Mono'),
                      border: OutlineInputBorder()),
                  onSaved: (val) => post.body = val,
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Body field can't be empty";
                    }
                  },
                ),
              ),
            )
          ],
        ),
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
