import 'package:equatable/equatable.dart';

import '../data/bikun.dart';

class BikunState extends Equatable {
  final List<Bikun> bikunList;

  const BikunState({this.bikunList = const []});

  BikunState copyWith({
    List<Bikun>? bikunList,
  }) =>
      BikunState(bikunList: bikunList ?? this.bikunList);

  @override
  List<Object?> get props => [bikunList];
}
