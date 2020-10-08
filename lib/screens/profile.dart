import 'package:blog_app/screens/data.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Data> tech = [                         //Static List of icons and texts
    Data("assets/flutter_icon.png", "Flutter"),
    Data("assets/firebase_icon.png", "FireBase"),
    Data("assets/android_icon.png","Android"),
    Data("assets/ios_icon.png", "IOS"),
    Data("assets/developer.png","Himanshu Sharma")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Developer",
          style: TextStyle(
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: new Stack(
              children: <Widget>[
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 380.0,
                        child: Card(
                          //color: Colors.deepPurple,
                          elevation: 5.0,
                          //color: Color(0xFF8C9EFF),
                          margin: const EdgeInsets.only(top: 50.0),
                          child: SizedBox(
                              height: 250.0,
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 58.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Himanshu Sharma",
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          color: Colors.deepPurple,
                                          fontWeight: FontWeight.w600,
                                        )),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    GestureDetector(
                                      child: Image.asset('assets/GitHub.png'),
                                      onTap: () async {
                                        const url =
                                            'https://github.com/himanshusharma89';
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Wanna pen down your thoughts in the form of a blog?",
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          "This is just the App for you!",
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          "Happy Blogging!",
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ),
                    Container(
                      width: 360.0,
                      child: Card(
                        //color: Colors.deepPurple,
                        elevation: 5.0,
                        //color: Color(0xFF8C9EFF),
                        margin: const EdgeInsets.only(top: 20.0),
                        child: SizedBox(
                            height: 180.0,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text("Tech Stack",
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(height: 10.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(tech.elementAt(0).img),
                                            radius: 18.0,
                                          ),
                                          CircleAvatar(
                                            backgroundImage: AssetImage(tech.elementAt(1).img),
                                            backgroundColor: Colors.white,
                                            radius: 20.0,
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 10.0),
                                      Column(
                                        children: [
                                          Text(
                                            tech.elementAt(0).data,
                                            style: TextStyle(
                                                fontSize: 17.0,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(height: 15.0),
                                          Text(
                                            tech.elementAt(1).data,
                                            style: TextStyle(
                                                fontSize: 17.0,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                    Container(
                      width: 360.0,
                      child: Card(
                        //color: Colors.deepPurple,
                        elevation: 5.0,
                        //color: Color(0xFF8C9EFF),
                        margin: const EdgeInsets.only(top: 20.0),
                        child: SizedBox(
                            height: 150.0,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text("Platforms",
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.w600)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                tech.elementAt(2).img),
                                            backgroundColor: Colors.white,
                                            radius: 22.0,
                                          ),
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                tech.elementAt(3).img),
                                            backgroundColor: Colors.transparent,
                                            radius: 18.0,
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 10.0),
                                      Column(
                                        children: [
                                          Text(
                                            tech.elementAt(2).data,
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontSize: 17.0,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(height: 15.0),
                                          Text(
                                            tech.elementAt(3).data,
                                            style: TextStyle(
                                                fontSize: 17.0,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                    Container(
                      width: 360.0,
                      child: Card(
                        //color: Colors.deepPurple,
                        elevation: 5.0,
                        //color: Color(0xFF8C9EFF),
                        margin: const EdgeInsets.only(top: 20.0),
                        child: SizedBox(
                            height: 100.0,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text("Contributors",
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(height: 10.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                tech.elementAt(4).img),
                                            backgroundColor: Colors.white,
                                            radius: 18.0,
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 10.0),
                                      Column(
                                        children: [
                                          Text(
                                            tech.elementAt(4).data,
                                            style: TextStyle(
                                                fontSize: 17.0,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: .0,
                  left: .0,
                  right: .0,
                  child: Center(
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/developer.png'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
