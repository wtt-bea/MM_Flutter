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

  //查询个人主页中的帖子
  static String postHome(String account) {
    return "/post/postHome?account=$account";
  }

  //查询个信息
  static String userInfo(String account) {
    return "/user/userInfo?account=$account";
  }

  //新增todolist
  static String insertTodo(String account, String context) {
    return "/todolist/insertTodo?account=$account&context=$context";
  }

  //获取所有todolist
  static String queryTodo(String account) {
    return "/todolist/queryTodo?account=$account";
  }

  //删除todolist
  static String deleteTodo(int list_id) {
    return "/todolist/deleteTodo?list_id=$list_id";
  }

  //修改完成状态
  static String updateTodo(int list_id) {
    return "/todolist/updateTodo?list_id=$list_id";
  }

  //查询是否签到
  static String isClock(String account) {
    return "/user/isClock?account=$account";
  }

  //增加签到数目
  static String updateClock(String account) {
    return "/user/updateClock?account=$account";
  }

  //修改用户信息不包括头像
  static String updateUsers(
      String account, String date, String name, String planet) {
    return "/user/updateUsers?account=$account&date=$date&name=$name&planet=$planet";
  }

  //查询天气
  static String queryWeather(String planet) {
    return "/weather/weatherquery?planet=$planet";
  }

  //写信
  static String writeLetter(
      String account, String stamp, String recipient, String context) {
    return "/letter/insertLetter?account=$account&stamp=$stamp&recipient=$recipient&context=$context";
  }

  //查询用户的所有信
  static String queryLetter(String recipient) {
    return "/letter/queryLetter?recipient=$recipient";
  }

  //查询用户新获得的信
  static String queryOneLetter(String account) {
    return "/letter/queryOneLetter?account=$account";
  }

  //查询用户新获得的信
  static String insertRecipien(int letter_id, String account) {
    return "/letter/insertRecipient?letter_id=$letter_id&account=$account";
  }
}
