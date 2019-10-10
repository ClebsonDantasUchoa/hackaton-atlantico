import 'package:flutter/material.dart';
import 'package:hackaton_atlantico/models/Palestra.dart';
import 'package:hackaton_atlantico/screens/PalestraScreen.dart';
import 'package:flutter/cupertino.dart';

class PalestraCard extends StatefulWidget {
  Palestra palestra;

  PalestraCard(this.palestra);

  @override
  _PalestraCardState createState() => _PalestraCardState();
}

class _PalestraCardState extends State<PalestraCard> {

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
                Text("- " + widget.palestra.nome, textAlign: TextAlign.start,style: TextStyle(fontSize: 17, ), ),
              ],
            ),
            Icon(Icons.navigate_next, size: 35, color: Theme.of(context).primaryColor,)
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, new CupertinoPageRoute(builder: (context) => PalestraScreen(widget.palestra)));
      },
    );
  }

}
