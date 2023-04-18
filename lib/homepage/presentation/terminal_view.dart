import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passenger_client/homepage/blocs/terminal_cubit.dart';
import 'package:passenger_client/homepage/blocs/terminal_state.dart';
import 'package:passenger_client/homepage/presentation/widgets/TerminalItem.dart';

class TerminalView extends StatefulWidget {
  const TerminalView({super.key});

  @override
  State<StatefulWidget> createState() => _TerminalViewState();
}

class _TerminalViewState extends State<TerminalView> {
  late TerminalCubit _terminalCubit;

  @override
  void initState() {
    _terminalCubit = BlocProvider.of<TerminalCubit>(context);
    _terminalCubit.initTerminalSection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Passenger Client')),
        body: BlocBuilder<TerminalCubit, TerminalState>(
            bloc: _terminalCubit,
            builder: (context, state) {
              if (state.isLoadingTerminal) {
                return const Center(child: CircularProgressIndicator());
              }

              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: ListView(
                  children: state.terminalList
                      .map((terminal) => TerminalItem(terminal: terminal))
                      .toList(),
                ),
              );
            }));
  }
}
