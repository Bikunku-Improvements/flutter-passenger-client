import 'package:equatable/equatable.dart';

import '../data/terminal_location.dart';

class MapState extends Equatable {
  final List<TerminalLocation> terminalLocationList;

  const MapState({
    this.terminalLocationList = const [],
  });

  MapState copyWith({
    List<TerminalLocation>? terminalLocationList,
  }) =>
      MapState(
          terminalLocationList:
              terminalLocationList ?? this.terminalLocationList);

  @override
  List<Object?> get props => [
        terminalLocationList,
      ];
}
