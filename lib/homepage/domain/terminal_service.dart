import 'package:dartz/dartz.dart';
import 'package:passenger_client/homepage/data/terminal_repository.dart';

import '../../common/errors/failure.dart';
import '../data/terminal.dart';

class TerminalService {
  final TerminalRepository repository;

  TerminalService(this.repository);

  Future<Either<Failure, List<Terminal>>> getAllTerminals() async {
    return await repository.getAll();
  }
}
