import 'package:dartz/dartz.dart';
import 'package:ddde_app/errors.dart';
import 'package:ddde_app/worktime_counter_store.dart';
//import 'package:flutter_modular/flutter_modular.dart';

// mixin UpdateWorktimeCounter {
//   Future<Either<Failure, WorktimeCounterState>> call(int currentCounter);
// }

// @Injectable(singleton: false)
// class UpdateWorktimeCounterImpl implements UpdateWorktimeCounter {
//   UpdateWorktimeCounterImpl();

//   @override
//   Future<Either<Failure, WorktimeCounterState>> call(int currentCounter) async {
//     await Future.delayed(Duration(seconds: 1));
//     return Right<Failure, WorktimeCounterState>(new WorktimeCounterState());
//   }
// }

class UpdateWorktimeCounter {
  UpdateWorktimeCounter();

  Future<Either<Failure, WorktimeCounterState>> call(int currentCounter) async {
    await Future.delayed(Duration(seconds: 1));
    return Right<Failure, WorktimeCounterState>(
        new WorktimeCounterState(currentCounter));
  }
}

class ResetWorktimeCounter {
  ResetWorktimeCounter();

  Future<Either<Failure, WorktimeCounterState>> call() async {
    await Future.delayed(Duration(seconds: 1));
    return Right<Failure, WorktimeCounterState>(new WorktimeCounterState(0));
  }
}

class IncrementWorktimeCounter {
  IncrementWorktimeCounter();

  Future<Either<Failure, WorktimeCounterState>> call(
      WorktimeCounterState state) async {
    await Future.delayed(Duration(seconds: 1));
    return Right<Failure, WorktimeCounterState>(
        new WorktimeCounterState(state.counter + 1));
  }
}
