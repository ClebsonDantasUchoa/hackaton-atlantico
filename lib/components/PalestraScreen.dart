import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_atlantico/models/Palestra.dart';
import 'package:hackaton_atlantico/bloc/PalestraBloc.dart';

class PalestraScreen extends StatefulWidget {
  @override
  _PalestraState createState() => _PalestraState();
}

class _PalestraState extends State<PalestraScreen> {
  Palestra _palestra = Palestra(
      "Aula de GPS",
      "sudhasdaisjbdaosudasodiasdoasda" +
          "aoskdnaosdnasodinasdoiansdaosdnaosdnasdoansdoaksdaosudasoudhasdiabsdiaubsdiabsdiausbdk" +
          "asodihasodiasodiapfjasdfojiasbdofjiafbhkcugfcusifshdfbhofiuchsndofisuhndfocaushnodfusn" +
          "asjdnaspdajdpanchfanusdacofaoxhdfxoanxdxofahdodxdhfoajfdhonacshfosdjfhsdjfahsodfjsadof" +
          "foausdhfpajsdhfoasjdfnajsdfasdfjnadsjcaspufhpdscjnpwffuichpwdiucfiwpdufcpw9ufwiufwiebf" +
          "açfsdljfpasdjfasdjfpasdnfpsdjfapsdfhaspdfhpsadjfpsdjfhpasdjfhpasdjhfpsadjfhpsdjfhpasdh" +
          "aoskdnaosdnasodinasdoiansdaosdnaosdnasdoansdoaksdaosudasoudhasdiabsdiaubsdiabsdiausbdd" +
          "asodihasodiasodiapfjasdfojiasbdofjiafbhkcugfcusifshdfbhofiuchsndofisuhndfocaushnodfusn" +
          "asjdnaspdajdpanchfanusdacofaoxhdfxoanxdxofahdodxdhfoajfdhonacshfosdjfhsdjfahsodfjsadof" +
          "foausdhfpajsdhfoasjdfnajsdfasdfjnadsjcaspufhpdscjnpwffuichpwdiucfiwpdufcpw9ufwiufwiebf" +
          "açfsdljfpasdjfasdjfpasdnfpsdjfapsdfhaspdfhpsadjfpsdjfhpasdjfhpasdjhfpsadjfhpsdjfhpasdh" +
          "aoskdnaosdnasodinasdoiansdaosdnaosdnasdoansdoaksdaosudasoudhasdiabsdiaubsdiabsdiausbdd" +
          "asodihasodiasodiapfjasdfojiasbdofjiafbhkcugfcusifshdfbhofiuchsndofisuhndfocaushnodfusn" +
          "asjdnaspdajdpanchfanusdacofaoxhdfxoanxdxofahdodxdhfoajfdhonacshfosdjfhsdjfahsodfjsadof" +
          "foausdhfpajsdhfoasjdfnajsdfasdfjnadsjcaspufhpdscjnpwffuichpwdiucfiwpdufcpw9ufwiufwiebf" +
          "açfsdljfpasdjfasdjfpasdnfpsdjfapsdfhaspdfhpsadjfpsdjfhpasdjfhpasdjhfpsadjfhpsdjfhpasdh" +
          "aoskdnaosdnasodinasdoiansdaosdnaosdnasdoansdoaksdaosudasoudhasdiabsdiaubsdiabsdiausbdk" +
          "asodihasodiasodiapfjasdfojiasbdofjiafbhkcugfcusifshdfbhofiuchsndofisuhndfocaushnodfusn" +
          "asjdnaspdajdpanchfanusdacofaoxhdfxoanxdxofahdodxdhfoajfdhonacshfosdjfhsdjfahsodfjsadof" +
          "foausdhfpajsdhfoasjdfnajsdfasdfjnadsjcaspufhpdscjnpwffuichpwdiucfiwpdufcpw9ufwiufwiebf" +
          "açfsdljfpasdjfasdjfpasdnfpsdjfapsdfhaspdfhpsadjfpsdjfhpasdjfhpasdjhfpsadjfhpsdjfhpasdh" +
          "aoskdnaosdnasodinasdoiansdaosdnaosdnasdoansdoaksdaosudasoudhasdiabsdiaubsdiabsdiausbdd" +
          "asodihasodiasodiapfjasdfojiasbdofjiafbhkcugfcusifshdfbhofiuchsndofisuhndfocaushnodfusn" +
          "asjdnaspdajdpanchfanusdacofaoxhdfxoanxdxofahdodxdhfoajfdhonacshfosdjfhsdjfahsodfjsadof" +
          "foausdhfpajsdhfoasjdfnajsdfasdfjnadsjcaspufhpdscjnpwffuichpwdiucfiwpdufcpw9ufwiufwiebf" +
          "açfsdljfpasdjfasdjfpasdnfpsdjfapsdfhaspdfhpsadjfpsdjfhpasdjfhpasdjhfpsadjfhpsdjfhpasdh" +
          "aoskdnaosdnasodinasdoiansdaosdnaosdnasdoansdoaksdaosudasoudhasdiabsdiaubsdiabsdiausbdd" +
          "asodihasodiasodiapfjasdfojiasbdofjiafbhkcugfcusifshdfbhofiuchsndofisuhndfocaushnodfusn" +
          "asjdnaspdajdpanchfanusdacofaoxhdfxoanxdxofahdodxdhfoajfdhonacshfosdjfhsdjfahsodfjsadof" +
          "foausdhfpajsdhfoasjdfnajsdfasdfjnadsjcaspufhpdscjnpwffuichpwdiucfiwpdufcpw9ufwiufwiebf" +
          "açfsdljfpasdjfasdjfpasdnfpsdjfapsdfhaspdfhpsadjfpsdjfhpasdjfhpasdjhfpsadjfhpsdjfhpasdh", "a");

  Widget decidirMostrarIconeDeDownload(){
    if(!PalestraBloc().favoritas.contains(_palestra)) return GestureDetector(
      child:
      Container(
        margin: EdgeInsets.only(right: 15),
        child: Icon(Icons.arrow_downward),
      ),
      onTap: (){
        PalestraBloc().salvarPalestra(_palestra);
      },
    );
    else{
      return GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 15),
          child: Icon(Icons.delete),
        ),
        onTap: (){
          PalestraBloc().removerPalestra(_palestra);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            _palestra.nome,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            decidirMostrarIconeDeDownload()
          ],
          centerTitle: true,

        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
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
                            TextSpan(text: _palestra.transcripton, style: TextStyle(color: Colors.black, fontSize: 18))
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
