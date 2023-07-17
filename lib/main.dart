import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/Provider.dart';
import 'Views/homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences pref = await SharedPreferences.getInstance();
  // bool visited = pref.getBool("isIntroVisited") ?? false;
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ConnectionProvider(),
          ),
          // ChangeNotifierProvider(
          //   create: (context) => WeatherProvider(),
          // ),
        ],
        builder: (context, _) {
          return MaterialApp(
            // theme: ThemeData(
            //   useMaterial3: true,
            //   // colorScheme: const ColorScheme.light(),
            // ),
            // darkTheme: ThemeData(
            //   useMaterial3: true,
            //   colorScheme: const ColorScheme.dark(
            //     brightness: Brightness.dark,
            //   ),
            // ),
            // themeMode: Provider.of<ThemeProvider>(context).isdark
            //     ? ThemeMode.dark
            //     : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            // initialRoute: (visited) ? 'SplashScreen' : 'IntroScreen',
            initialRoute: 'home',
            routes: {
              'home': (context) => const homePage(),
            },
          );
        }),
  );
}
