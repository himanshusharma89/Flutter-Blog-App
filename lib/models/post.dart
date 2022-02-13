import 'package:firebase_database/firebase_database.dart';

class Post {
  Post({required this.date, required this.title, required this.body, this.key});

  factory Post.fromSnapshot(DataSnapshot snap) => Post(
      body: snap.child('body').value as String,
      date: snap.child('date').value as int,
      key: snap.key,
      title: snap.child('title').value as String);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'body': body,
      'date': date,
      'key': key,
      'title': title
    };
  }

  final int date;
  final String? key;
  final String title;
  final String body;
}
