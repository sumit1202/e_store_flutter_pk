import 'package:flutter/material.dart';
import 'package:flutter_pk/pages/cart_page.dart';
import 'package:flutter_pk/pages/home_page.dart';
import 'package:flutter_pk/pages/login_page.dart';
import 'package:flutter_pk/utils/my_theme.dart';
import 'package:flutter_pk/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter pk',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme().lightThemeData,
      darkTheme: MyTheme().darkThemeData,

      //home: const HomePage(),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.cartRoute: (context) => const CartPage(),
        // MyRoutes.homeDetailsRoute: (context) => const HomeDetailsPage(),
      },
    );
  }
}
