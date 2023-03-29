import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "隐私政策",
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(IconData(0xe8ef, fontFamily: "MyIcons")),
          ),
          title: const Text("漫漫隐私保护政策"),
        ),
        body: const Center(
          child: SingleChildScrollView(
            child: Text('''
    引言
    知我王潇彤尊重并保护您的隐私。您在下载、开启、浏览、注册、登录、使用“漫漫”网站、软件及相关产品和/或服务时，我们将按照本《隐私保护政策》（以下简称“本政策”）收集、使用、储存及对外提供您的信息。同时，我们会通过本政策向您说明，我们如何为您提供访问、更新、管理和保护您的信息的服务。本政策与您使用我们的服务关系紧密，我们建议您仔细阅读并理解本政策全部内容，做出您认为适当的选择。我们努力用通俗易懂、简明扼要的文字表达，并对本政策中与您的权益存在重大关系的条款和个人敏感信息，采用重点标注以提示您注意。

  如果您不同意本政策关于基本业务功能的相关内容，可能将影响为您提供相应产品和/或服务的效果。您使用我们的产品和/或服务，即意味着同意我们按照本政策收集、使用、储存和分享您的相关信息。当本政策进行更新后，我们会及时在漫漫平台网站发布最新版本并通知您。

  如对本政策或相关事宜有任何问题，您可以通过漫漫平台网站(www.zhiwotansuo.com/www.jixianhai.com)首页的客服热线/在线咨询或者本政策第10条所列方式与我们联系。

  本《隐私保护政策》包含以下内容：
  1、我们如何收集、使用您的个人信息

  1、我们如何收集、使用您的个人信息
  为了保证用户注册、在线聊天、客户服务、线上工具等各项基本业务功能及营销活动、提升用户体验的各项扩展业务功能的正常运行，我们会收集、使用下列与您有关的信息。如果您不提供相关信息，可能无法注册成为我们的用户或无法使用和享受我们提供的某些产品和服务，或者无法达到相关产品和/或服务拟达到的效果。 我们会出于本政策所述的以下目的，收集和使用您的个人信息：

  1.1 成为“漫漫平台”的用户
  为使用“漫漫平台”，您需要首先成为“漫漫平台”的注册用户，以便我们为您提供会员服务，您需要提供注册、登录漫漫平台账号使用的电话号码，并创建“漫漫平台”账号和密码。在您主动注销账号之后，我们将根据法律的要求删除您的个人信息，或使其匿名化处理。

  1.2 向您提供产品或服务
  （1）基础业务功能：

  注册/登录：您在使用漫漫平台某些核心功能时，需要先完成注册和登录。注册和登录都需要您提供手机号。同时我们也支持更方便快捷的共享登录方式，即如果设备上安装了漫漫平台旗下相关产品（漫漫APP等），并已在该产品中完成注册登录，我们将使用对应登录手机号为您直接完成登录并予以告知。完成共享登录需要读取您的设备应用列表。

  查看和编辑个人资料：您可以选择是否在漫漫平台上完善个人信息，可自行上传和编辑个人头像、姓名、性别。上传头像功能需要获取您的摄像头或相册权限，您在设置地区时可以选择自动获取您的地理位置信息帮助筛选地区，也可以手动输入进行筛选。

  保存App内图片及文件：您可以将App内允许保存的图片或文件保存到本地。但进行此操作需要获取您设备的存储权限。

  产品使用提醒：在使用产品使用提醒服务时，需要将相关产品或服务开始信息写入您的日历，并且我们将请求开启您的日历权限以启用产品使用提醒功能，如您不同意开启，则我们无法提供产品使用提醒功能。

  冥想功能：社区将展示您自行填写的昵称以及您发布的留言内容。

  社区功能：您可以通过话题功能上传文字图片，讨论区将展示您自行填写的昵称以及您发布的留言内容，需要您的相册权限。


  （2）附加业务功能：

  发布评价：您在使用我们的产品以及服务结束后，可以对产品和服务做出总体评价，也可以发表评论留言。当您在漫漫平台上主动对我们的产品和服务进行评价时，我们将收集您发布的信息，并展示您的头像、姓名和发布内容。

  （3）用户体验优化：

  漫漫平台将基于您对“漫漫平台”使用数据，结合个人常用设备信息进行统计，来诊断系统问题，优化产品体验。

  我们会采取脱敏、去标识化等方式对您的信息进行综合统计、分析加工，以便为您提供更加准确、个性、流畅及便捷的服务，或帮助我们评估、改善或设计服务及运营活动；为了提升用户服务体验，为用户推荐更为优质或适合的服务，我们可能会根据用户信息形成群体特征标签，用于向用户提供其可能感兴趣的营销活动通知、商业性电子信息或广告，如您不希望接收此类信息，您可在设置中关闭个性化推荐。

  我们会使用工具（含第三方工具SDK）统计您在使用漫漫平台科技产品过程中产生的数据信息，其中包含应用启动数，页面访问数，重点按钮点击数，设置项的配置属性。随着漫漫平台科技产品的后续版本升级，我们统计的范围会有所改变，您下载/安装/使用漫漫平台科技后续版本产品的行为将被视为您对届时相关改变的同意。

  （4）开展营销活动

  当您选择参加我们举办的有关营销活动时，根据活动需要可能使用到您提供个人信息与第三方支付服务账号。这些信息可能包括个人敏感信息（个人电话号码、支付宝账号），是您收到转账或者礼品所必要的。如果您拒绝提供这些信息，我们将可能无法向您转账或发放礼品。
                '''),
          ),
        ),
      ),
    );
  }
}
