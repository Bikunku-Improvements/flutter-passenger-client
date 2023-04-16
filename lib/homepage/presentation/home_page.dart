import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passenger_client/homepage/blocs/terminal_cubit.dart';
import 'package:passenger_client/homepage/domain/terminal_service.dart';
import 'package:passenger_client/homepage/locator.dart';
import 'package:passenger_client/homepage/presentation/terminal_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TerminalCubit(locator<TerminalService>()),
        child: const TerminalView());
  }
}
