import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/models/create_password_schema/create_password_schema.dart';
import 'package:slee_fi/models/user/user_info_model.dart';
import 'package:slee_fi/presentation/blocs/create_password/create_password_state.dart';
import 'package:slee_fi/usecase/create_password_usecase.dart';
import 'package:slee_fi/usecase/save_user_local_usecase.dart';

class CreatePasswordCubit extends Cubit<CreatePasswordState> {
  CreatePasswordCubit() : super(const CreatePasswordState.initial());

  final _createPassCodeUC = getIt<CreatePasswordUseCase>();
  final _saveUserUC = getIt<SaveUserLocalUseCase>();

  late UserInfoModel userInfoModel;
  late int otp;
  late String activeCode;

  String password = '';
  String confirmPassword = '';

  init(UserInfoModel userInfoModel, String activeCode, int otp) {
    this.userInfoModel = userInfoModel;
    this.otp = otp;
    this.activeCode = activeCode;
  }

  createPassword() async {
    'create passcode'.log;
    if (!_validatePassword()) {
      return;
    }
    emit(const CreatePasswordState.process());
    var result = await _createPassCodeUC.call(
        CreatePasswordSchema(userInfoModel.email, password, activeCode, otp));

    result.fold((l) => emit(CreatePasswordState.errorCreate(l.msg)), (r) async {
      await _saveUserUC.call(userInfoModel);
      emit(const CreatePasswordState.success());
    });
  }

  bool _validatePassword() {
    if (password.isEmpty) {
      emit(const CreatePasswordState.errorPassword('Please enter password'));
      return false;
    }
    if (confirmPassword.isEmpty) {
      emit(const CreatePasswordState.errorConfirmPassword(
          'Please enter confirm password'));
      return false;
    }
    if (password != confirmPassword) {
      emit(const CreatePasswordState.errorConfirmPassword(
          'Password does not match'));
      return false;
    }

    return true;
  }
}
