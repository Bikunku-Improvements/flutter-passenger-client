import "package:dartz/dartz.dart";
import "package:passenger_client/common/errors/failure.dart";
import "package:passenger_client/homepage/data/terminal.dart";
import "package:passenger_client/homepage/data/terminal_api.dart";

class TerminalRepository {
  final TerminalApi terminalApi;

  TerminalRepository({required this.terminalApi});

  Future<Either<Failure, List<Terminal>>> getAll() async {
    try {
      final results = await terminalApi.listTerminals();
      return Right(results);
    } catch (e) {
      return Left(Failure("Internal server error."));
    }
  }
}
