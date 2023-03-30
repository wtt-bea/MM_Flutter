import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DetialPage extends StatefulWidget {
  final List ImageList;
  const DetialPage({
    super.key,
    required this.ImageList,
  });

  @override
  State<DetialPage> createState() => _DetialPageState();
}

class _DetialPageState extends State<DetialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            topNavBar(),
            ShowContext(),
          ],
        ),
      ),
    );
  }

  Widget topNavBar() {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: const BoxDecoration(color: Colors.black45),
    );
  }

  Widget ShowContext() {
    return Expanded(
      // width: double.infinity,
      // decoration:
      //     const BoxDecoration(color: Color.fromARGB(115, 194, 129, 129)),
      child: const Text("周杰伦（Jay Chou），1979年1月18日出生于台湾省新北市，祖籍福建省泉州市永春县，中国台湾流行乐男歌手、音乐人、演员、导演、编剧，毕业于淡江中学。
2000年发行首张个人专辑《Jay》。2001年发行的专辑《范特西》奠定其融合中西方音乐的风格。2002年举行“The One”世界巡回演唱会 [1]  。2003年成为美国《时代周刊》封面人物 [2]  。2004年获得世界音乐大奖中国区最畅销艺人奖 [265]  。2005年凭借动作片《头文字D》获得金马奖、金像奖最佳新人奖 [3]  。2006年起连续三年获得世界音乐大奖中国区最畅销艺人奖 [4]  。2007年自编自导的文艺片《不能说的秘密》获得金马奖年度台湾杰出电影奖 [5]  。
2008年凭借歌曲《青花瓷》获得第19届金曲奖最佳作曲人奖。2009年入选美国CNN评出的“25位亚洲最具影响力人物” [6]  ，同年凭借专辑《魔杰座》获得第20届金曲奖最佳国语男歌手奖 [7]  。2010年入选美国《Fast Company》评出的“全球百大创意人物”。2011年凭借专辑《跨时代》再度获得金曲奖最佳国语男歌手奖，并且第四次获得金曲奖最佳国语专辑奖；同年主演好莱坞电影《青蜂侠》。2012年登福布斯中国名人榜榜首 [8]  。2014年发行华语乐坛首张数字音乐专辑《哎呦，不错哦》。2021年在央视春晚演唱歌曲《Mojito》 [92]  。
演艺事业外，他还涉足商业、设计等领域。2007年成立杰威尔有限公司 [10]  。2011年担任华硕笔电设计师，并入股香港文化传信集团 [11]  。
周杰伦热心公益慈善，多次向中国内地灾区捐款捐物。2008年捐款援建希望小学 [12]  。2014年担任中国禁毒宣传形象大使。"),
    );
  }

  Widget PublishComment() {
    return Center();
  }

  Widget ShowComment() {
    return Center();
  }
}
