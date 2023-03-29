import 'package:flutter/material.dart';

class UserAgreementPage extends StatefulWidget {
  const UserAgreementPage({super.key});

  @override
  State<UserAgreementPage> createState() => _UserAgreementPageState();
}

class _UserAgreementPageState extends State<UserAgreementPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "用户协议",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("漫漫用户协议"),
        ),
        body: const Center(
          child: SingleChildScrollView(
            child: Text('''
一. 协议条款的确认及接受
  漫漫（Android系统中运行的名为“漫漫”的应用程序，以下简称"本网站"或“漫漫”）由王潇彤（以下合称“本人”）运营并享有完全的所有权及知识产权等权益，本网站提供的服务将完全按照其发布的条款和操作规则严格执行。

  您确认同意本协议（协议文本包括《漫漫用户协议》、《漫漫隐私政策》、《漫漫社区公约》，三者乃不可分割的整体，具有同等法律效力，共同构成用户使用本网站及相关服务的整体协议，以下合称“本协议”）所有条款并完成注册程序时，本协议在您与本人间成立并发生法律效力，同时您成为本网站正式用户。

二. 版权说明
  本人在“漫漫”软件及相关服务中提供的内容（包括但不限于软件、技术、程序、网页、文字、图片、图像、音频、视频、图表、版面设计、电子文档等）的知识产权属于本人所有。

  同时本人提供服务所依托的软件的著作权、专利权及其他知识产权均归本人所有。未经本经公司许可，任何人不得擅自使用（包括但不限于通过任何机器人、蜘蛛等程序或设备监视、复制、传播、展示、镜像、上载、下载“漫漫”软件及相关服务中的内容）。

三. 服务内容
  3.1 本网站的服务具体内容根据实际情况提供，漫漫保留变更、中断或终止部分或全部服务的权利。漫漫不承担因业务调整给用户造成的损失。除非本协议另有其它明示规定，增加或强化目前本网站的任何新功能，包括所推出的新产品，均受到本协议之规范。用户了解并同意，本网站服务仅依其当前所呈现的状况提供，对于任何用户通讯或个人化设定之时效、删除、传递错误、未予储存或其它任何问题，漫漫均不承担任何责任。

  3.2 漫漫在提供服务时，可能会对部分服务的用户收取一定的费用。在此情况下，漫漫会在相关页面上做明确的提示。如用户拒绝支付该等费用，则不能使用相关的服务。

  3.3 用户理解，漫漫仅提供相关的服务，除此之外与相关服务有关的设备（如手机、电脑、调制解调器及其他与接入互联网有关的装置）及所需的费用（如为接入互联网而支付的电话费及上网费）均应由用户自行负担。

  3.4 漫漫的替换、修改和升级：

    1) 为增进用户体验、完善服务内容，漫漫有权根据您对软件的使用状态和行为开发新的服务；

    2) 为改进、增强和进一步开发服务，漫漫有权不时提供软件更新（包括软件升级替换、修改、功能强化、版本升级等形式；

    3) 用户理解并同意：漫漫有权不向您特别通知而对漫漫进行更新，或对漫漫的部分功能进行改变或限制。

    4) 漫漫新版本发布后，旧版本可能无法使用。漫漫运营者不保证旧版漫漫及相应的服务继续可用。为充分、及时使用漫漫的服务，请您随时核对并下载最新版本。

四. 使用规则
  4.1 您确认，在您完成注册程序或以其他漫漫允许的方式实际使用漫漫提供的产品和服务时，您应当是具备完全民事权利能力和完全民事行为能力的自然人、法人或其他组织。若您不具备前述主体资格，则您及您的监护人应承担因此而导致的一切后果，且漫漫有权注销或永久冻结您的账户，并保留向您或您的监护人索取赔偿的权利。

  18周岁以下的未成年人等非完全民事行为能力人应该在法定监护人的指导下使用漫漫的产品和服务。

  4.2 用户注册成功后，漫漫将给予每个用户一个用户帐号及相应的密码，该用户帐号和密码由用户负责保管；用户应当对以其用户帐号进行的所有活动和事件负法律责任。

  4.3 用户须对在漫漫的注册信息的真实性、合法性、有效性承担全部责任，用户不得冒充他人；不得利用他人的名义发布任何信息；不得恶意使用注册帐号导致其他用户误认；否则漫漫有权立即停止提供服务，收回其帐号并由用户独自承担由此而产生的一切法律责任。

  4.4 您可以对账户设置昵称和头像，您设置的昵称和头像不得侵犯或涉嫌侵犯他人的合法权益。用户承诺设置昵称和头像时遵守以下规定：

    1) 不以党和国家领导人或其他社会名人的真实姓名、字号、艺名、笔名注册；

    2) 不以国家机构或其他机构的名称注册；

    3) 不注册不文明、不健康名字，或包含歧视、侮辱、猥亵类词语的账号；

    4) 不注册易产生歧义、引起他人误解或其它不符合法律规定的账号。

  如您设置的昵称涉嫌侵犯他人合法权益，漫漫有权终止向您提供部分或全部软件服务。漫漫对此不承担任何责任，您将承担因此产生的任何直接或间接损失及不利后果。

  4.5 用户理解且确认，其在漫漫注册账号的所有权及有关权益均归本人所有，用户完成注册手续后仅享有该账号的使用权。您的账号仅限于您本人使用，未经本人书面同意，禁止以任何形式赠与、借用、出租、转让、售卖或以其他方式许可他人使用该账号。如果本人发现或者有合理理由认为使用者并非账号初始注册人，公司有权在未通知您的情况下，暂停或终止向该注册账号提供服务，并有权注销该账号，而无需向注册该账号的用户承担法律责任。

  4.6 用户同意授权漫漫运营者基于下列原因使用用户的信息资源

    1) 执行软件验证、升级服务；

    2) 提高用户的使用安全性或提供客户支持；

    3) 应用户特殊要求而提供特定服务时，需要将信息提供给漫漫或与此相关联的第三方或其他用户；

    4) 将各种非个人隐私数据用于商业目的，包括但不限于向第三方提供增值服务、广告、定位广告、营销、联合注册、促销或其他活动等；

    5) 应司法机关或政府机关要求；

    6) 为提高用户使用体验；

    7) 其他有利于用户和漫漫利益且不违反任何强制性法律法规的情况。

4.7 用户直接或通过各类方式（如 RSS 源和站外 API 引用等）间接使用漫漫服务和数据的行为，都将被视作已无条件接受本协议全部内容；若用户对本协议的任何条款存在异议，请停止使用漫漫所提供的全部服务。

4.8 用户通过漫漫发表的信息为公开的信息，其他第三方均可以通过漫漫获取用户发表的信息，用户对任何信息的发表即认可该信息为公开的信息，并单独对此行为承担法律责任；任何用户不愿被其他第三人获知的信息都不应该在漫漫上进行发表。

4.9 用户承诺不得以任何方式利用漫漫直接或间接从事违反中国法律以及社会公德的行为，漫漫有权对违反上述承诺的内容予以删除。

用户不得利用漫漫服务制作、上载、复制、发布、传播或者转载如下内容：

    1) 反对宪法所确定的基本原则的；

    2) 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；

    3) 损害国家荣誉和利益的；

    4) 煽动民族仇恨、民族歧视，破坏民族团结的；

    5) 侮辱、滥用英烈形象，否定英烈事迹，美化粉饰侵略战争行为的；

    6) 破坏国家宗教政策，宣扬邪教和封建迷信的；

    7) 散布谣言，扰乱社会秩序，破坏社会稳定的；

    8) 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；

    9) 侮辱或者诽谤他人，侵害他人合法权益的；

    11) 所有用户同意遵守漫漫社区公约（试行）。

4.10 漫漫有权对用户使用漫漫App的情况进行审查和监督，如用户在使用漫漫时违反任何上述规定，漫漫或其授权的人有权要求用户改正或直接采取一切必要的措施（包括但不限于更改或删除用户张贴的内容、暂停或终止用户使用漫漫的权利）以减轻用户不当行为造成的影响。

五. 知识产权
  1)漫漫提供的服务内容可能包括：文字、软件、声音、图片、录象、图表等。所有这些内容受著作权权、商标和其它财产所有权法律的保护。

  2)用户只有在获得漫漫或其他相关权利人的授权之后才能使用这些内容，不能擅自复制、再造这些内容、或创造与内容有关的派生产品。

  3)用户知悉、理解并同意其通过漫漫发布上传的内容，授权本人及其关联公司、控制公司可在全球范围内、免费、非独家、可转授权地使用，使用范围包括但不限于在当前或其他网站、应用程序、产品或终端设备等，并授权公司及其关联公司、控制公司对相应内容可进行修改、复制、改编、翻译、汇编或制作衍生产品。

  4)第三方若出于非商业目的，将用户在漫漫上发表的内容转载在漫漫之外的地方，应当在作品的正文开头的显著位置注明原作者姓名（或原作者在漫漫上使用的帐号名称），给出原始链接，注明「发表于漫漫」，并不得对作品进行修改演绎。若需要对作品进行修改，或用于商业目的，第三方应当联系用户获得单独授权，按照用户规定的方式使用该内容。

  5)在漫漫上传或发表的内容，用户应保证其为著作权人或已取得合法授权，并且该内容不会侵犯任何第三方的合法权益。如果第三方提出关于著作权的异议，漫漫有权根据实际情况删除相关的内容，且有权追究用户的法律责任。给漫漫或任何第三方造成损失的，用户应负责全额赔偿。

  6)如果任何第三方侵犯了漫漫用户相关的权利，用户同意授权漫漫或其指定的代理人代表漫漫自身或用户对该第三方提出警告、投诉、发起行政执法、诉讼、进行上诉，或谈判和解，并且用户同意在漫漫认为必要的情况下参与共同维权。

  7)漫漫有权但无义务对用户发布的内容进行审核，有权根据相关证据结合《侵权责任法》、《信息网络传播权保护条例》等法律法规及漫漫社区协议对侵权信息进行处理。

六. 免责申明
6.1 漫漫不能对用户发表的回答或评论的正确性进行保证。

6.2 用户在漫漫发表的内容仅表明其个人的立场和观点，并不代表漫漫的立场或观点。作为内容的发表者，需自行对所发表内容负责，因所发表内容引发的一切纠纷，由该内容的发表者承担全部法律及连带责任。漫漫不承担任何法律及连带责任。

6.3 用户理解并同意，在使用漫漫服务的过程中，可能会遇到不可抗力等风险因素，使服务发生中断、延迟。不可抗力是指不能预见、不能克服并不能避免且对一方或双方造成重大影响的客观事件，包括但不限于自然灾害（如洪水、台风、地震等）、社会事件（如战争、暴动、政府行为）等，出现上述情况时，漫漫会努力对产品和服务进行修复，但由此给您造成的损失，漫漫在法律允许的范围内免责。

6.4 在法律允许的范围内，漫漫对以下情形导致的服务终端或受阻不承担责任：

  1) 受到计算机病毒、木马或其他恶意程序、黑客攻击的破坏；

  2) 用户或漫漫的电脑软件、系统、硬件和通信线路出现故障；

  3) 用户操作不当；

  4) 用户使用非漫漫授权的方式使用本服务；

  5) 其他漫漫无法控制或合理预见的情形。

6.5 用户理解并同意，在使用漫漫产品和服务的过程中，可能会遇到网络信息或其他用户带来的风险和损害，漫漫不对任何信息或产品的真实性、适用性、合法性承担责任，也不对因侵权行为给您造成的损害负责。这些风险包括但不限于：

  1) 来自他人匿名或冒名的含有威胁、诽谤、令人反感或非法内容的信息；

  2) 因使用本协议项下产品或服务，遭受他人误导、欺骗或其他导致或可能导致的任何心理、生理以及经济上的损害。

6.6 漫漫依据本协议享有处理不法、违规内容、产品或服务的权利，但该权利不构成漫漫的义务和承诺，漫漫不保证及时发现并做出相应处理。

七. 未成年人使用条款
  1)若用户是未满18周岁的未成年人，应在监护人监护、指导并获得监护人同意情况下阅读本协议和使用漫漫相关服务。

  2)本人重视对未成年人个人信息的保护，未成年用户在填写个人信息时，请加强个人保护意识并谨慎对待，请在监护人指导时正确使用漫漫相关服务。

  3)未成年用户理解如因用户违反法律法规、本协议内容，则用户及用户的监护人应依照法律规定承担因此而导致的一切后果。

八. 协议修改
  1)根据互联网的发展和有关法律、法规及规范性文件的变化，或者因业务发展需要，漫漫有权对本协议的条款作出修改或变更，一旦本协议的内容发生变动，漫漫将会直接在漫漫网站上公布修改之后的协议内容，该公布行为视为漫漫已经通知用户修改内容。漫漫也可采用电子邮件或私信的传送方式，提示用户协议条款的修改、服务变更、或其它重要事项。

  2)如果不同意漫漫对本协议相关条款所做的修改，用户有权并应当停止使用漫漫。如果用户继续使用漫漫，则视为用户接受漫漫对本协议相关条款所做的修改。

九. 法律管辖适用及其他
  1)本协议的订立、执行和解释及争议的解决均应适用中华人民共和国（不包括香港、澳门特别行政区，以及台湾地区）法律。如双方就本协议内容或其执行发生任何争议，双方应尽力友好协商解决；协商不成时，任何一方均应向上海市长宁区人民法院提起诉讼。

  2)如果本协议中任何一条被视为废止、无效或因任何理由不可执行，该条应视为可分的且并不影响任何其余条款的有效性和可执行性。
'''),
          ),
        ),
      ),
    );
  }
}
