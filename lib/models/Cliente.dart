import 'dart:core';

class Cliente {

  late String _id, _nome, _cognome, _email, _residenza, _dataNascita, _IBAN, _docID, _username;


  Cliente(Map<String, dynamic> json) {
      _id = json['id'];
      _nome = json['nome'];
      _cognome = json['cognome'];
      _dataNascita = json['data_nascita'];
      _residenza = json['residenza'];
      _docID = json['documento_identita'];
      _email = json['email'];
      _username= json['username'];
      _IBAN = json['IBAN'];
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
      'cognome': _cognome,
      'data_nascita': _dataNascita,
      'residenza': _residenza,
      'documento_identita': _docID,
      'email': _email,
      'username':_username,
      'IBAN': _IBAN,
    };
  }

}