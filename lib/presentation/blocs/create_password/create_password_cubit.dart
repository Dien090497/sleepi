import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/create_password/create_password_state.dart';
import 'package:slee_fi/schema/change_password_schema/change_password_schema.dart';
import 'package:slee_fi/schema/create_password_schema/create_password_schema.dart';
import 'package:slee_fi/usecase/change_password_usecase.dart';
import 'package:slee_fi/usecase/create_password_usecase.dart';

class CreatePasswordCubit extends Cubit<CreatePasswordState> {
  CreatePasswordCubit() : super(const CreatePasswordState.initial());

  final _createPassCodeUC = getIt<CreatePasswordUseCase>();
  final _changePasswordUC = getIt<ChangePasswordUseCase>();

  late String email;
  late int otp;
  late String activeCode;
  late Locale locale;

  String password = '';
  String confirmPassword = '';
  late bool isCreate;

  init(String email, String activeCode, int otp, bool isCreate,
      Locale locale) async {
    this.email = email;
    this.otp = otp;
    this.activeCode = activeCode;
    this.isCreate = isCreate;
    this.locale = locale;
  }

  process() async {
    if (!_validatePassword()) {
      return;
    }
    emit(const CreatePasswordState.process());
    if (isCreate) {
      _createPassCode();
    } else {
      _changePassword();
    }
  }

  _changePassword() async {
    var result = await _changePasswordUC
        .call(ChangePasswordSchema(email, otp, password, confirmPassword));

    result.fold((l) => emit(CreatePasswordState.errorCreate(l.msg)),
        (r) => emit(const CreatePasswordState.changePasswordSuccess()));
  }

  _createPassCode() async {
    var result = await _createPassCodeUC
        .call(CreatePasswordSchema(email, password, activeCode, otp));

    result.fold((l) => emit(CreatePasswordState.errorCreate(l.msg)), (r) async {
      emit(CreatePasswordState.success(locale));
    });
  }

  bool _validatePassword() {
    var message = password.validatePassword;
    var messageConfirm = confirmPassword.validatePassword;

    if (message.isNotEmpty) {
      emit(CreatePasswordState.errorPassword(message));
      return false;
    }
    if (messageConfirm.isNotEmpty) {
      emit(CreatePasswordState.errorConfirmPassword(messageConfirm));
      return false;
    }
    if (confirmPassword.isEmpty) {
      emit(CreatePasswordState.errorConfirmPassword(
          LocaleKeys.this_field_is_required.tr()));
      return false;
    }
    if (password != confirmPassword) {
      emit(CreatePasswordState.errorConfirmPassword(
          LocaleKeys.password_dose_not_match.tr()));
      return false;
    }

    return true;
  }

  onChangePassword(String value) {
    if ((state is CreatePasswordStateErrorPassword ||
            state is CreatePasswordStateErrorCreate) &&
        (password.isEmpty || value.isEmpty)) {
      emit(const CreatePasswordState.initial());
    }
    password = value;
  }

  onChangeConfirmPassword(String value) {
    if ((state is CreatePasswordStateErrorPassword ||
                state is CreatePasswordStateErrorCreate) &&
            confirmPassword.isEmpty ||
        value.isEmpty) {
      emit(const CreatePasswordState.initial());
    }
    confirmPassword = value;
  }
}
