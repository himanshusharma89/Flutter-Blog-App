import 'package:blog_app/models/post.dart';
import 'package:firebase_database/firebase_database.dart';

class PostService {
  String nodeName = 'posts';
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference _databaseReference;

  void addPost(Post post) {
    //refrence to Posts node
    _databaseReference = database.reference().child(nodeName);
    _databaseReference.push().set(post.toMap());
  }

  void deletePost(Post post) {
    _databaseReference = database.reference().child('$nodeName/${post.key}');
    _databaseReference.remove();
  }

  void updatePost(Post post) {
    _databaseReference = database.reference().child('$nodeName/${post.key}');
    _databaseReference.update(post.toMap());
  }
}
