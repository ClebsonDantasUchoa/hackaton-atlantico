import 'package:hackaton_atlantico/services/API.dart';
import 'package:hackaton_atlantico/models/Evento.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:convert';

class EventoBloc {

  static EventoBloc _ourInstance;

  EventoBloc._internalConstructor();

  static EventoBloc getInstance(){
    return _ourInstance;
  }

  factory EventoBloc(){
    _ourInstance ??= EventoBloc._internalConstructor();
    return _ourInstance;
  }

  final BehaviorSubject<List<Evento>> _eventos = new BehaviorSubject<List<Evento>>();

  Stream get outEventos => _eventos.stream;

  void buscarEventos(){
    API().getRequest(path: "/event").then((response){
      var decoded = json.decode(response.body);
      List<Evento> eventos = converterArrayParaListaDeEventos(decoded);
      _eventos.sink.add(eventos);
      print("Eventos carregados");
      return eventos;
    });
  }

  List<Evento> converterArrayParaListaDeEventos(var array){
    List<Evento> eventos = new List<Evento>();
    for(var item in array){
      try{
        Evento evento = Evento.fromJson(item);
        eventos.add(evento);
      }catch(error){
        print("Error ao converter array para palestra: " + error.toString());
      }
    }
    return eventos;
  }

  void dispose(){
    _eventos.close();
  }

}