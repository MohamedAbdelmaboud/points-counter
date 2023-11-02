import 'package:flutter/material.dart';
import 'package:fourth_project/widgets/button.dart';
import 'package:fourth_project/widgets/win_container.dart';

class PointCounter extends StatefulWidget {
  const PointCounter({Key? key}) : super(key: key);

  @override
  State<PointCounter> createState() => _PointCounterState();
}

class _PointCounterState extends State<PointCounter> {
  int pointsA = 0;
  int pointsB = 0;
  String? win;
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
                  image: AssetImage("images/f.jpg"), fit: BoxFit.fill)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Team A",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "pac",
                            color: Colors.white),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Image(
                          image: AssetImage("images/logo2.png"),
                          width: 78,
                          height: 131,
                        ),
                      ),
                      Text(
                        "$pointsA",
                        style:
                            const TextStyle(fontSize: 70, color: Colors.white),
                      ),
                      MyButton(
                          color: Colors.cyan,
                          text: "Add 1 Points",
                          on: () {
                            setState(() {
                              ++pointsA;
                            });
                          }),
                      const SizedBox(
                        height: 5,
                      ),
                      MyButton(
                          color: Colors.cyan,
                          text: "Add 2 Points",
                          on: () {
                            setState(() {
                              pointsA += 2;
                            });
                          }),
                      const SizedBox(
                        height: 5,
                      ),
                      MyButton(
                          color: Colors.cyan,
                          text: "Add 3 Points",
                          on: () {
                            setState(() {
                              pointsA += 3;
                            });
                          })
                    ],
                  ), //////////////////////////////////////////////////////////////
                  const SizedBox(
                      height: 500,
                      child: VerticalDivider(
                        color: Colors.grey,
                        thickness: 2,
                        indent: 50,
                        endIndent: 50,
                      )),
                  Column(
                    children: [
                      const Text(
                        "Team B",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "pac",
                            color: Colors.white),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Image(
                          image: AssetImage("images/logo.png"),
                          width: 78,
                          height: 131,
                        ),
                      ),
                      Text(
                        "$pointsB",
                        style:
                            const TextStyle(fontSize: 70, color: Colors.white),
                      ),
                      MyButton(
                          color: Colors.cyan,
                          text: "Add 1 Points",
                          on: () {
                            setState(() {
                              ++pointsB;
                            });
                          }),
                      const SizedBox(
                        height: 5,
                      ),
                      MyButton(
                          color: Colors.cyan,
                          text: "Add 2 Points",
                          on: () {
                            setState(() {
                              pointsB += 2;
                            });
                          }),
                      const SizedBox(
                        height: 5,
                      ),
                      MyButton(
                          color: Colors.cyan,
                          text: "Add 3 Points",
                          on: () {
                            setState(() {
                              pointsB += 3;
                            });
                          })
                    ],
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
                  setState(() {
                    pointsA = 0;
                    pointsB = 0;
                  });
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
                  ? const WinContainer(text: "The match is drawn", color: Colors.white)
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
