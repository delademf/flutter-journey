class SignUpModel {
  String? firstName;
  String? lastName;
  int? age;
  String? email;
  String? password;
  int? phoneNumber;

  SignUpModel({
    this.firstName,
    this.lastName,
    this.age,
    this.email,
    this.password,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "age": age,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
      };
}
