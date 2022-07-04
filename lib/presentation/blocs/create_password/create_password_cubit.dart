import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/create_password_schema/create_password_schema.dart';
import 'package:slee_fi/models/user/user_info_model.dart';
import 'package:slee_fi/presentation/blocs/create_password/create_password_state.dart';
import 'package:slee_fi/usecase/create_password_usecase.dart';
import 'package:slee_fi/usecase/is_first_open_app_usecase.dart';
import 'package:slee_fi/usecase/save_user_local_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

class CreatePasswordCubit extends Cubit<CreatePasswordState> {
  CreatePasswordCubit() : super(const CreatePasswordState.initial());

  final _createPassCodeUC = getIt<CreatePasswordUseCase>();
  final _saveUserUC = getIt<SaveUserLocalUseCase>();
  final _isFirstOpenApp = getIt<IsFirstOpenAppUseCase>();

  late UserInfoModel userInfoModel;
  late int otp;
  late String activeCode;

  String password = '';
  String confirmPassword = '';
  bool isFistOpenApp = false;

  init(UserInfoModel userInfoModel, String activeCode, int otp) async {
    this.userInfoModel = userInfoModel;
    this.otp = otp;
    this.activeCode = activeCode;
    var result = await _isFirstOpenApp.call(NoParams());
    result.fold((l) => null, (r) => isFistOpenApp = r);
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
      emit(CreatePasswordState.success(isFistOpenApp));
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
    if (password != confirmPassword) {
      emit(CreatePasswordState.errorConfirmPassword(
          LocaleKeys.password_dose_not_match.tr()));
      return false;
    }

    return true;
  }
}
