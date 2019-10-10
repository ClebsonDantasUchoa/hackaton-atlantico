import 'package:flutter/material.dart';
import 'package:hackaton_atlantico/models/Palestra.dart';
import 'package:hackaton_atlantico/bloc/PalestraBloc.dart';
import 'package:hackaton_atlantico/components/cards/PalestraCard.dart';

class PalestrasSalvas extends StatefulWidget {
  @override
  _PalestrasSalvasState createState() => _PalestrasSalvasState();
}

class _PalestrasSalvasState extends State<PalestrasSalvas> {

  List<Palestra> _palestras = [];

  _PalestrasSalvasState(){
    PalestraBloc().outPalestrasFavoritas.listen((item){
      if(mounted) setState(() {
        _palestras = item;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index){
          return PalestraCard(_palestras[index]);
        },
        itemCount: _palestras.length,
      ),
    );
  }

}
