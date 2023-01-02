class Auth {
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  Auth({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  Auth.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'token_type': tokenType,
      'expires_in': expiresIn,
    };
  }
}
