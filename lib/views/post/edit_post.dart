import 'package:blog_app/services/post_service.dart';
import 'package:blog_app/helpers/constants.dart';
import 'package:blog_app/widgets/floating_button.dart';
import 'package:blog_app/models/post.dart';
import 'package:flutter/material.dart';

class EditPost extends StatefulWidget {
  final Post post;

  EditPost(this.post);

  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  final GlobalKey<FormState> _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Post",
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: widget.post.title,
                decoration: InputDecoration(
                    filled: true,
                    labelText: "Post Title",
                    border: OutlineInputBorder()),
                onChanged: (value) => widget.post.title = value,
                onSaved: (val) => widget.post.title = val,
                validator: (val) {
                  if (val.isEmpty) {
                    return "Title filed can't be empty";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                initialValue: widget.post.body,
                decoration: InputDecoration(
                    filled: true,
                    labelText: "Post Body",
                    border: OutlineInputBorder()),
                onChanged: (value) => widget.post.body = value,
                maxLines: 10,
                onSaved: (val) => widget.post.body = val,
                validator: (val) {
                  if (val.isEmpty) {
                    return "Body feild can't be empty";
                  }
                  return null;
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingButton(
          buttonText: "Save Changes",
          onPressed: () {
            updatePost();
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void updatePost() {
    print("updatePost form validation:" +
        _formkey.currentState.validate().toString());
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      _formkey.currentState.reset();
      widget.post.date = DateTime.now().millisecondsSinceEpoch;
      PostService postService = PostService(widget.post.toMap());
      postService.updatePost();
      Navigator.pushReplacementNamed(context, RouteConstant.ROOT);
    }
  }
}
