import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/presentation/blocs/share_screen/share_state.dart';
import 'package:social_share/social_share.dart';
import 'package:uri_to_file/uri_to_file.dart';
import 'dart:ui' as ui;

class ShareCubit extends Cubit<ShareState> {
  ShareCubit() : super(const ShareState.initial());

  //final _dateUtils = getIt<DateTimeUtils>();

  void downLoadImage({required Widget widget, required ScreenshotController controller}) {
    emit(const ShareState.loading());
    print('xoz123 ');
    controller.captureFromWidget(widget).then((value) async {
      final result = await ImageGallerySaver.saveImage(value);
      emit(const ShareState.loaded());
    });
  }

  void shareSocial({required Widget widget, required ScreenshotController controller}) async {
    print('123xxx');
    emit(const ShareState.loading());
    Map<Permission, PermissionStatus> statuses = await [
    Permission.storage,
    ].request();
    final info = statuses[Permission.storage].toString();
    controller.captureFromWidget(widget).then((value) async {
      /*final directory = (await getApplicationDocumentsDirectory ()).path; //from path_provide package
      String fileName = DateTime.now().microsecondsSinceEpoch.toString();
      final path = directory;

      ui.Codec codec = await ui.instantiateImageCodec(value);
      ui.FrameInfo frame = await codec.getNextFrame();
      ui.Image imgae = frame.image;*/

      final Directory temp = await getTemporaryDirectory();
      final File imageFile = await File('${temp.path}/someImageFile.png').create(recursive: true);
      final res = await imageFile.writeAsBytes(value);
        print('file ${res.path}');
        //File file = await File(imageFile.path);
      //SocialShare.shareOptions('', imagePath: '$imageFile');
      //final result = await ImageGallerySaver.saveImage(value, isReturnImagePathOfIOS: true);
      /*if (result['isSuccess'])  {
        print('xoz123xx ${result['filePath']}');*/
        SocialShare.shareOptions('', imagePath: '$imageFile');
        //print('result123 ${result['isSuccess']} \n ${result['filePath'].toString().replaceAll(RegExp('file://'), '')}');
        emit(const ShareState.loaded());

    });
    /*SocialShare.shareOptions('', imagePath: );*/
    /*switch (shareSocial) {
      case ShareSocial.telegram:
        SocialShare.shareTelegram(content);
        break;
      case ShareSocial.facebook:
        break;
      case ShareSocial.twitter:
        break;*/

    /*controller.captureFromWidget(widget).then((value) async {
      final result = await ImageGallerySaver.saveImage(value);
      emit(const ShareState.loaded());
    });*/
  }

}