import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/product_detail_page.dart';
import 'pages/product_list_page.dart';
import 'pages/splash_screen.dart';
import 'routes/app_routes.dart';

void main() => runApp(const TokoApp());

class TokoApp extends StatelessWidget {
  const TokoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.products: (context) => const ProductListPage(),
        AppRoutes.productDetail: (context) => const ProductDetailPage(),
      },
    );
  }
}