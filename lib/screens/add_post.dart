import 'package:flutter/material.dart';
import '../db/post_service.dart';
import '../models/post.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  Post post = Post(0, " ", " ");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Add Post",
        ),
      ),
      body: ListView(
        children: [
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Post Title",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(right: 15, left: 15),
                    ),
                    onChanged: (value) => post.title = value,
                    onSaved: (val) => post.title = val,
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Title filed can't be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Post Body",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(
                          right: 15, top: 15, bottom: 50, left: 15),
                    ),
                    maxLines: 7,
                    onChanged: (value) => post.body = value,
                    onSaved: (val) => post.body = val,
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Body field can't be empty";
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addPost();
          //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Icon(
          Icons.add,
        ),
        tooltip: "Add a post",
      ),
    );
  }

  void addPost() {
    print("addPost form validation:"+ _formkey.currentState.validate().toString());
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      _formkey.currentState.reset();
      print("addPost" + post.toString());
      post.date = DateTime.now().millisecondsSinceEpoch;
      PostService postService = PostService(post.toMap());
      postService.addPost();
      Navigator.pop(context);
    }
  }
}
