class Evento{

  String nome;
  String description;
  String id;

  Evento(this.nome, this.description, this.id);

  String get getNome => nome;
  String get getDescription => description;
  String get getId => id;

  factory Evento.fromJson(Map<String, dynamic> json){
    return Evento(
      json["name"],
      json["description"],
      json["_id"]
    );
  }
}