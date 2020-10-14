class Article {
  String title;
  String author;
  String thumbnail;
  String link;

  Article();

  Article.fromMap(Map<String, dynamic> data) {
    title = data['title'];
    author = data['author'];
    thumbnail = data['thumbnail'];
    link = data['link'];
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'title': title,
  //     'author': author,
  //     'thumbnail': thumbnail,
  //     'link': link,
  //   };
  // }
}
