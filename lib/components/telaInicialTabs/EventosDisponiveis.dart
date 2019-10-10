import 'package:hackaton_atlantico/components/EventoCard.dart';
import 'package:hackaton_atlantico/models/Evento.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_atlantico/bloc/EventoBloc.dart';

class EventosDisponiveis extends StatefulWidget {
  @override
  _EventosDisponiveisState createState() => _EventosDisponiveisState();
}

class _EventosDisponiveisState extends State<EventosDisponiveis> {

  List<Evento> _eventos;

  @override
  void initState() {
    EventoBloc().outEventos.listen((item){
      if(mounted) setState(() {
        _eventos = item;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return decideRendering();
  }

  Widget decideRendering(){
    if(_eventos == null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index){
          return EventoCard(_eventos[index]);
        },
        itemCount: _eventos == null ? 0 : _eventos.length,
      ),
    );
  }
}
