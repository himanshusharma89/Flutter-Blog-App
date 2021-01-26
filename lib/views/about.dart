import 'package:blog_app/helpers/constants.dart';
import 'package:blog_app/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Want to pen down your thoughts in the form of a blog anonymously?",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700),
              ),
              Text(
                "This is just the App for you! You can post your blogs and no one can know about the original poster.",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: Card(
                      elevation: 5.0,
                      margin: const EdgeInsets.only(top: 45.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Himanshu Sharma",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                )),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: social
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: GestureDetector(
                                            child: CachedNetworkImage(
                                              imageUrl: e['iconURL'],
                                              height: 26,
                                              width: 26,
                                              placeholder: (_, str) =>
                                                  CircularProgressIndicator(),
                                            ),
                                            onTap: () =>
                                                launcher.launcher(e['URL'])),
                                      ),
                                    )
                                    .toList()),
                            SizedBox(
                              height: 10.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'The Developer behind this project',
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ],
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
                        radius: 40.0,
                        backgroundImage: CachedNetworkImageProvider(
                            'https://avatars0.githubusercontent.com/u/44980497?v=4'),
                      ),
                    ),
                  )
                ],
              ),
              Card(
                margin: const EdgeInsets.only(top: 20),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Contributors ✨",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w600)),
                      SizedBox(height: 10.0),
                      GridView.builder(
                          itemCount: contributors.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 4,
                                  crossAxisSpacing: 4,
                                  childAspectRatio: 1 / 0.9),
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              contributors[index]
                                                  ['avatar_url']))),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  contributors[index]['login'],
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            );
                          }),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 5.0,
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Contributing",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w600)),
                        SizedBox(height: 10.0),
                        Text(
                          "If you wish to contribute a change to any of the existing features in this application, please review our contribution guide and send a pull request.",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10.0),
                        GestureDetector(
                            child: Image.asset(
                              'assets/contribute_icon.png',
                              height: 26,
                              width: 26,
                            ),
                            onTap: () => launcher.launcher(
                                'https://github.com/himanshusharma89/Flutter-Blog-App')),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Data {
  String img;
  String data;

  Data(this.img, this.data);
} //Class to hold the image path and data to be displayed
