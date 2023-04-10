class Post {
  String? post_id; // 帖子id
  String? account; // 账户
  String? date; // 发布日期
  String? context; // 帖子内容
  String? like_number; // 点赞数量
  String? comment_number; // 评论数量

  Post(
      {this.post_id,
      this.account,
      this.date,
      this.context,
      this.like_number,
      this.comment_number});

  Post.fromJson(dynamic json) {
    post_id = json["post_id"];
    account = json["account"];
    date = json["date"];
    context = json["context"];
    like_number = json["like_number"];
    comment_number = json["comment_number"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["post_id"] = post_id;
    map["account"] = account;
    map["date"] = date;
    map["context"] = context;
    map["like_number"] = like_number;
    map["comment_number"] = comment_number;
    return map;
  }

  @override
  String toString() {
    return 'Post{post_id: $post_id, account: $account, date: $date, context: $context, like_number: $like_number, comment_number: $comment_number}';
  }
}
