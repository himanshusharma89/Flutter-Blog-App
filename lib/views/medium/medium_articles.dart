import 'package:blog_app/models/article.dart';
import 'package:blog_app/providers/medium_article_notifier.dart';
import 'package:blog_app/providers/theme_notifier.dart';
import 'package:blog_app/routes/route_constants.dart';
import 'package:blog_app/services/fetch_medium_articles_service.dart';
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
  late List<dynamic> selected;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController myController = TextEditingController();

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
    final DarkThemeProvider themeChange =
        Provider.of<DarkThemeProvider>(context);
    final MediumArticleNotifier mediumArticleNotifier =
        Provider.of<MediumArticleNotifier>(context);
    final List<Article> articleList = mediumArticleNotifier.getArticleList();
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Search Medium Articles')),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: articleList.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: articleList.length,
                        itemBuilder: (_, int index) {
                          final Article article = articleList[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context,
                                  RouteConstant.MEDIUM_ARTICLES_WEB_VIEW,
                                  arguments: <String, String>{
                                    'title': article.title,
                                    'url': article.link
                                  });
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
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
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Author: ${article.author}',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: mediumArticleNotifier.getLoader()
                            ? const CircularProgressIndicator()
                            : const Text(
                                'Search Medium Articles by Author name.'),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Form(
                  key: _formKey,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          controller: myController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: 'Enter Username',
                            // hintStyle: TextStyle(color: Colors.white),
                          ),
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return "Username can't be empty";
                            }
                          },
                          style: TextStyle(
                              color: themeChange.darkTheme
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (mediumArticleNotifier
                              .getArticleList()
                              .isNotEmpty) {
                            mediumArticleNotifier.clearArticleList();
                            mediumArticleNotifier.setloader(false);
                          } else {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              mediumArticleNotifier.setloader(true);
                              FetchMediumArticleService.getPosts(
                                  mediumArticleNotifier, myController.text);
                            }
                          }
                        },
                        child: Text(articleList.isEmpty ? 'Fetch' : 'Clear'),
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
