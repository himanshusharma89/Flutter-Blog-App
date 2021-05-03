import 'package:blog_app/widgets/floating_button.dart';
import 'package:flutter/material.dart';

import '../../models/post.dart';
import '../../services/post_service.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController bodyEditingController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Add Post',
        ),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: titleEditingController,
                decoration: const InputDecoration(
                  labelText: 'Post Title',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(right: 15, left: 15),
                ),
                validator: (String val) {
                  if (val.isEmpty) {
                    return "Title filed can't be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: bodyEditingController,
                decoration: const InputDecoration(
                  labelText: 'Post Body',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(
                      right: 15, top: 15, bottom: 50, left: 15),
                ),
                maxLines: 7,
                validator: (String val) {
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
      floatingActionButton: FloatingButton(
          buttonText: 'Add The Post',
          onPressed: () {
            addPost();
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void addPost() {
    debugPrint('addPost form validation:${_formkey.currentState.validate()}');
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      final Post post = Post(
          title: titleEditingController.text,
          body: bodyEditingController.text,
          date: DateTime.now().millisecondsSinceEpoch);
      debugPrint('addPost${post.toString}');
      PostService().addPost(post);
      _formkey.currentState.reset();
      Navigator.pop(context);
    }
  }
}
