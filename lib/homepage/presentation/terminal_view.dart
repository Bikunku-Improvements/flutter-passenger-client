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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<TerminalCubit>();
      cubit.initTerminalSection();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Passenger Client')),
        body: BlocBuilder<TerminalCubit, TerminalState>(
            builder: (context, state) {
          if (state.isLoadingTerminal) {
            return const Center(child: CircularProgressIndicator());
          }

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: ListView(
              children: state.terminalList
                  .map((terminal) => TerminalItem(terminal: terminal))
                  .toList(),
            ),
          );
        }));
  }
}
