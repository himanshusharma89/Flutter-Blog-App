import 'package:blog_app/helpers/constants.dart';
import 'package:blog_app/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            children: <Widget>[
              const Text(
                'Want to pen down your thoughts in the form of a blog anonymously?',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700),
              ),
              const Text(
                'This is just the App for you! You can post your blogs and no one can know about the original poster.',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 5.0,
                      margin: const EdgeInsets.only(top: 45.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0, bottom: 15),
                        child: Column(
                          children: <Widget>[
                            const Text('Himanshu Sharma',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                )),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: social
                                    .map(
                                      (Map<String, String> e) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: GestureDetector(
                                          onTap: () =>
                                              launcher.launcher(e['URL']!),
                                          child: CachedNetworkImage(
                                            imageUrl: e['iconURL']!,
                                            height: 26,
                                            width: 26,
                                            placeholder: (_, String str) =>
                                                const CircularProgressIndicator(),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList()),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              'The Developer behind this project',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
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
                    children: <Widget>[
                      const Text('Contributors ✨',
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10.0),
                      GridView.builder(
                          itemCount: contributors.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 4,
                                  crossAxisSpacing: 4,
                                  childAspectRatio: 1 / 0.9),
                          primary: false,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, int index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              contributors[index]['avatar_url']
                                                  as String))),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  contributors[index]['login'] as String,
                                  style: const TextStyle(fontSize: 13),
                                )
                              ],
                            );
                          }),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 5.0,
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Column(
                      children: <Widget>[
                        const Text('Contributing',
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 10.0),
                        const Text(
                          'If you wish to contribute a change to any of the existing features in this application, please review our contribution guide and send a pull request.',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10.0),
                        GestureDetector(
                          onTap: () => launcher.launcher(
                              'https://github.com/himanshusharma89/Flutter-Blog-App'),
                          child: Image.asset(
                            'assets/contribute_icon.png',
                            height: 26,
                            width: 26,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}