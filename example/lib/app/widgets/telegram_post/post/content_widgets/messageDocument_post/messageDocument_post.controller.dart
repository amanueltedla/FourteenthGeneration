import 'package:flutter/cupertino.dart';
import 'package:id_mvc_app_framework/utils/command/MvcCommand.dart';
import 'package:telegram_service_example/app/model/message_info.dart';
import 'package:telegram_service/tdapi.dart' as tdapi;
import 'package:telegram_service_example/app/widgets/telegram_post/post/content_widgets/messageMediaBase_post/messageMediaBase_post.controller.dart';

import 'load_messageDocument.command.dart';

class MessageDocumentPostContentController extends MessageMediaBaseController {
  
  MessageDocumentPostContentController(TelegramChannelMessageInfo messsageInfo)
      : assert(messsageInfo.content is tdapi.MessageDocument),
        super(messsageInfo) {
       //selectPhotoSize();
  }

  

  tdapi.MessageDocument get messageContent =>
      (messsageInfo.content as tdapi.MessageDocument);

  
  tdapi.Document get documentObject => messageContent.document;
  
   String get documentFIlePath => documentObject.document.local.path;

   @override
   String get postText => messageContent.caption.text;
     
   
@override
  MvcCommand createCommand() => LoadMessageDocmentCmd.cmd(documentObject);

  @override
  bool get isMediaDownloaded =>  (documentObject?.document?.local?.path?.isNotEmpty ?? false);

  @override
  double get mediaHeight => 100;

  @override
  double get mediaWidth => 200;

  @override
  void onContentTap() {
    
  }

  @override
  ImageProvider<Object> get thumbnail => AssetImage('assets/images/empty_thumbnail.jpg');
}
