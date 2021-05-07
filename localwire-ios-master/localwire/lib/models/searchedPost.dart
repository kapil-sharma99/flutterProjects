class SearchedPost {
  final int id;
  final String title;
  final String author;
  final int featuredMedia;
  final String excerpt;
  final String date;
  final String content;
  final String image;
  final String imageHigh;
  bool isSaved = false;

  SearchedPost(
      {this.content,
      this.id,
      this.title,
      this.excerpt,
      this.date,
      this.image,
      this.imageHigh,
      this.author,
      this.featuredMedia});

  factory SearchedPost.fromJSON(Map<String, dynamic> json) {
    return SearchedPost(
      id: json['id'],
      title: json['title']['rendered'],
      content: json['content']['rendered'],
      date: json['date'] != null
          ? json['date'].toString().replaceFirst('T', ' ')
          : null,
      image: json['_embedded']['wp:featuredmedia'] != null
              ? json['_embedded']['wp:featuredmedia'][0]['media_details']['sizes']['medium_large']['source_url']
          : null,
      imageHigh: json['_embedded']['wp:featuredmedia'] != null
          ? json['_embedded']['wp:featuredmedia'][0]['source_url']
          : null,
      excerpt: json['excerpt']['rendered'],
      author: json['_embedded']['author'][0]['name'],
    );
  }
}