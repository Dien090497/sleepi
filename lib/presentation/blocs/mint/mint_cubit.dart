import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';

import 'mint_state.dart';

class MintCubit extends Cubit<MintState> {
  MintCubit()
      : super(MintState.initial(
            beds: List.generate(BedType.values.length * 5,
                (i) => BedType.values[i % BedType.values.length])));
}
