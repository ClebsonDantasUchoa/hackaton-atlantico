import 'package:flutter/material.dart';
import 'package:hackaton_atlantico/components/PalestraCard.dart';
import 'package:hackaton_atlantico/models/Palestra.dart';
import 'package:hackaton_atlantico/bloc/PalestraBloc.dart';
import 'package:hackaton_atlantico/models/Evento.dart';

class PalestrasDisponiveis extends StatefulWidget {
  final Evento evento;

  PalestrasDisponiveis(this.evento);

  @override
  _PalestrasDisponiveisState createState() => _PalestrasDisponiveisState();
}

class _PalestrasDisponiveisState extends State<PalestrasDisponiveis> {

  List<Palestra> _palestras;

  _PalestrasDisponiveisState(){
    PalestraBloc().outPalestras.listen((item){
      if(mounted) setState(() {
        _palestras = item;
      });
    });
  }

  @override
  void didChangeDependencies() {
    PalestraBloc().buscarPalestras(widget.evento.id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Palestras de " + widget.evento.nome),),
      body: decideRendering()
    );
  }

  Widget decideRendering(){
    if(_palestras == null) return Center( child: CircularProgressIndicator() );
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index){
          return PalestraCard(_palestras[index]);
        },
        itemCount: _palestras == null ? 0 : _palestras.length,
      ),
    );
  }

}
