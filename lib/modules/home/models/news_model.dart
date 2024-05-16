class NewsModel {
  String? by;
  int? descendants;
  int? id;
  List<dynamic>? kids;
  int? score;
  int? time;
  String? title;
  String? type;
  String? url;

  NewsModel(
      {this.by,
        this.descendants,
        this.id,
        this.kids,
        this.score,
        this.time,
        this.title,
        this.type,
        this.url});

  NewsModel.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    descendants = json['descendants'];
    id = json['id'];
    kids = json['kids'];
    score = json['score'];
    time = json['time'];
    title = json['title'];
    type = json['type'];
    url = json['url'];
  }
}