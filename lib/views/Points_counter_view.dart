import 'package:flutter/material.dart';
import 'package:fourth_project/widgets/custom_column.dart';
import 'package:fourth_project/widgets/win_container.dart';

class PointCounterView extends StatefulWidget {
  const PointCounterView({Key? key}) : super(key: key);

  @override
  State<PointCounterView> createState() => _PointCounterViewState();
}

class _PointCounterViewState extends State<PointCounterView> {
  int pointsA = 0;
  int pointsB = 0;
  String? win;
  void addPointsA({required int number}) {
    setState(() {
      pointsA += number;
    });
  }

  void addPointsB({required int number}) {
    setState(() {
      pointsB += number;
    });
  }

  void reset() {
    setState(() {
      pointsA = 0;
      pointsB = 0;
    });
  }

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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomColumn(
                    teamName: 'Team A',
                    imagePath: 'images/ahly.png',
                    variable: '$pointsA',
                    onPressed1: () {
                      addPointsA(number: 1);
                    },
                    onPressed2: () {
                      addPointsA(number: 2);
                    },
                    onPressed3: () {
                      addPointsA(number: 3);
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
                    variable: '$pointsB',
                    onPressed1: () {
                      addPointsB(number: 1);
                    },
                    onPressed2: () {
                      addPointsB(number: 2);
                    },
                    onPressed3: () {
                      addPointsB(number: 3);
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
                  reset();
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
              pointsA == pointsB
                  ? const WinContainer(
                      text: "The match is drawn", color: Colors.white)
                  : pointsA > pointsB
                      ? const WinContainer(
                          text: "until now, the winner team is Al-Ahly",
                          color: Colors.white)
                      : const WinContainer(
                          text: "until now, the winner team is Zamalek",
                          color: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
