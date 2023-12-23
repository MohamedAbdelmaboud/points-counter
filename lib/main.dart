import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_project/cubit/counter_cubit.dart';

import 'views/Points_counter_view.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>CounterCubit(),
      child: const MaterialApp(home:  PointCounterView(),));
  }
}