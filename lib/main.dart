import 'package:bronzedblue/constants/global_variables.dart';
import 'package:bronzedblue/features/auth/screens/SignUp_screen.dart';
import 'package:bronzedblue/features/auth/screens/login_screen.dart';
import 'package:bronzedblue/features/auth/services/auth_services.dart';
import 'package:bronzedblue/features/home/screen/home_screen.dart';
import 'package:bronzedblue/providers/user_provider.dart';
import 'package:bronzedblue/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(create: (context) => UserListProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Authservice authservice = Authservice();
  @override
  void initState() {
    super.initState();
    authservice.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BronzedBlue',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.textColor,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      onGenerateRoute: (routeSettings) => generateRoute(routeSettings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const HomeScreen()
          : const SignUpScreen(),
    );
  }
}
