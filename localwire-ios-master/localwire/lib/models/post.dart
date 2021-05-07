class Post {
  final int id;
  final String title;
  final String author;
  final int featuredMedia;
  final String excerpt;
  final String date;
  final String content;
  final String image;
  final int views;
  final int shares;
  final int likes;
  bool isSaved = false;

  Post(
      {this.content,
      this.id,
      this.title,
      this.excerpt,
      this.date,
      this.image,
      this.author,
      this.featuredMedia,
      this.views,
      this.shares,
      this.likes});

  factory Post.fromJSON(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      date: json['date'] != null
          ? json['date'].toString().replaceFirst('T', ' ')
          : null,
      image: json['media'] != false
              ? json['media']
          : null,
      excerpt: json['excerpt'],
      author: json['author'],
      views: json['post_data']['views'] != "" ? int.parse(json['post_data']['views']) : 0,
      shares: json['post_data']['shares'] != "" ? int.parse(json['post_data']['shares']) : 0,
      likes: json['post_data']['likes'] != "" ? int.parse(json['post_data']['likes']) : 0
    );
  }

  static toMap(Post post) {
    return {
      'id': post.id,
      'title': post.title,
      'excerpt': post.excerpt,
      'content': post.content,
      'date': post.date,
      'author': post.author,
      'views': post.views,
      'shares': post.shares,
      'likes': post.likes,
      'image': post.image
    };
  }
}
