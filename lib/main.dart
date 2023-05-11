import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:passenger_client/app.dart';
import 'package:passenger_client/common/configs/firebase_options.dart';
import 'package:passenger_client/homepage/locator.dart';
import 'package:passenger_client/passenger_client_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = PassengerClientObserver();

  await initializeDependencies();

  runApp(const PassengerClientApp());
}
