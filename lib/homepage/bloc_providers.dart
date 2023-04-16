import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/terminal_cubit.dart';
import 'domain/terminal_service.dart';
import 'locator.dart';

List<BlocProvider> blocProviders = [
  BlocProvider(create: (_) => TerminalCubit(locator<TerminalService>()))
];
