class Constants {
  // app info
  static final String APP_VERSION = "0.0.1";
  static final String APP_NAME = "Store";

  // addresses
  static final String ADDRESS_STORE_SERVER = "localhost:8081";
  static final String ADDRESS_AUTHENTICATION_SERVER = "localhost:8080";

  // authentication
  static final String REALM = "psw-realm";
  static final String CLIENT_ID = "psw-admin-client";
  static final String CLIENT_SECRET = "";
  static final String REQUEST_LOGIN = "/auth/realms/" + REALM + "/protocol/openid-connect/token";
  static final String REQUEST_LOGOUT = "/auth/realms/" + REALM + "/protocol/openid-connect/logout";

  // requests --da aggiornare
  static final String REQUEST_SEARCH_CLIENTE = "/utente/cliente";
  static final String REQUEST_SEARCH_CLIENTE_BY_NOME = "/utente/cliente/nome";
  static final String REQUEST_SEARCH_CLIENTE_BY_COGNOME = "/utente/cliente/cognome";
  static final String REQUEST_ADD_CLIENTE = "/utente/cliente";
  static final String REQUEST_DELETE_CLIENTE = "/utente/cliente/id";
  static final String REQUEST_SEARCH_CLIENTE_BY_EMAIL = "/utente/cliente/email";
  static final String REQUEST_SEARCH_CLIENTE_BY_USERNAME = "/utente/cliente/username";

  static final String REQUEST_SEARCH_DIPENDENTE_BY_EMAIL = "/utente/dipendente/email";




  //orders

  // responses
  static final String RESPONSE_ERROR_MAIL_USER_ALREADY_EXISTS =
      "ERROR_MAIL_USER_ALREADY_EXISTS";

  // messages
  static final String MESSAGE_CONNECTION_ERROR = "connection_error";
}
