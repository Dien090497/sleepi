import 'package:bloc/bloc.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/presentation/blocs/individual/individual_state.dart';

class IndividualCubit extends Cubit<IndividualState> {
  IndividualCubit(BedEntity bed) : super(IndividualState(bed));
}
