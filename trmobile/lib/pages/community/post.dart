import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import '../../net/TtApi.dart';
import '../../net/NetRequester.dart';
import '../../model/User.dart';
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';
import '../community/community_page.dart';

class PostPage extends StatefulWidget {
  final account;
  const PostPage({super.key, required this.account});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final controller = MultiImagePickerController(
      maxImages: 4,
      allowedImageTypes: ['png', 'jpg', 'jpeg'],
      withData: true,
      withReadStream: true,
      images: <ImageFile>[] // array of pre/default selected images
      );
  final TextEditingController _postText = TextEditingController();

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    _postText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //文字输入后缩放
      body: SizedBox(
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 32,
                    width: 55,
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                            const Color.fromARGB(0, 157, 45, 45)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 253, 183, 200)),
                      ),
                      //发布按钮
                      onPressed: () async {
                        var uuid = Uuid();
                        var post_id = uuid.v1();
                        post_id = post_id.substring(0, 8);
                        var result_text = await NetRequester.request(
                            Apis.posttext(
                                post_id, widget.account, _postText.text));
                        final images =
                            controller.images; // return Iterable<ImageFile>
                        for (final image in images) {
                          if (image.hasPath) {
                            var pic_id = uuid.v1();
                            pic_id = pic_id.substring(0, 8);
                            FormData formData = FormData.fromMap({
                              'pic_id': pic_id,
                              'post_id': post_id,
                              'file': await MultipartFile.fromFile(image.path!,
                                  filename: image.name),
                            });
                            var dio = Dio();
                            //上传帖子图片
                            var result_pic = await dio.post(
                                "http://172.20.10.5:80/post_pic/pic",
                                data: formData);
                            if (result_pic.data["message"] == "false") {
                              showDialog(
                                  context: this.context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      content: const Text(
                                        "T_T网络出现了小错误",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      actions: <Widget>[
                                        OutlinedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          style: OutlinedButton.styleFrom(
                                            side: const BorderSide(
                                                width: 1.0,
                                                color: Colors.black),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: const Text(
                                            "确 认",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        )
                                      ],
                                    );
                                  });
                            }
                          }
                        }
                        if (result_text["message"] == "false") {
                          showDialog(
                              context: this.context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  content: const Text(
                                    "T_T网络出现了小错误",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  actions: <Widget>[
                                    OutlinedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                            width: 1.0, color: Colors.black),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: const Text(
                                        "确 认",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    )
                                  ],
                                );
                              });
                        } else {
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommunityPage(
                                account: widget.account,
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "发布",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 245),
                  SizedBox(
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black54,
                      ),
                      //关闭按钮
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 150,
              width: 340,
              //文字输入框
              child: TextField(
                controller: _postText,
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                minLines: 1,
                decoration: const InputDecoration(
                  hintText: '今天遇到什么开心的事情了吗....',
                  hintStyle: TextStyle(fontSize: 14, color: Colors.black26),
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  isDense: true,
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                    color: Color.fromARGB(255, 67, 67, 67),
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 400,
              child: MultiImagePickerView(
                onChange: (list) {
                  debugPrint(list.toString());
                },
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200),
                controller: controller,
                padding: const EdgeInsets.all(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
