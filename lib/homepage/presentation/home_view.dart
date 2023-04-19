import 'package:flutter/material.dart';
import 'package:passenger_client/homepage/presentation/widgets/home_map.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const HomeMap();
  }
}
