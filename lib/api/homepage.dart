import 'package:passenger_client/api/base_url.dart' as constants;

const String allTerminals = '${constants.httpBaseUrl}/terminal/allTerminal';
const String getCurrentBikunku =
    '${constants.wsBaseUrl}/bus/stream?type=client';
