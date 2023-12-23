import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_project/cubit/counter_states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(AIncrementState());
  int ahlyPoints = 0;
  int zamalkPoints = 0;
  increment({required String team, required int number}) {
    if (team == 'A') {
      ahlyPoints += number;
      emit(AIncrementState());
    } else {
      zamalkPoints += number;
      emit(BIncrementState());
    }
  }

  reset() {
    ahlyPoints = 0;
    zamalkPoints = 0;
    emit(ResetState());
  }
}
