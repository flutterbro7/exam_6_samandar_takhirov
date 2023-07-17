import 'package:flutter/material.dart';

import 'screens/login_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Registration App",
      theme: ThemeData(useMaterial3: true),
      home: LoginPage(),
    );
  }
}
