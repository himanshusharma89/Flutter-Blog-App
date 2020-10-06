import 'package:blog_app/models/article.dart';
import 'package:blog_app/notifier/medium_Article_notifier.dart';
import 'package:blog_app/screens/medium_post_view.dart';
import 'package:blog_app/service/fetch_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FetchMediumScreen extends StatefulWidget {
  @override
  State createState() {
    return FetchMediumScreenState();
  }
}

class FetchMediumScreenState extends State<FetchMediumScreen> {
  List<dynamic> selected;
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
          title: Row(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: myController,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                    hintText: "Type Username",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                flex: 0,
                child: RaisedButton(
                  child: Text("Fetch"),
                  onPressed: () {
                    FetchService.getPosts(mediumArticleNotifier, myController.text);
                  },
                ),
              ),
            ],
          )),
      body: Container(
        child: ListView.builder(
          itemCount: mediumArticleNotifier.getArticleList().length,
          itemBuilder: (context, index) {
            Article article = mediumArticleNotifier.getArticleList()[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MediumPostView(title: article.title, url: article.link),
                  ),
                );
              },
              child: Card(
                elevation: 16,
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Image.network(article.thumbnail),
                    Text(article.title),
                    Text(article.author),
                    Text(article.link),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
