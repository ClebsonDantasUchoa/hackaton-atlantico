import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_atlantico/models/Palestra.dart';
import 'package:hackaton_atlantico/bloc/PalestraBloc.dart';
import 'package:hackaton_atlantico/components/AudioPlayer.dart';

class PalestraScreen extends StatefulWidget {

  Palestra _palestra;
  PalestraScreen(this._palestra);

  @override
  _PalestraState createState() => _PalestraState();
}

class _PalestraState extends State<PalestraScreen> {
  bool _salva = false;

//  Palestra _palestra = Palestra(
//      "Aula de GPS",
//      "sudhasdaisjbdaosudasodiasdoasda" +
//          "aoskdnaosdnasodinasdoiansdaosdnaosdnasdoansdoaksdaosudasoudhasdiabsdiaubsdiabsdiausbdk" +
//          "asodihasodiasodiapfjasdfojiasbdofjiafbhkcugfcusifshdfbhofiuchsndofisuhndfocaushnodfusn" +
//          "asjdnaspdajdpanchfanusdacofaoxhdfxoanxdxofahdodxdhfoajfdhonacshfosdjfhsdjfahsodfjsadof" +
//          "foausdhfpajsdhfoasjdfnajsdfasdfjnadsjcaspufhpdscjnpwffuichpwdiucfiwpdufcpw9ufwiufwiebf" +
//          "açfsdljfpasdjfasdjfpasdnfpsdjfapsdfhaspdfhpsadjfpsdjfhpasdjfhpasdjhfpsadjfhpsdjfhpasdh", "a");

  Widget decidirMostrarIconeDeDownload(){
    if(!_salva){
      return GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 15),
          child: Icon(Icons.arrow_downward),
        ),
        onTap: (){
          setState(() {
            _salva = !_salva;
          });
          PalestraBloc().salvarPalestra(widget._palestra);
        },
      );
    }
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 15),
        child: Icon(Icons.delete),
      ),
      onTap: (){
        setState(() {
          _salva = !_salva;
        });
        PalestraBloc().removerPalestra(widget._palestra);
      },
    );
  }

  @override
  void didChangeDependencies() {
    setState(() {
      _salva = PalestraBloc().favoritas.contains(widget._palestra);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            widget._palestra.nome,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            Builder(builder: (BuildContext context){
              return decidirMostrarIconeDeDownload();
            },)
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //AudioPlayer("https://hackathon-aws-qxd.s3.us-east-2.amazonaws.com/audios/5d9e9285fd4e2771da8619d1.mp3"),
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.5), blurRadius: 2)
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[

                        RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: 'Resumo: \n',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20)),
                            TextSpan(text: widget._palestra.transcripton, style: TextStyle(color: Colors.black, fontSize: 18))
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
