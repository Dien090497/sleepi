import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';
import 'package:slee_fi/usecase/add_item_to_bed_usecase.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';
import 'package:slee_fi/usecase/remove_item_from_bed_usecase.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<FetchData>(_fetchBed);
    on<AddItem>(_addItemToBed);
    on<RemoveItem>(_removeItem);
    on<ChangeBed>(_changeBed);
    on<RefreshBed>(_onRefresh);
    on<FetchItem>(_fetchItems);
  }

  int currentBedId = -1;

  _onRefresh(RefreshBed event, Emitter<HomeState> emit) {
    'run to refresh bed'.log;
    emit(const HomeState.loading());
    add(const FetchData());
  }

  final _fetchListBedUC = getIt<FetchBedUseCase>();
  final _addItemToBedUC = getIt<AddItemToBedUseCase>();
  final _removeItemFromBedUC = getIt<RemoveItemFromBedUseCase>();

  _changeBed(ChangeBed event, Emitter<HomeState> emit) {
    var currentState = state;
    if (currentState is HomeLoaded) {
      currentBedId = event.id;
      emit(currentState.copyWith(
        time: event.time,
        level: event.level,
        id: event.id,
        durability: event.durability,
      ));
    }
  }

  _fetchBed(FetchData fetchData, Emitter<HomeState> emit) async {
    var result = await _fetchListBedUC
        .call(FetchBedParam(1, 10, CategoryType.bed, AttributeNFT.none));
    result.fold(
      (l) {
        emit(HomeState.error(l.msg));
        'load bed error ${l.msg}'.log;
      },
      (r) {
        final currentState = state;
        if (r.isNotEmpty) {
          currentBedId = r.first.id;
        }
        if (currentState is HomeLoaded) {
          emit(currentState.copyWith(
              bedList: r.map((e) => e.toEntity()).toList(),
              durability: r.isEmpty ? 0 : r.first.durability,
              id: r.isEmpty ? 0 : r.first.id,
              level: r.isEmpty ? 0 : r.first.level,
              time: r.isEmpty ? 0 : r.first.time,
              selectedItem: null));
          return;
        }
        emit(HomeState.loaded(
            errorMessage: '',
            loading: false,
            bedList: r.map((e) => e.toEntity()).toList(),
            durability: r.isEmpty ? 0 : r.first.durability,
            id: r.isEmpty ? 0 : r.first.id,
            level: r.isEmpty ? 0 : r.first.level,
            selectedItem: null,
            time: r.isEmpty ? 0 : r.first.time));
      },
    );
  }

  _fetchItems(FetchItem fetchItem, Emitter<HomeState> emit) async {
    var item = await _fetchListBedUC
        .call(FetchBedParam(1, 10, CategoryType.item, AttributeNFT.none));
    item.fold(
      (l) {
        emit(HomeState.error(l.msg));
        'load item error ${l.msg}'.log;
      },
      (r) {
        'load items ${r.length}'.log;
        final currentState = state;
        if (currentState is HomeLoaded) {
          emit(currentState.copyWith(
              itemList: r.map((e) => e.toEntity()).toList()));
        }
      },
    );
  }

  _addItemToBed(AddItem event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded) {
      var result = await _addItemToBedUC
          .call(AddItemToBedParam(currentBedId, event.item.id));
      result.fold((l) {
        emit(currentState.copyWith(errorMessage: l.msg));
      }, (r) {
        emit(currentState.copyWith(selectedItem: event.item));
      });
    }
  }

  _removeItem(RemoveItem event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded && currentState.selectedItem != null) {
      var result = await _removeItemFromBedUC
          .call(AddItemToBedParam(currentBedId, currentState.selectedItem!.id));
      result.fold((l) {
        emit(currentState.copyWith(errorMessage: l.msg));
      }, (r) {
        emit(currentState.copyWith(selectedItem: null));
      });
    }
  }
}
