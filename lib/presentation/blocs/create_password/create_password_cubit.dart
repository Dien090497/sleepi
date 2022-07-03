import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/models/create_password_schema/create_password_schema.dart';
import 'package:slee_fi/presentation/blocs/create_password/create_password_state.dart';
import 'package:slee_fi/usecase/create_password_usecase.dart';

class CreatePasswordCubit extends Cubit<CreatePasswordState> {
  CreatePasswordCubit() : super(const CreatePasswordState.initial());

  final CreatePasswordUseCase _createPassCodeUC =
      getIt<CreatePasswordUseCase>();

  late String email;
  late int otp;
  late String activeCode;

  String password = '';
  String confirmPassword = '';

  init(String email, String activeCode, int otp) {
    this.email = email;
    this.otp = otp;
    this.activeCode = activeCode;
  }

  createPassword() async {
    'create passcode'.log;
    if (!_validatePassword()) {
      return;
    }
    emit(const CreatePasswordState.process());
    var result = await _createPassCodeUC
        .call(CreatePasswordSchema(email, password, activeCode, otp));

    result.fold((l) => emit(CreatePasswordState.errorCreate(l.msg)),
        (r) => emit(const CreatePasswordState.success()));
  }

  bool _validatePassword() {
    if (password.isEmpty) {
      emit(const CreatePasswordState.errorPassword('Please enter password'));
      return false;
    }
    if (confirmPassword.isEmpty) {
      emit(const CreatePasswordState.errorConfirmPassword('Please enter confirm password'));
      return false;
    }
    if (password != confirmPassword) {
      emit(const CreatePasswordState.errorConfirmPassword('Password does not match'));
      return false;
    }

    return true;
  }
}
