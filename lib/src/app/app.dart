import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_list/src/screen/get_stated.dart';
import 'package:to_do_list/src/screen/home_screen.dart';


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To-Do List",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      routes: {
        '/': (context) => const GetStated(),
        "/mainScreen": (context) => const HomeScreen()
      },
    );
  }
}
