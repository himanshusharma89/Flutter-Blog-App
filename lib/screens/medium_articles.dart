import 'package:blog_app/models/article.dart';
import 'package:blog_app/providers/medium_article_notifier.dart';
import 'package:blog_app/screens/medium_articles_webview.dart';
import 'package:blog_app/service/fetch_medium_articles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MediumArticles extends StatefulWidget {
  @override
  State createState() {
    return MediumArticlesState();
  }
}

class MediumArticlesState extends State<MediumArticles> {
  List<dynamic> selected;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediumArticleNotifier mediumArticleNotifier =
        Provider.of<MediumArticleNotifier>(context);
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Search Medium Articles')),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: mediumArticleNotifier.getArticleList().length != 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            mediumArticleNotifier.getArticleList().length,
                        itemBuilder: (context, index) {
                          Article article =
                              mediumArticleNotifier.getArticleList()[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MediumArticlesWebView(
                                      title: article.title, url: article.link),
                                ),
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    child: CachedNetworkImage(
                                      imageUrl: article.thumbnail,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      article.title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Author: " + article.author,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : mediumArticleNotifier.getLoader()
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Center(
                            child:
                                Text('Search Medium Articles by Author name.'),
                          ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Form(
                  key: _formKey,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: myController,
                          keyboardType: TextInputType.text,
                          decoration: new InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "Enter Username",
                            // hintStyle: TextStyle(color: Colors.white),
                          ),
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Username can't be empty";
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RaisedButton(
                        child: Text(
                            mediumArticleNotifier.getArticleList().length == 0
                                ? "Fetch"
                                : "Clear"),
                        onPressed: () {
                          if (mediumArticleNotifier.getArticleList().length !=
                              0) {
                            mediumArticleNotifier.clearArticleList();
                            mediumArticleNotifier.setloader(false);
                          } else {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              mediumArticleNotifier.setloader(true);
                              FetchService.getPosts(
                                  mediumArticleNotifier, myController.text);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
