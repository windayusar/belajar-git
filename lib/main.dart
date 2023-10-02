import 'package:flutter/material.dart';
import 'package:flutter_clear_architecture/app/config/router/my_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'flutter clean acrhitecture ',
      routerConfig: MyRouter.router(),
    );
  }
}
