class CommentsModel {
  String? by;
  int? id;
  List<dynamic>? kids;
  int? parent;
  String? text;
  int? time;
  String? type;

  CommentsModel(
      {by,
        id,
        kids,
        parent,
        text,
        time,
        type});

  CommentsModel.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    id = json['id'];
    kids = json['kids'];
    parent = json['parent'];
    text = json['text'];
    time = json['time'];
    type = json['type'];
  }
}