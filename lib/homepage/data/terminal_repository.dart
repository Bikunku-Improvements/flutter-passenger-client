import "package:passenger_client/homepage/data/terminal.dart";

abstract class TerminalRepository {
  // GET ALL TERMINALS
  Future<List<Terminal>> getAll();
}
