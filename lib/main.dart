import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:passenger_client/app.dart';
import 'package:passenger_client/homepage/locator.dart';
import 'package:passenger_client/passenger_client_observer.dart';

void main() async {
  Bloc.observer = PassengerClientObserver();

  await initializeDependencies();

  runApp(const PassengerClientApp());
}
