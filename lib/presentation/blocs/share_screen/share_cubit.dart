import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/presentation/blocs/share_screen/share_state.dart';

class ShareCubit extends Cubit<ShareState> {
  ShareCubit() : super(const ShareState.initial());

  void downLoadImage({required Widget widget, required ScreenshotController controller}) {
    try {
      emit(const ShareState.loading());
      controller.captureFromWidget(widget).then((value) async {
        await ImageGallerySaver.saveImage(value);
        emit(const ShareState.loaded());
      });
    } catch (e) {
      emit(const ShareState.error(''));
    }
  }

  void shareSocial({required Widget widget, required ScreenshotController controller, required ShareSocial typeShare}) async {
    try {
      emit(const ShareState.loading());
      controller.captureFromWidget(widget).then((value) async {
        switch (typeShare) {
          case ShareSocial.twitter:
            shareSocialAction(value: value, type: 'shareTwitter');
            break;
          case ShareSocial.facebook:
            shareSocialAction(value: value, type: 'shareFacebook');
            break;
          case ShareSocial.instagram:
            shareSocialAction(value: value, type: 'shareInstagram');
            break;
          default:
            break;
        }
      });
    } catch (e) {
      emit(const ShareState.error(''));
    }
  }

  void shareSocialAction({required Uint8List value, required String type}) async {
    final Directory temp = await getTemporaryDirectory();
    final time = DateTime.now().millisecond.toString();
    const methodChannel = MethodChannel('com.sotatek.sleepfi.sharing');
    final File imageFile = await File('${temp.path}/$time.png').create(recursive: true);
    if (type == 'shareInstagram') {
      if (Platform.isIOS) {
        final pathInstar = await ImageGallerySaver.saveImage(value, isReturnImagePathOfIOS: true);
        emit(const ShareState.initial());
        final result = await methodChannel.invokeMethod(type, pathInstar['filePath']);
      } else {
        final res = await imageFile.writeAsBytes(value);
        emit(const ShareState.initial());
        final result = await methodChannel.invokeMethod(type, res.uri.path);
      }
    } else {
      final res = await imageFile.writeAsBytes(value);
      emit(const ShareState.initial());
      final result = await methodChannel.invokeMethod(type, res.uri.path);
      if (result == 'Error') {
        emit(const ShareState.error(''));
      }
    }
  }
}