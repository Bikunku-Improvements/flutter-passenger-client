import 'package:passenger_client/common/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:passenger_client/common/utils/usecase.dart';
import 'package:passenger_client/homepage/data/terminal_repository.dart';

import '../../data/terminal.dart';

class GetAllTerminalsUseCase implements UseCase<List<Terminal>, NoParams> {
  final TerminalRepository repository;

  GetAllTerminalsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Terminal>>> call(NoParams param) async {
    return await repository.getAll();
  }
}
