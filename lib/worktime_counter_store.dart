import 'package:ddde_app/update_worktime_counter.dart';
import 'package:flutter_triple/flutter_triple.dart';

class WorktimeCounterStore
    extends NotifierStore<Exception, WorktimeCounterState> {
  final UpdateWorktimeCounter update_us;
  final ResetWorktimeCounter reset_us;
  final IncrementWorktimeCounter increment_us;

  WorktimeCounterStore(this.update_us, this.reset_us, this.increment_us)
      : super(new WorktimeCounterState(0));

  setCounter(int counter) async {
    // setLoading(true);
    // final result = await usecase(counter);
    // //result.fold((l) => setError(l), (r) => update(r));
    // result.fold(setError, update);
    // setLoading(false);
    executeEither(() => update_us(counter));
  }

  resetCounter() async {
    executeEither(() => reset_us());
  }

  incrementCounter() async {
    executeEither(() => increment_us(state));
  }
}

class WorktimeCounterState {
  final int counter;

  //int get selectState => _counter;

  WorktimeCounterState(this.counter);
}
