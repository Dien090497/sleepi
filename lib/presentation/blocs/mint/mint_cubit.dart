import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/schema/minting/minting_schema.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';
import 'package:slee_fi/usecase/get_minting_usecase.dart';
import 'package:slee_fi/usecase/minting_usecase.dart';

import 'mint_state.dart';

class MintCubit extends Cubit<MintState> {
  MintCubit() : super(const MintState.initial());

  final _fetchListBedUC = getIt<FetchBedUseCase>();
  final _getMintingUC = getIt<GetMintingUseCase>();
  final _mintingUC = getIt<MintingUseCase>();

  late int page = 1;
  final limit = 10;
  late int bedParentId1;

  void init(int id) {
    bedParentId1 = id;
    page = 1;
    getListMyBed();
  }

  void refresh() {
    page = 1;
    getListMyBed();
  }

  Future<void> getListMyBed() async {
    final result = await _fetchListBedUC
        .call(FetchBedParam(page, limit, CategoryType.bed));
    result.fold((l) {
      emit(MintState.error('$l'));
    }, (r) {
      r.removeWhere((element) => element.nftId == bedParentId1 || element.nft!.isLock == 1 || element.nftType != 'bed');
      final currentState = state;
      if (currentState is MintStateLoaded) {
        emit(MintState.loaded(
            listBed: page == 1 ? r : currentState.listBed + r,
            isLoadMore: r.length == limit));
      } else {
        emit(MintState.loaded(
            indexSelected: -1,
            listBed: r,
            isLoadMore: r.length == limit,
            enableInsurance: true));
      }
    });
  }

  void selectBed(int index) {
    final currentState = state;
    if (currentState is MintStateLoaded) {
      emit(currentState.copyWith(indexSelected: index));
    }
  }

  void changeEnableInsurance(value) {
    final currentState = state;
    if (currentState is MintStateLoaded) {
      emit(currentState.copyWith(enableInsurance: value));
    }
  }

  Future<void> getInfoMint() async {
    final currentState = state;
    if (currentState is MintStateLoaded) {
      if (currentState.indexSelected != -1) {
        final result = await _getMintingUC.call(
          GetMintingParams(
            bedParentId1,
            currentState.listBed[currentState.indexSelected].nftId,
          ),
        );
        result.fold((l) {
          emit(MintState.error('$l'));
        }, (r) {
          emit(MintState.getInfoMint(r));
          emit(currentState.copyWith());
        });
      }
    }
  }

  Future<void> mint() async {
    final currentState = state;
    if (currentState is MintStateLoaded) {
      if (currentState.indexSelected != -1) {
        final result = await _mintingUC.call(
          MintingSchema(
            bedIdParent1: bedParentId1,
            bedIdParent2:
                currentState.listBed[currentState.indexSelected].nftId,
            isInsurance: currentState.enableInsurance,
          ),
        );
        result.fold((l) {
          emit(MintState.error('$l'));
        }, (r) {
          if(r['status']) {
            emit(currentState.copyWith(statusMint: true));
          }else{
            emit(MintState.error(r['msg'].toString()));
          }
        });
      }
    }
  }
}
