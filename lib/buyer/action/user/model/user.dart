class User {
  late String firstName;
  late String lastName;
  late String email;
  late Gender gender;
  late DateTime dateOfBirth;
  late String password;
  late String confirmPassword;
  late String token = "";
  late StudentType studentType;
  // late bool isAdmin;

  User(this.firstName, this.lastName, this.email, this.gender, this.dateOfBirth,
      this.token, this.studentType);
      

  User.init();

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        "email": email,
        "gender": gender.name.toString().toUpperCase(),
        "dateOfBirth": DateTime.parse(dateOfBirth.toString())
            .toLocal()
            .toString()
            .replaceFirst(" ", "T"),
        "password": password,
        "studentType": studentType.name.toString().toUpperCase(),
      };

  factory User.fromJson(dynamic json) {
    return User(
      
      json["firstName"],
      json["lastName"],
      json["email"],
      Gender.values.firstWhere((element) =>
          element.toString().contains(json["gender"].toString().toLowerCase())),
      DateTime.parse(json["dateOfBirth"]).toLocal(),
      json["token"],

      StudentType.values.firstWhere((element) => element
          .toString()
          .contains(json["studentType"].toString().toLowerCase())),
    );
  }
}

enum StudentType { enrolled, notEnrolled }

enum Gender { male, female }