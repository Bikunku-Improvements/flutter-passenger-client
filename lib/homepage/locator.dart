import 'package:get_it/get_it.dart';
import 'package:passenger_client/homepage/data/terminal_repository.dart';
import 'package:passenger_client/homepage/domain/terminal_service.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  locator.registerSingleton<TerminalRepository>(TerminalRepository());
  locator.registerSingleton<TerminalService>(
      TerminalService(locator<TerminalRepository>()));
}
