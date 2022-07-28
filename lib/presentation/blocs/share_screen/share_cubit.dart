import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:slee_fi/presentation/blocs/share_screen/share_state.dart';
import 'package:social_share/social_share.dart';

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

  void shareSocial({required Widget widget, required ScreenshotController controller}) async {
    emit(const ShareState.loading());
    const methodChannel = MethodChannel('com.sotatek.sleepfi.sharing');
    controller.captureFromWidget(widget).then((value) async {
      final Directory temp = await getTemporaryDirectory();
      final time = DateTime.now().millisecond.toString();
      final File imageFile = await File('${temp.path}/$time.png').create(recursive: true);
      final res = await imageFile.writeAsBytes(value);
      final result = await methodChannel.invokeMethod("shareInstagram", res.uri.path);
      emit(const ShareState.loaded());
    });
  }
}