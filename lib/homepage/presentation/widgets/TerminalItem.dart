import 'package:flutter/material.dart';

import '../../data/terminal.dart';

class TerminalItem extends StatelessWidget {
  final Terminal terminal;

  const TerminalItem({super.key, required this.terminal});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(title: Text(terminal.name)),
    );
  }
}
