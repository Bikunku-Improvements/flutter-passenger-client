import 'package:bloc/bloc.dart';
import 'package:passenger_client/homepage/blocs/terminal_state.dart';
import 'package:passenger_client/homepage/domain/terminal_service.dart';

class TerminalCubit extends Cubit<TerminalState> {
  final TerminalService _terminalService;

  TerminalCubit(this._terminalService) : super(const TerminalState());

  Future<void> initTerminalSection() async {
    emit(state.copyWith(isLoadingTerminal: true));
    final response = await _terminalService.getAllTerminals();
    response.fold(
        (exception) => {emit(state.copyWith(isLoadingTerminal: false))},
        (result) => {
              emit(state.copyWith(
                  isLoadingTerminal: false, terminalList: result))
            });
  }
}
