import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passenger_client/homepage/locator.dart';

import 'blocs/terminal_cubit.dart';
import 'domain/terminal_service.dart';

List<BlocProvider> blocProviders = [
  BlocProvider(create: (_) => TerminalCubit(locator<TerminalService>()))
];
