class LoginResModel {
  String? responseCode;
  String? responseMessage;
  Data? data;

  LoginResModel({
    this.responseCode,
    this.responseMessage,
    this.data,
  });

  factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
        responseCode: json["responseCode"],
        responseMessage: json["responseMessage"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "responseCode": responseCode,
        "responseMessage": responseMessage,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  int? age;
  String? email;
  String? password;
  int? phoneNumber;

  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.age,
    this.email,
    this.password,
    this.phoneNumber,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        age: json["age"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "age": age,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
      };
}
