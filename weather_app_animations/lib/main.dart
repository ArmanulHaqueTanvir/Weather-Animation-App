import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:weather_app_animations/widget/rain.dart';
import 'package:weather_app_animations/widget/time.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isBottomModel = false;
  // var date = DateTime.utc();
  final Key _key = GlobalKey();
  bool showDate = true;

  var data = [
    {'time': '09:00 AM', 'temp': '19'},
    {'time': '10:00 AM', 'temp': '20'},
    {'time': '11:00 AM', 'temp': '21'},
    {'time': '12:00 AM', 'temp': '18'},
    {'time': '13:00 AM', 'temp': '17'},
    {'time': '14:00 AM', 'temp': '16'},
    {'time': '15:00 AM', 'temp': '15'},
    {'time': '16:00 AM', 'temp': '11'},
    {'time': '17:00 AM', 'temp': '20'},
    {'time': '18:00 AM', 'temp': '19'},
  ];
  @override
  Widget build(BuildContext context) {
    final res_height = MediaQuery.of(context).size.height;
    // final res_width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          setState(() {
            showDate = true;
          });
          showModalBottomSheet(
              context: context,
              elevation: 0,
              backgroundColor: Colors.transparent,
              barrierColor: Colors.black.withAlpha(1),
              builder: (builder) {
                return Container(
                  height: 600,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          SizedBox(height: res_height * 0.04),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/clock.png",
                                color: Colors.amber,
                                width: 25,
                              ),
                              SizedBox(width: res_height * 0.04),
                              const Text(
                                "Today's Changes",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: res_height * 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: const Color(0xff763bd7)
                                        .withOpacity(0.1),
                                    radius: 25,
                                    child: Image.asset(
                                      "assets/images/rainy.png",
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "Rainy wtih\nshort storms",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: const Color(0xffff5580)
                                        .withOpacity(0.1),
                                    radius: 25,
                                    child: Image.asset(
                                      "assets/images/wind.png",
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "Wind EN\n8 km/h",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: res_height * 0.85),
                          ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  const SizedBox(height: 5),
                                  TimeWidget(
                                    data: data[index],
                                    active: index == 1,
                                  ),
                                  const Divider(color: Colors.grey),
                                ],
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).whenComplete(() {
            setState(() {
              showDate = false;
            });
          });
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xff763bd7),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 13,
                  right: 13,
                  top: 13,
                  bottom: 23,
                ),
                child: ListTile(
                  leading: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      "assets/images/clock.png",
                      color: Colors.amber,
                    ),
                  ),
                  title: const Text(
                    "Today's Changes",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      "assets/images/calendar.png",
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        height: res_height * 1,
        color: const Color(0xff763bd7),
        child: Stack(
          children: [
            AnimatedContainer(
              padding: const EdgeInsets.only(left: 20),
              duration: const Duration(microseconds: 600),
              height: showDate ? res_height * 0.15 : res_height * 0.125,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 35,
                      width: 35,
                      child: Image.asset("assets/images/sun.png"),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "What to wear",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 70,
                      height: 120,
                      color: const Color(0xffff5580),
                      child: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    AnimatedContainer(
                      color: const Color(0xffff5580),
                      width: 70,
                      height: showDate ? 110 : 0,
                      duration: const Duration(milliseconds: 600),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Sat",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            '03',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Transform.rotate(
              angle: math.pi / 5,
              child: Container(
                height: res_height * 1,
                child: ParallaxRain(
                  key: _key,
                  dropColors: const [
                    Colors.black,
                    Colors.white,
                    Color(0xffff5580)
                  ],
                  trail: true,
                ),
              ),
            ),
            Positioned(
              right: 40,
              top: res_height * 0.243,
              child: Image.asset(
                "assets/images/girl.png",
                height: res_height * 0.5,
              ),
            ),
            Positioned(
              left: 20,
              top: res_height * 0.165,
              child: Column(
                children: const [
                  Text(
                    "19°",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "feels like 17°",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: res_height * 0.05,
              left: 20,
              child: const Text(
                "Palestine",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
