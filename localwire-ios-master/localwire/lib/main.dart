import 'package:flutter/material.dart';
import './pages/splashPage.dart';
import 'package:flutter/services.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Brightness brightness;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  brightness =
      (prefs.getBool('isDarkMode') ?? false) ? Brightness.dark : Brightness.light;
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(new MyApp());
  });
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (Brightness brightness) {
        if (brightness == Brightness.dark) {
          return ThemeData(
            brightness: brightness,
            cardTheme: CardTheme(
              color: Colors.black26,
            ),
            backgroundColor: Color(0xFF2A2A2A),
            scaffoldBackgroundColor: Color.fromARGB(255, 55, 55, 55),
            iconTheme: IconThemeData(
              color: Colors.grey
            ),
            textTheme: TextTheme(
              title: TextStyle(
                color: Colors.white70
              ),
              subtitle: TextStyle(
                color: Color.fromARGB(255, 187, 187, 187)
              )
            )
          );
        } else {
          return ThemeData(
            brightness: brightness,
            cardTheme: CardTheme(
              color: Colors.white
            ),
            scaffoldBackgroundColor: Colors.white,
            backgroundColor: Color(0xfff5f5f5),
            iconTheme: IconThemeData(
              color: Colors.black
            ),
            textTheme: TextTheme(
              title: TextStyle(
                color: Colors.white
              )
            )
          );
        }
      },
      themedWidgetBuilder: (context, theme) {
        return new MaterialApp(
          theme: theme,
          debugShowCheckedModeBanner: false,
          title: 'LocalWire',
          home: new SplashPage(),
        );
      },
    );
  }
}
