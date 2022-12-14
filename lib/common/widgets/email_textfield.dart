import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/utils/lowercase_textfield.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({Key? key, required this.onTextChange})
      : super(key: key);

  final Function(String email) onTextChange;

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  final _textController = TextEditingController();

  late final SecureStorage _secureStorage = getIt<SecureStorage>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColors.white.withOpacity(0.1),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: SFText(
            keyText: LocaleKeys.email_address,
            style: TextStyles.lightGrey14,
          ),
        ),
        TypeAheadField<String>(
          textFieldConfiguration: TextFieldConfiguration(
              style: TextStyles.w400White16,
              onChanged: widget.onTextChange,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              inputFormatters: [
                LowerCaseTextFormatter(),
              ],
              controller: _textController,
              decoration: InputDecoration(
                  isDense: true,
                  hintStyle: TextStyles.lightGrey14,
                  border: border,
                  focusedBorder: border,
                  disabledBorder: border,
                  enabledBorder: border,
                  errorBorder: border,
                  focusedErrorBorder: border,
                  counterText: "")),
          suggestionsCallback: (pattern) {
            final res = _secureStorage.getSuggestionEmail(pattern);
            return res;
          },
          hideOnEmpty: true,
          hideOnLoading: true,
          suggestionsBoxDecoration: SuggestionsBoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.darkColor1),
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(suggestion, style: TextStyles.w400White16),
              ),
            );
          },
          onSuggestionSelected: (suggestion) {
            _textController.text = suggestion;
            widget.onTextChange(suggestion);
          },
        ),
      ],
    );
  }
}
