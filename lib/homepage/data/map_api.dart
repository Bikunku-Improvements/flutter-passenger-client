import 'package:passenger_client/common/terminals/terminal_list.dart';
import 'package:passenger_client/homepage/data/terminal_location.dart';

class MapApi {
  static List<TerminalLocation> listTerminalLocations(String route) {
    if (route == 'red') {
      return terminalRed;
    } else if (route == 'blue') {
      return terminalBlue;
    } else {
      return terminalRed + terminalBlue + terminalMix;
    }
  }
}
