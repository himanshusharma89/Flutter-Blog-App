class Article {
  Article(
      {required this.title,
      required this.author,
      required this.thumbnail,
      required this.link});

  factory Article.fromMap(Map<String, dynamic> data) {
    return Article(
        title: data['title'] as String,
        author: data['author'] as String,
        thumbnail: data['thumbnail'] as String,
        link: data['link'] as String);
  }

  final String title;
  final String author;
  final String thumbnail;
  final String link;

// Map<String, dynamic> toMap() {
//   return {
//     'title': title,
//     'author': author,
//     'thumbnail': thumbnail,
//     'link': link,
//   };
// }
}
