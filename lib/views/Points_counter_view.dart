import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_project/cubit/counter_cubit.dart';
import 'package:fourth_project/cubit/counter_states.dart';
import 'package:fourth_project/widgets/custom_column.dart';
import 'package:fourth_project/widgets/win_container.dart';

class PointCounterView extends StatelessWidget {
  const PointCounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          leading: const Icon(Icons.sports_basketball),
          title: const Text(
            "Points Counter",
            style: TextStyle(fontSize: 24, fontFamily: "pac"),
          ),
        ),
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background.jpg"),
                  fit: BoxFit.fill)),
          child: BlocBuilder<CounterCubit, CounterStates>(
            builder: (context, state) {
              return HomeBody();
            },
          ),
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var myBloc = BlocProvider.of<CounterCubit>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomColumn(
              teamName: 'Team A',
              imagePath: 'images/ahly.png',
              variable: '${myBloc.ahlyPoints}',
              onPressed1: () {
                myBloc.increment(team: 'A', number: 1);
              },
              onPressed2: () {
                myBloc.increment(team: 'A', number: 2);
              },
              onPressed3: () {
                myBloc.increment(team: 'A', number: 3);
              },
            ),
            const SizedBox(
                height: 500,
                child: VerticalDivider(
                  color: Colors.grey,
                  thickness: 2,
                  indent: 50,
                  endIndent: 50,
                )),
            CustomColumn(
              teamName: 'Team B',
              imagePath: 'images/zamalek.png',
              variable: '${myBloc.zamalkPoints}',
              onPressed1: () {
                myBloc.increment(team: 'Z', number: 1);
              },
              onPressed2: () {
                myBloc.increment(team: 'Z', number: 2);
              },
              onPressed3: () {
                myBloc.increment(team: 'Z', number: 3);
              },
            ),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyan,
              minimumSize: const Size(70, 40),
              shadowColor: const Color.fromARGB(255, 0, 217, 255),
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(99))),
          onPressed: () {
            myBloc.reset();
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Reset",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(width: 6),
              Icon(Icons.restart_alt)
            ],
          ),
        ),
        const SizedBox(
          height: 9,
        ),
        myBloc.ahlyPoints == myBloc.zamalkPoints
            ? const WinContainer(text: "The match is drawn")
            : myBloc.ahlyPoints > myBloc.zamalkPoints
                ? const WinContainer(
                    text: "until now, the winner team is Al-Ahly",
                  )
                : const WinContainer(
                    text: "until now, the winner team is Zamalek",
                  )
      ],
    );
  }
}
