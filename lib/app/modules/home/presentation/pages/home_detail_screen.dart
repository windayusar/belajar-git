import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_clear_architecture/app/config/router/my_routes.dart';
import 'package:go_router/go_router.dart';

class HomeDetail extends StatelessWidget {
  HomeDetail({super.key, required this.nilai});
  int nilai;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('$nilai')),
    );
  }
}
