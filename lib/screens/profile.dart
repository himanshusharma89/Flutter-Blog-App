import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Developer",
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 22.0,
            fontFamily: 'Roboto Mono',
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: new IconThemeData(color: Theme.of(context).primaryColor,),
      ),
      //backgroundColor: Colors.deepPurple,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: new Stack(
            children: <Widget>[
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
                      height: 150.0,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 58.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Himanshu Sharma",
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w600,
                              )
                            ),
                            SizedBox(height: 8.0,),
                            GestureDetector(
                              child: Image.asset('assets/GitHub.png'),
                              onTap: () async {
                                const url = 'https://github.com/himanshusharma89';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                            ) 
                          ],
                        ),
                      )
                    ),
                  ),
                ),
              ),
            Positioned(
              top: .0,
              left: .0,
              right: .0,
              child: Center(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/flutter_dev.png'),
                ),
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
}