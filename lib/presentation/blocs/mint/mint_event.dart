import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/enum/enum.dart';

@immutable
abstract class MintEvent extends Equatable {
  const MintEvent();
}

class SelectBedEvent extends MintEvent{

  const SelectBedEvent({required this.beds, required this.i});

  final List<BedType> beds;
  final int i;

  @override
  // TODO: implement props
  List<Object?> get props => [beds, i];

}