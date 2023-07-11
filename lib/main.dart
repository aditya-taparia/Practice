import 'package:flutter/material.dart';
import 'package:practice/components/sizeable_window.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class DarkThemePreference {
  static const themeStatus = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeStatus, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeStatus) ?? false;
  }
}

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getTheme();
  }

  void getTheme() async {
    themeChangeProvider.darkTheme = await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return themeChangeProvider;
          },
        ),
      ],
      child: Consumer<DarkThemeProvider>(builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
          title: 'Practice',
          debugShowCheckedModeBanner: false,
          theme: themeChangeProvider.darkTheme
              ? ThemeData(
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Color(0xff27323a),
                    foregroundColor: Colors.white,
                    elevation: 5,
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'SourceCodePro',
                    ),
                    actionsIconTheme: IconThemeData(
                      color: Colors.white,
                    ),
                  ),
                  textSelectionTheme: TextSelectionThemeData(
                    selectionColor: Colors.blue.withOpacity(0.5),
                    selectionHandleColor: Colors.blue.withOpacity(0.5),
                  ),
                  textTheme: const TextTheme(
                    bodyLarge: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'SourceCodePro',
                    ),
                    bodyMedium: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'SourceCodePro',
                    ),
                    bodySmall: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'SourceCodePro',
                    ),
                  ),
                  scaffoldBackgroundColor: const Color(0xff0e161f),
                  useMaterial3: true,
                  cardColor: const Color(0xff0e161f),
                  iconButtonTheme: IconButtonThemeData(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.blueGrey.withOpacity(0.25)),
                      shape: MaterialStateProperty.all(
                        const StarBorder(
                          valleyRounding: 0.2,
                          innerRadiusRatio: 0.8,
                          pointRounding: 0.5,
                          points: 8,
                        ),
                      ),
                      padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
                    ),
                  ),
                )
              : ThemeData(
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Color(0xff005a9c),
                    foregroundColor: Colors.white,
                    elevation: 5,
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'SourceCodePro',
                    ),
                    actionsIconTheme: IconThemeData(
                      color: Colors.white,
                    ),
                  ),
                  textSelectionTheme: TextSelectionThemeData(
                    selectionColor: Colors.blue.withOpacity(0.5),
                    selectionHandleColor: Colors.blue.withOpacity(0.5),
                  ),
                  textTheme: const TextTheme(
                    bodyLarge: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'SourceCodePro',
                    ),
                    bodyMedium: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'SourceCodePro',
                    ),
                    bodySmall: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'SourceCodePro',
                    ),
                  ),
                  scaffoldBackgroundColor: Colors.grey.shade200,
                  useMaterial3: true,
                  cardColor: Colors.grey.shade200,
                  iconButtonTheme: IconButtonThemeData(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.25)),
                      shape: MaterialStateProperty.all(
                        const StarBorder(
                          valleyRounding: 0.2,
                          innerRadiusRatio: 0.8,
                          pointRounding: 0.5,
                          points: 8,
                        ),
                      ),
                    ),
                  ),
                ),
          home: const MainHome(),
        );
      }),
    );
  }
}

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeChange.darkTheme ? const Color(0xff0e161f) : Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Practice'),
        elevation: 5,
        scrolledUnderElevation: 5,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              onPressed: () {},
              tooltip: 'About Platform',
              icon: const Icon(
                Icons.info_outline_rounded,
                size: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              onPressed: () {},
              tooltip: 'Saved Files',
              icon: const Icon(
                Icons.folder_rounded,
                size: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              onPressed: () {
                setState(() {
                  themeChange.darkTheme = !themeChange.darkTheme;
                });
              },
              tooltip: themeChange.darkTheme ? 'Light Theme' : 'Dark Theme',
              icon: Icon(
                themeChange.darkTheme ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 4.0),
        ],
      ),
      body: SizeableWindow(
        darkThemeEnabled: themeChange.darkTheme,
      ),
    );
  }
}
