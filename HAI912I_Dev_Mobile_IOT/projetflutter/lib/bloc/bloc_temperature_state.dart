import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projetflutter/bloc/bloc_temperature_bloc.dart';
import 'package:projetflutter/service/temperature_service.dart';

@immutable
abstract class TemperatureState {}
class TemperatureInitial extends TemperatureState {}
class TemperatureLoaded extends TemperatureState {
  final List<Map<String, dynamic>> temperatures;
  TemperatureLoaded(this.temperatures);
}
class TemperatureError extends TemperatureState {
  final String error;
  TemperatureError(this.error);
}