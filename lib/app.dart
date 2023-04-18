import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passenger_client/homepage/presentation/home_page.dart';

import 'homepage/blocs/terminal_cubit.dart';
import 'homepage/domain/terminal_service.dart';
import 'homepage/locator.dart';

class PassengerClientApp extends StatelessWidget {
  const PassengerClientApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => TerminalCubit(locator<TerminalService>()))
    ], child: const MaterialApp(home: HomePage()));
  }
}
