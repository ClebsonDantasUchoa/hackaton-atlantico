import 'package:flutter/material.dart';
import 'package:hackaton_atlantico/models/Evento.dart';
import 'package:hackaton_atlantico/screens/PalestrasDisponiveisScreen.dart';
import 'package:flutter/cupertino.dart';

class EventoCard extends StatefulWidget {
  Evento evento;

  EventoCard(this.evento);

  @override
  _EventoCardState createState() => _EventoCardState();
}

class _EventoCardState extends State<EventoCard> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Theme.of(context).primaryColor, width: 1)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("- " + widget.evento.nome, textAlign: TextAlign.start,style: TextStyle(fontSize: 20),),
                Text(widget.evento.description)
              ],
            ),
            Icon(Icons.navigate_next, size: 35, color: Theme.of(context).primaryColor,)
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, new CupertinoPageRoute(builder: (context) => PalestrasDisponiveis(widget.evento)));
      },
    );
  }

}
