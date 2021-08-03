import 'package:id_mvc_app_framework/utils/async/async_lock.dart';
import 'package:id_mvc_app_framework/utils/command/MvcCommand.dart';
import 'package:telegram_service/tdapi.dart' as tdapi;

import 'package:telegram_service_example/utils/telegram/handlers/telegram_file_download_handler.dart';

class LoadMessageDocmentCmd {
  static MvcCommand<MvcCommandSingleParam<tdapi.Document>, void> cmd(
          tdapi.Document documentFile) =>
      MvcCommand<MvcCommandSingleParam<tdapi.Document>, void>.async(
        params: MvcCommandSingleParam(documentFile),
        func: (param) async {
          final documentObject = param.value;
          if (documentObject == null) return;

          final asyncLock = AsyncLock();
          TdlibFileDownloadHandler.instance.downloadFile(documentObject.document,
              (file, path) {
            documentObject.document = file;
            asyncLock.release();
          }, onFileDownloading: (file) {});

          return await asyncLock();
        },
        canBeDoneOnce: true,
      );
}
