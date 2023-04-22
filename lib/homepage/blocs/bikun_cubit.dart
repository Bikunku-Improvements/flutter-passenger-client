import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:passenger_client/homepage/blocs/bikun_state.dart';
import 'package:passenger_client/homepage/domain/bikun_service.dart';

class BikunCubit extends Cubit<BikunState> {
  final BikunService _bikunService;
  late final StreamSubscription _streamSubscription;

  BikunCubit(this._bikunService) : super(const BikunState()) {
    _streamSubscription = _bikunService.getAllBikun().listen((bikunList) {
      emit(state.copyWith(bikunList: bikunList));
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    _bikunService.closeBikunkuStream();
    return super.close();
  }
}
