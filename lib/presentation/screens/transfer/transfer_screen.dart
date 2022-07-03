import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/transfer/widgets/transfer_list.dart';
import 'package:slee_fi/presentation/screens/transfer/widgets/transfer_widget.dart';
import 'package:slee_fi/presentation/screens/wallet/layouts/transaction_detail_screen.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as TokenEntity?;
    return BackgroundWidget(
      appBar: SFAppBar(
        context: context,
        title: LocaleKeys.transfer,
        textStyle: TextStyles.bold18LightWhite,
      ),
      resizeToAvoidBottomInset: false,
      child: DismissKeyboardWidget(
        child: SafeArea(
          child: Column(
            children: [
              const TransferWidget(),
              const SizedBox(height: 24),
              Expanded(child: TransferList(tokenEntity: args)),
            ],
          ),
        ),
      ),
    );
  }
}
