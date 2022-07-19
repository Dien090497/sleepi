import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';

class QRCodeScanner extends StatefulWidget {
  const QRCodeScanner({Key? key}) : super(key: key);

  @override
  State<QRCodeScanner> createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {
  late MobileScannerController cameraController = MobileScannerController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.only(left: 16),
            child: SFBackButton(),
          ),
          // actions: [
          //   IconButton(onPressed: () {}, icon: const Icon(Icons.image_outlined, size: 28,)),
          // ],
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.transparent,
          leadingWidth: 48,
          elevation: 0,
       ),
      body: MobileScanner(
          allowDuplicates: false,
          controller: cameraController,
          onDetect: (qrcode, args) {
            if (qrcode.rawValue == null) {
              debugPrint('Failed to scan QRCode');
            } else {
              final String code = qrcode.rawValue!;
              debugPrint('QRCode found : $code');
              Navigator.pop(context, code);
            }
          }),

    );
  }
}
