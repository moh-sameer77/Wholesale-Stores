class Credentials {
  late String email;
  late String password;

  Credentials(this.email, this.password);
  Credentials.init();

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };

  factory Credentials.fromJson(dynamic json) {
    return Credentials(
      json['email'] ,
      json['password'] ,
    );
  }
}