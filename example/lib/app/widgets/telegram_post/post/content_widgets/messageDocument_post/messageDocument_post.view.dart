import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:telegram_service/tdapi.dart' as tdapi;
import 'package:telegram_service_example/app/model/message_info.dart';
import 'package:telegram_service_example/app/widgets/telegram_post/post/content_widgets/messageMediaBase_post/messageMediaBase_post.view.dart';
import 'package:telegram_service_example/utils/telegram/posts_builders/post_content_widget.dart';
import 'messageDocument_post.controller.dart';

class MessageDocumentPostContent
    extends MessageMediaBaseContentWidget<MessageDocumentPostContentController> {
  @mustCallSuper
  MessageDocumentPostContent({Key key, messageInfo})
      : super(key: key, messageInfo: messageInfo);

  @override
  MessageDocumentPostContentController initController() =>
      MessageDocumentPostContentController(messageInfo);

  @override
  Widget get getMediaContent => c.isMediaDownloaded ? Icon(
        Icons.download_sharp,
        size: 40,
        color: Colors.grey[400],
      ):Icon(
        Icons.download_done_outlined,
        size: 40,
        color: Colors.grey[400],
      );

  @override
  List<String> get contentTypes => [tdapi.MessageDocument.CONSTRUCTOR];

  static PostContentWidget builder(TelegramChannelMessageInfo messageInfo) =>
      MessageDocumentPostContent(
        messageInfo: messageInfo,
      );
}
