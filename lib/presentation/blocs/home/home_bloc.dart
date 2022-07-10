import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';
import 'package:slee_fi/usecase/remove_item_in_bed_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<FetchData>(_fetchBed);
    on<AddItem>(_addItemToBed);
    on<RemoveItem>(_removeItem);
    on<ChangeBed>(_changeBed);
    on<RefreshBed>(_onRefresh);
  }

  _onRefresh(RefreshBed event, Emitter<HomeState> emit) {
    'run to refresh bed'.log;
    emit(const HomeState.loading());
    add(const FetchData());
  }

  final _fetchListBedUC = getIt<FetchBedUseCase>();
  // final _addItemToBedUC = getIt<AddItemToBedUseCase>();
  final _removeItemInUC = getIt<RemoveItemInBedUseCase>();

  _changeBed(ChangeBed event, Emitter<HomeState> emit) {
    var currentState = state;
    if (currentState is HomeLoaded) {
      emit(currentState.copyWith(
        time: event.time,
        level: event.level,
        id: event.id,
        durability: event.durability,
      ));
    }
  }

  _fetchBed(FetchData fetchData, Emitter<HomeState> emit) async {
    var result =
        await _fetchListBedUC.call(FetchBedParam(1, 10, 1, AttributeNFT.none));
    result.fold(
      (l) {
        emit(HomeState.error(l.msg));
        'load error ${l.msg}'.log;
      },
      (r) {
        if (r.isNotEmpty) {
          var firstBed = r.first;
          emit(HomeState.loaded(
            bedList: r.map((e) => e.toEntity()).toList(),
            durability: firstBed.durability,
            id: firstBed.id,
            level: firstBed.level,
            time: firstBed.time,
          ));
          return;
        }
        emit(const HomeState.loaded(
          bedList: [],
          durability: 0,
          id: 0,
          level: 0,
          time: 0,
        ));
      },
    );
  }

  _addItemToBed(AddItem event, Emitter<HomeState> emit) {}

  _removeItem(RemoveItem event, Emitter<HomeState> emit) async {
    _removeItemInUC.call(NoParams());
  }
}
