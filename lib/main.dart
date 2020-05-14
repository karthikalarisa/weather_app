import 'package:flutter/material.dart';
import 'package:srl/screens/weather_screen.dart';
import 'package:srl/services/app_config/app_config.dart';
import 'package:srl/services/open_weather/open_weather.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() {
  runApp(SRWeatherApp());
}

class SRWeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [
        /// AppConfig
        Inject<AppConfig>(
          () => AppConfig(),
        ),

        /// OpenWeather
        Inject<OpenWeather>(
          () => OpenWeather(
            config: IN.get<AppConfig>(),
          ),
        ),
      ],
      builder: (context) {
        return MaterialApp(
          title: 'SR Weather',
          theme: ThemeData(
            fontFamily: "Brandon",
            colorScheme: ColorScheme.light().copyWith(
              primary: Color(0xff2962FF),
              primaryVariant: Color(0xff0039cb),
              secondary: Color(0xff3BACFF),
              secondaryVariant: Color(0xff007ecb),
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          darkTheme: ThemeData(
            fontFamily: "Brandon",
            brightness: Brightness.dark,
            colorScheme: ColorScheme.dark().copyWith(
              primary: Color(0xff2962FF),
              primaryVariant: Color(0xff0039cb),
              secondary: Color(0xff3BACFF),
              secondaryVariant: Color(0xff007ecb),
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: {
            "/": (_) => WeatherScreen(),
          },
        );
      },
    );
  }
}
