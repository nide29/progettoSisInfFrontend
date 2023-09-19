class Constants {
  // app info
  static final String APP_VERSION = "0.0.1";
  static final String APP_NAME = "Store";

  // addresses
  static final String ADDRESS_STORE_SERVER = "localhost:8081";
  static final String ADDRESS_AUTHENTICATION_SERVER = "localhost:8080";

  // authentication
  static final String REALM = "Store";
  static final String CLIENT_ID = "StoreClient";
  static final String CLIENT_SECRET = "Q9XFwm4mLGSAfr1wmBUTZjnCLM58cEV8";
  static final String REQUEST_LOGIN =
      "/realms/" + REALM + "/protocol/openid-connect/token";
  static final String REQUEST_LOGOUT =
      "/realms/" + REALM + "/protocol/openid-connect/logout";

  // requests --da aggiornare
  //orders

  // responses
  static final String RESPONSE_ERROR_MAIL_USER_ALREADY_EXISTS =
      "ERROR_MAIL_USER_ALREADY_EXISTS";

  // messages
  static final String MESSAGE_CONNECTION_ERROR = "connection_error";
}
