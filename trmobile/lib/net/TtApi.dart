class Apis {
  //登陆
  static String login(String account, String password) {
    return "/user/login?account=$account&password=$password";
  }

  //查询星球
  static String planet(String account) {
    return "/user/planet?account=$account";
  }

  //发布帖子
  static String posttext(String post_id, String account, String context) {
    return "/post/posttext?post_id=$post_id&account=$account&context=$context";
  }

  //查询不同星球的帖子
  static String receive(String planet) {
    return "/post/receive?planet=$planet";
  }

  //增加like表中的信息
  static String insertLike(String post_id, String account) {
    return "/like/insertLike?post_id=$post_id&account=$account";
  }

  //删除like表中的点赞信息
  static String deleteLike(String post_id, String account) {
    return "/like/deleteLike?post_id=$post_id&account=$account";
  }

  //增加post表中的点赞数
  static String insertPostLike(String post_id) {
    return "/post/postlike?post_id=$post_id";
  }

  //减少post表中的点赞数
  static String deldetePostLike(String post_id) {
    return "/post/postunlike?post_id=$post_id";
  }

  //查询like表中的点赞信息
  static String queryLike(String account) {
    return "/like/queryLike?account=$account";
  }

  //获取所有图片表
  static String queryImage() {
    return "/post_pic/queryImage";
  }

  //发布评论
  static String postComment(String post_id, String account, String context) {
    return "/comment/postComment?post_id=$post_id&account=$account&context=$context";
  }

  //查询文章的评论内容
  static String queryComment(String post_id) {
    return "/comment/queryComment?post_id=$post_id";
  }

  //增加post表中评论数量
  static String postAddcomment(String post_id) {
    return "/post/postAddcomment?post_id=$post_id";
  }
}
