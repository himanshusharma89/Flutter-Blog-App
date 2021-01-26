import 'package:blog_app/helpers/constants.dart';
import 'package:blog_app/providers/theme_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BlogDrawer extends StatefulWidget {
  @override
  _BlogDrawerState createState() => _BlogDrawerState();
}

class _BlogDrawerState extends State<BlogDrawer> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    var swithValue = themeChange.darkTheme;
    final height = MediaQuery.of(context).size.height;
    return Drawer(
        child: Stack(
          children: [
            ListView(
              children: <Widget>[
                Image.asset(
                  themeChange.darkTheme
                      ? 'assets/blog_flutter_dark.png'
                      : 'assets/blog_flutter_light.png',
                  fit: BoxFit.cover,
                  height: height * 0.15,
                ),
                Ink(
                  child: ListTile(
                    title: Text("About",
                        style: TextStyle(
                          fontSize: 15.0,
                          // color: Colors.black,
                          fontWeight: FontWeight.w600,
                        )),
                    trailing: Icon(
                      Icons.info,
                      color: Colors.blueAccent,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, RouteConstant.ABOUT);
                    },
                  ),
                ),
                Ink(
                  child: ListTile(
                    title: Text("Dark Mode",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                        )),
                    trailing: Transform.scale(
                      scale: 0.7,
                      origin: Offset(25, 0),
                      child: CupertinoSwitch(
                        activeColor: AppTheme.primaryColor,
                        value: swithValue,
                        onChanged: (bool value) {
                          setState(() {
                            swithValue = !swithValue;
                            themeChange.darkTheme = swithValue;
                          });
                          //print("Dark Mode");
                        },
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        swithValue = !swithValue;
                        themeChange.darkTheme = swithValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Ink(
                child: ListTile(
                  title: Text("Close",
                      style: TextStyle(
                        fontSize: 15.0,
                        // color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                  trailing: Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                  onTap: () {
                    SystemNavigator.pop();
                  },
                ),
              ),
            ),
          ],
        ),
      );
  }
}