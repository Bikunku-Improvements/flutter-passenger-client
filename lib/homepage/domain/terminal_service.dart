import 'package:dartz/dartz.dart';
import 'package:passenger_client/homepage/data/terminal_repository.dart';

import '../../common/errors/failure.dart';
import '../data/terminal.dart';

class TerminalService {
  final TerminalRepository _repository;

  TerminalService(this._repository);

  Future<Either<Failure, List<Terminal>>> getAllTerminals() async {
    return await _repository.getAll();
  }
}
