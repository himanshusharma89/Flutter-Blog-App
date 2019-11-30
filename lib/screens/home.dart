import 'package:blog_app/models/post.dart';
import 'package:blog_app/screens/viewPost.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'add_post.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String nodeName = "posts";
  List<Post> postsList = <Post>[];

  @override
  void initState() {
    _database.reference().child(nodeName).onChildAdded.listen(_childAdded);
    _database.reference().child(nodeName).onChildRemoved.listen(_childRemoves);
        _database.reference().child(nodeName).onChildChanged.listen(_childChanged);
                  }
                
                  @override
                  Widget build(BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text("Blog App"),
                        backgroundColor: Theme.of(context).primaryColor,
                        centerTitle: true,
                      ),
                      body:
                        Container(
                          color: Colors.white,
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
                                  child: FirebaseAnimatedList(query: _database.reference().child('posts'),
                                  itemBuilder: (_, DataSnapshot snap, Animation<double> animation, int index){
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        color: Colors.blue,
                                        child: ListTile(
                                          title: ListTile(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> PostView(postsList[index])));
                                            },
                                            title: Text(
                                            postsList[index].title,
                                            style: TextStyle(color:Colors.white,fontSize: 22.0,fontWeight: FontWeight.bold),
                                            ),
                                            trailing: Text(
                                              timeago.format(DateTime.fromMillisecondsSinceEpoch(postsList[index].date)),
                                              style:TextStyle(fontSize: 14.0, color: Colors.black45),
                                            ),
                                          ), 
                                          subtitle: Padding(
                                              padding: const EdgeInsets.only(bottom:12.0,left: 12.0),
                                              child: Text(postsList[index].body,
                                              style: TextStyle(color:Colors.white),),
                                            ), 
                                        ),
                                      ),
                                    );
                                  },),
                                ),
                              )
                            ],
                          ),
                        ),
                        floatingActionButton: FloatingActionButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>AddPost()));
                          },
                          child: Icon(
                            Icons.edit, 
                            //color=Colors.white,
                            ),
                          backgroundColor: Colors.purple,
                          tooltip: "Add a post",
                        ),
                        drawer: new Drawer(
                          child: new ListView(
                            children: <Widget>[
                              new UserAccountsDrawerHeader(
                                accountName: Text("Blog App",
                                style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold)),
                                accountEmail: Text("First Blog app using Flutter"),
                              ),
                              new ListTile(
                                title: Text("About",
                                style:TextStyle(fontSize: 10.0)),
                                leading: Icon(Icons.details,color: Colors.purple,),
                              ),
                              Divider(
                                height: 10.0,
                                color: Colors.black,
                              ),
                              new ListTile(
                                title: Text("Close"),
                                trailing: Icon(Icons.close),
                                onTap: (){
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          ),
                        ),
                      );
                  }
                
                   _childAdded(Event event) {
                    setState(() {
                      postsList.add(Post.fromSnapshot(event.snapshot));
                    });
                  }
            
              void _childRemoves(Event event) {
                var deletedPost = postsList.singleWhere((post){
                  return post.key == event.snapshot.key;
                });
        
                setState(() {
                  postsList.removeAt(postsList.indexOf(deletedPost));
                });
          }
        
          void _childChanged(Event event) {
            var changedPost = postsList.singleWhere((post){
                  return post.key == event.snapshot.key;
                });
                setState(() {
                  postsList[postsList.indexOf(changedPost)] = Post.fromSnapshot(event.snapshot);
                });
  }
}