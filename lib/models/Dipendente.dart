import 'dart:core';

class Dipendente {

  String? _id, _nome, _cognome, _email, _residenza, _dataNascita, _IBAN, _docID, _username, _ruolo;


  get id => _id;

  Dipendente(this._id, this._nome, this._cognome, this._email, this._residenza, this._dataNascita, this._IBAN, this._docID, this._username, this._ruolo);

  /*
  Cliente.fromJson(Map<String, dynamic> json) {
      _id = json['id'];
      _nome = json['nome'];
      _cognome = json['cognome'];
      _dataNascita = json['data_nascita'];
      _residenza = json['residenza'];
      _docID = json['documento_identita'];
      _email = json['email'];
      _username= json['username'];
      _IBAN = json['iban'];
  }
  */

  factory Dipendente.fromJson(Map<String, dynamic> json) {
    return Dipendente(
        json['id'],
        json['nome'],
        json['cognome'],
        json['data_nascita'],
        json['residenza'],
        json['documento_identita'],
        json['email'],
        json['username'],
        json['iban'],
        json['ruolo']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
      'cognome': _cognome,
      'documento_identita': _docID,
      'email': _email,
      'username':_username,
      'iban': _IBAN,
      'residenza': _residenza,
      'data_nascita': _dataNascita,
      'ruolo' : _ruolo
    };
  }

  get nome => _nome;

  set nome(value) {
    _nome = value;
  }

  get username => _username;

  set username(value) {
    _username = value;
  }

  get docID => _docID;

  set docID(value) {
    _docID = value;
  }

  get IBAN => _IBAN;

  set IBAN(value) {
    _IBAN = value;
  }

  get dataNascita => _dataNascita;

  set dataNascita(value) {
    _dataNascita = value;
  }

  get residenza => _residenza;

  set residenza(value) {
    _residenza = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  get cognome => _cognome;

  set cognome(value) {
    _cognome = value;
  }

  get ruolo => _ruolo;

  set ruolo(value) {
    _ruolo = value;
  }
}