import 'package:equatable/equatable.dart';
import 'package:passenger_client/homepage/data/terminal.dart';

class TerminalState extends Equatable {
  final List<Terminal> terminalList;
  final bool isLoadingTerminal;

  const TerminalState(
      {this.terminalList = const [], this.isLoadingTerminal = false});

  TerminalState copyWith({
    bool? isLoadingTerminal,
    List<Terminal>? terminalList,
  }) =>
      TerminalState(
          terminalList: terminalList ?? this.terminalList,
          isLoadingTerminal: isLoadingTerminal ?? this.isLoadingTerminal);

  @override
  List<Object?> get props => [
        terminalList,
        isLoadingTerminal,
      ];
}
