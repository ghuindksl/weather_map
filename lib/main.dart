import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_map/api/client.dart';
import 'package:weather_map/api/weathermodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ModelView modelView = ModelView();
    Client a = Client();
    modelView.getWeather(a, 25.4, 87.5);
    print(modelView._nameOfCity);
    return Provider(
      create: (context) => modelView,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});


  @override
  Widget build(BuildContext context) {

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
                "",
                style: TextStyle(
                  fontSize: 34,
                  height: 41 / 34,
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
} //TODO: создать модель view. там должна быть поля в которых будут храниться значения отображаемых данных. публичный метод который запрвашиет текущую погоду и эту модель через провайдер и подписаться на изменения 

class ModelView extends ChangeNotifier{
  String _nameOfCity = "";
  double _temp = 0.0;
  double _tempMin = 0.0;
  double _tempMax = 0.0;
  List<WeatherModel> _desc =[];
  Future<void> getWeather(Client caseWeather, double lat, double lot) async {
    var b = await caseWeather.getCurrentWeather(lat, lot);
    _nameOfCity = b.name;
    _temp=b.main.temp;
    _tempMax=b.main.temp_max;
    _tempMin=b.main.temp_min;
    _desc=b.weather;
    notifyListeners();
  }
  String get name => _nameOfCity;
  double get temp => _temp;
  double get tempMin => _tempMin;
  double get tempMax => _tempMax;
  List<WeatherModel> get descsript => _desc;
}