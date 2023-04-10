class Apis {
  static String login(String account, String password) {
    return "/user/login?account=$account&password=$password";
  }

  static String planet(String account) {
    return "/user/planet?account=$account";
  }

  static String posttext(String post_id, String account, String context) {
    return "/post/posttext?post_id=$post_id&account=$account&context=$context";
  }

  static String receive(String planet) {
    return "/post/receive?planet=$planet";
  }

  static String insertLike(String post_id, String account) {
    return "/like/insertLike?post_id=$post_id&account=$account";
  }

  static String deleteLike(String post_id, String account) {
    return "/like/deleteLike?post_id=$post_id&account=$account";
  }

  static String insertPostLike(String post_id) {
    return "/post/postlike?post_id=$post_id";
  }

  static String deldetePostLike(String post_id) {
    return "/post/postunlike?post_id=$post_id";
  }

  static String queryLike(String account) {
    return "/like/queryLike?account=$account";
  }

  static String queryImage() {
    return "/post_pic/queryImage";
  }
}
