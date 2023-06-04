import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passenger_client/homepage/blocs/map_cubit.dart';
import 'package:passenger_client/homepage/presentation/home_page.dart';

import 'homepage/domain/services/bikun_service.dart';
import 'homepage/domain/services/map_service.dart';

import 'homepage/locator.dart';

class PassengerClientApp extends StatelessWidget {
  const PassengerClientApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (context) =>
              MapCubit(locator<MapService>(), locator<BikunService>())),
    ], child: const MaterialApp(home: HomePage()));
  }
}
