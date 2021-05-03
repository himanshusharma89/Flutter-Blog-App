import 'package:blog_app/routes/route_constants.dart';
import 'package:blog_app/services/post_service.dart';
import 'package:blog_app/widgets/floating_button.dart';
import 'package:blog_app/models/post.dart';
import 'package:flutter/material.dart';

class EditPost extends StatefulWidget {
  const EditPost(this.post);

  final Post post;

  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  TextEditingController titleEditingController;
  TextEditingController bodyEditingController;
  final GlobalKey<FormState> _formkey = GlobalKey();

  @override
  void initState() {
    super.initState();
    titleEditingController = TextEditingController(text: widget.post.title);
    bodyEditingController = TextEditingController(text: widget.post.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Post',
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
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: titleEditingController,
                decoration: const InputDecoration(
                    filled: true,
                    labelText: 'Post Title',
                    border: OutlineInputBorder()),
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
                    filled: true,
                    labelText: 'Post Body',
                    border: OutlineInputBorder()),
                maxLines: 10,
                validator: (String val) {
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
          buttonText: 'Save Changes',
          onPressed: () {
            updatePost();
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void updatePost() {
    debugPrint(
        'updatePost form validation:${_formkey.currentState.validate()}');
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      final Post post = Post(
          key: widget.post.key,
          title: titleEditingController.text,
          body: bodyEditingController.text,
          date: DateTime.now().millisecondsSinceEpoch);
      PostService().updatePost(post);
      _formkey.currentState.reset();
      Navigator.pushReplacementNamed(context, RouteConstant.ROOT);
    }
  }
}
