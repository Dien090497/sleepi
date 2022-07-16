import 'package:bloc/bloc.dart';
import 'package:slee_fi/presentation/blocs/individual/individual_state.dart';

class IndividualCubit extends Cubit<IndividualState> {
  IndividualCubit() : super(const IndividualState.initial());
}
