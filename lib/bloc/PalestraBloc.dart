import 'package:hackaton_atlantico/models/Palestra.dart';
import 'package:hackaton_atlantico/services/API.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:convert';
//import 'package:shared_preferences/shared_preferences.dart';

class PalestraBloc {

  static PalestraBloc _ourInstance;
  final BehaviorSubject<List<Palestra>> _palestras = BehaviorSubject<List<Palestra>>();
  final BehaviorSubject<List<Palestra>> _favoritasStream = BehaviorSubject<List<Palestra>>();
  final List<Palestra> _palestrasFavoritas = [];
  PalestraBloc._internalConstructor();

  static PalestraBloc getInstance() {
    return _ourInstance;
  }

  factory PalestraBloc(){
   _ourInstance ??= PalestraBloc._internalConstructor();
   return _ourInstance;
  }

  Stream get outPalestras => _palestras.stream;

  Stream get outPalestrasFavoritas => _favoritasStream.stream;

  List<Palestra> get favoritas => _palestrasFavoritas;

  void buscarPalestras(String idEvento){
    API().getRequest(path: "/lectures/event/" + idEvento).then((response){
      var decoded = json.decode(response.body);
      List<Palestra> palestras = converterArrayParaListaDePalestra(decoded);
      _palestras.sink.add(palestras);
      print("palestras carregadas");
      return palestras;
    });
  }

  List<Palestra> converterArrayParaListaDePalestra(var array){
    List<Palestra> palestras = new List<Palestra>();
    for(var item in array){
      try{
        Palestra palestra = Palestra.fromJson(item);
        palestras.add(palestra);
      }catch(error){
        print("Error ao converter array para palestra: " + error.toString());
      }
    }
    return palestras;
  }

  void salvarPalestra(Palestra palestra) async{
    _palestrasFavoritas.add(palestra);
    _palestras.sink.add(_palestrasFavoritas);
  }

  void removerPalestra(Palestra palestra){
    _palestrasFavoritas.remove(palestra);
    _palestras.sink.add(_palestrasFavoritas);
  }

  void dispose(){
    _palestras.close();
  }

}