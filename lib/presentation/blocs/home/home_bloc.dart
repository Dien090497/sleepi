import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';
import 'package:slee_fi/usecase/add_item_to_bed_usecase.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';
import 'package:slee_fi/usecase/remove_item_in_bed_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<FetchData>(_fetchBed);
    on<AddItem>(_addItemToBed);
    on<RemoveItem>(_removeItem);
  }

  final _fetchListBedUC = getIt<FetchBedUseCase>();
  final _addItemToBedUC = getIt<AddItemToBedUseCase>();
  final _removeItemInUC = getIt<RemoveItemInBedUseCase>();

  _fetchBed(FetchData fetchData, Emitter<HomeState> emit) async {
    var result =
        await _fetchListBedUC.call(FetchBedParam(1, 10, 1, AttributeNFT.none));
    result.fold(
      (l) {
        emit(HomeState.error(l.msg));
        'load error ${l.msg}'.log;
      },
      (r) {
        emit(HomeState.loaded(bedList: r.map((e) => e.toEntity()).toList()));
      },
    );
  }

  _addItemToBed(AddItem event, Emitter<HomeState> emit) {}

  _removeItem(RemoveItem event, Emitter<HomeState> emit) async {
    _removeItemInUC.call(NoParams());
  }
}
