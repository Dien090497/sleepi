import 'package:flutter_bloc/flutter_bloc.dart';

import 'mint_state.dart';

class MintCubit extends Cubit<MintState> {
  MintCubit() : super(const MintState.initial());
}
