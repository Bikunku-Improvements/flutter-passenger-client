import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passenger_client/homepage/bloc_providers.dart';
import 'package:passenger_client/homepage/presentation/home_page.dart';

class PassengerClientApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: blocProviders, child: const MaterialApp(home: HomePage()));
  }
}
