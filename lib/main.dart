import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_map/api/client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {


  const MainScreen({super.key});



  @override
  Widget build(BuildContext context) {

    Client client = Client();
    client.getCurrentWeather(44.34, 10.99);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/foon.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 139,
              ),
              const Text(
                "Montreal",
                style: TextStyle(
                  fontSize: 34,
                  height: 41/34,
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                  fontFamily: "San Francisco",
                  letterSpacing: 0.37,
                ),
              ),
              const Text(
                "19°",
                style: TextStyle(
                  fontSize: 96,
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                  fontFamily: "San Francisco",
                  letterSpacing: 0.37,
                ),
              ),
              SizedBox(
                height: 24,
                child: Text(
                  "Mostly Clear",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.5),
                    fontFamily: "San Francisco",
                    letterSpacing: 0.38,
                  ),
                ),
              ),
              const SizedBox(
                width: 115,
                height: 24,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "H:24°",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: "San Francisco",
                        letterSpacing: 0.38,
                      ),
                    ),
                    Text(
                      "L:18°",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: "San Francisco",
                        letterSpacing: 0.38,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
