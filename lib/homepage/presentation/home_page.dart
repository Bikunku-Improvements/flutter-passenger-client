import 'package:flutter/material.dart';
import 'package:passenger_client/homepage/presentation/home_view.dart';
import 'package:passenger_client/homepage/presentation/widgets/main_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(),
      body: HomeView(),
    );
  }
}
