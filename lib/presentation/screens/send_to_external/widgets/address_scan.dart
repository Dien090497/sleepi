import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class AddressScan extends StatefulWidget {
  const AddressScan({required this.onChangedAddress, this.errorText, Key? key}) : super(key: key);
  final Function(String) onChangedAddress;
  final String? errorText;
  @override
  State<AddressScan> createState() => _AddressScanState();
}

class _AddressScanState extends State<AddressScan> {
   late TextEditingController _editingController = TextEditingController();

  @override
  void initState() {
    _editingController = TextEditingController()
      ..addListener(() {
        widget.onChangedAddress(_editingController.text);
      });
    super.initState();
  }

  @override
  void dispose() {
    _editingController.removeListener(() {widget.onChangedAddress(_editingController.text); });
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SFTextField(
        controller: _editingController,
        labelText: LocaleKeys.to_address,
        errorText: widget.errorText,
        suffixIcon: GestureDetector(
          onTap: () async{
            final result = await Navigator.pushNamed(context, R.qrCodeScan);
            if(result != null ){
              int idx = result.toString().indexOf(":");
              final contractAddress = result.toString().substring(idx+1).trim(); // date: "'2019:04:01'"
              _editingController.text = contractAddress;
            }

          },
          child: const Padding(
              padding: EdgeInsets.all(10),
              child: SFIcon(
                Ics.icScanOutlined,
              )),
        ));
  }
}
