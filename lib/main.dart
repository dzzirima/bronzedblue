import 'package:bronzedblue/features/auth/screens/login_screen.dart';
import 'package:bronzedblue/providers/user_provider.dart';
import 'package:bronzedblue/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BronzedBlue',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (routeSettings) => generateRoute(routeSettings),
        home: const LoginScreen());
  }
}
