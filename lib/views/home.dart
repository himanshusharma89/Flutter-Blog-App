import 'package:blog_app/helpers/constants.dart';
import 'package:blog_app/models/post.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/post.dart';
import '../providers/theme_notifier.dart';
import 'drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String nodeName = "posts";
  List<Post> postsList = <Post>[];
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  bool swithValue = false;
  Query postQuery;

  @override
  void initState() {
    _database.reference().child(nodeName).onChildAdded.listen(_childAdded);
    _database.reference().child(nodeName).onChildRemoved.listen(_childRemoves);
    _database.reference().child(nodeName).onChildChanged.listen(_childChanged);
    postQuery = _database.reference().child('posts').orderByKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        key: _globalKey,
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.receipt),
              onPressed: () {
                Navigator.pushNamed(context, RouteConstant.MEDIUM_ARTICLES);
              },
            )
          ],
          elevation: 0,
          title: Image.asset(
            themeChange.darkTheme
                ? 'assets/blog_flutter_dark.png'
                : 'assets/blog_flutter_light.png',
            height: kToolbarHeight + 100,
          ),
          leading: IconButton(
              icon: Icon(Icons.menu_rounded),
              onPressed: () => _globalKey.currentState.openDrawer()),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Visibility(
                visible: postsList.isEmpty,
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              Visibility(
                visible: postsList.isNotEmpty,
                child: Flexible(
                  child: FirebaseAnimatedList(
                      query: postQuery,
                      itemBuilder: (_, DataSnapshot snap,
                          Animation<double> animation, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 5.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteConstant.VIEW_POST,
                                  arguments: postsList[index]);
                            },
                            child: Card(
                                elevation: 4.0,
                                color: AppTheme.primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.border_color,
                                            size: 18.0,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            postsList[index].title,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        postsList[index].body,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteConstant.ADD_POST);
          },
          child: Icon(
            Icons.add,
          ),
          tooltip: "Add a post",
        ),
        drawer: BlogDrawer());
  }

  _childAdded(Event event) {
    setState(() {
      postsList.add(Post.fromSnapshot(event.snapshot));
    });
  }

  void _childRemoves(Event event) {
    var deletedPost = postsList.singleWhere((post) {
      return post.key == event.snapshot.key;
    });

    setState(() {
      postsList.removeAt(postsList.indexOf(deletedPost));
    });
  }

  void _childChanged(Event event) {
    var changedPost = postsList.singleWhere((post) {
      return post.key == event.snapshot.key;
    });
    setState(() {
      postsList[postsList.indexOf(changedPost)] =
          Post.fromSnapshot(event.snapshot);
    });
  }
}
