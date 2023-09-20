import 'dart:core';

class Cliente {

  int? _id;
  String? _nome, _cognome, _email, _residenza, _dataNascita, _IBAN, _docID, _username, _statoFedelta;
  int? _saldoPunti;
  double? _saldoGioco;


  get id => _id;

  Cliente(this._id, this._nome, this._cognome, this._docID, this._email, this._username, this._IBAN, this._residenza, this._dataNascita,  this._statoFedelta, this._saldoGioco, this._saldoPunti);

  get statoFedelta => _statoFedelta;

  set statoFedelta(value) {
    _statoFedelta = value;
  }

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

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
        json['id'],
        json['nome'],
        json['cognome'],
        json['documento_identita'],
        json['email'],
        json['username'],
        json['iban'],
        json['residenza'],
        json['data_nascita'],
        json['statoFedelta'],
        json['saldoGioco'],
        json['saldoPunti'],
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

  int? get saldoPunti => _saldoPunti;



  double? get saldoGioco => _saldoGioco;


}