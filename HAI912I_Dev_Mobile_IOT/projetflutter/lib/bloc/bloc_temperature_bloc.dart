import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projetflutter/bloc/bloc_temperature_state.dart';
import 'package:projetflutter/service/temperature_service.dart';
part 'bloc_temperature_event.dart';


class TemperatureBloc extends Bloc<TemperatureEvent, TemperatureState> {
  final ServiceTemperature serviceTemperature;

  TemperatureBloc(this.serviceTemperature) : super(TemperatureInitial()) {
    on<FetchTemperature>((event, emit) async {
      try {
        var temperatures = await ServiceTemperature.getTemperatures();
        emit(TemperatureLoaded(temperatures));
      } catch (e) {
        emit(TemperatureError(e.toString()));
      }
    });
  }
}

