import 'dart:convert';

class Palestra{
  String id;
  String nome;
  String transcripton;
  //Strind description;

  Palestra(this.nome, this.transcripton, this.id);

  factory Palestra.fromJson(Map<String, dynamic> json){
    return Palestra(
      json["title"],
      json["transcripton"]["body"] ?? "",
      json["id"],
    );
  }

  Map<String, dynamic> convertToMap(){
    return {
      'id': id,
      'nome': nome,
      'transcription': transcripton
    };
  }

  String convertToJson(){
    return json.encode(this.convertToMap());
  }

}