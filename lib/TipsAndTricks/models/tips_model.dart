class Tips {
  final String title;
  final String desc;
  final String imageUrl;
  final String source;

  const Tips({
    required this.title,
    required this.desc,
    required this.imageUrl,
    required this.source,
  });

  factory Tips.fromJson(Map<String, dynamic> json) {
    return Tips(
      source: json['source'],
      desc: json['desc'],
      title: json['title'],
      imageUrl: json['imageUrl']
    );
  }
}