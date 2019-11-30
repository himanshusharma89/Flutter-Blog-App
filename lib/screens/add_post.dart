import 'package:blog_app/db/PostService.dart';
import 'package:blog_app/models/post.dart';
import 'package:blog_app/screens/home.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final GlobalKey<FormState> formkey = new GlobalKey();
   Post post = Post(0," ", " ");

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Post"),
        elevation: 0.0,
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Post Title",
                  border: OutlineInputBorder()
                ),
                onSaved: (val) => post.title = val,
                validator: (val) {
                  if(val.isEmpty){
                    return "Title filed can't be empty";
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Post Body",
                  border: OutlineInputBorder()
                ),
                onSaved: (val) => post.body = val,
                validator: (val){
                  if(val.isEmpty){
                    return "Body field can't be empty";
                  }
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            insertPost();
            Navigator.pop(context);
            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Icon(
            Icons.add, 
            //color=Colors.white,
            ),
          backgroundColor: Colors.purple,
          tooltip: "Add a post",
        ),
    );
  }

  void insertPost() {
    final FormState form =formkey.currentState;
    if(form.validate()){
      form.save();
      form.reset();
      post.date = DateTime.now().millisecondsSinceEpoch;
      PostService postService = PostService(post.toMap());
      postService.addPost();
    }
  }
  
}