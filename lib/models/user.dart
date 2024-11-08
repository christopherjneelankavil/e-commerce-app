import 'dart:convert';

class User {
  //define fields
  final String id;
  final String fullName;
  final String username;
  final String email;
  final String password;
  final String state;
  final String city;
  final String locality;

  //create constructor
  User(
      {required this.id,
      required this.fullName,
      required this.username,
      required this.email,
      required this.password,
      required this.state,
      required this.city,
      required this.locality});

  //serialization to Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'username': username,
      'email': email,
      'password': password,
      'state': state,
      'city': city,
      'locality': locality
    };
  }

  //conversion to json
  String toJson() => jsonEncode(toMap());

  //deserialization from Map
  //converts to user object
  //if no data then empty string is assigned
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['_id'] as String? ?? '',
        fullName: map['fullname'] as String? ?? '',
        username: map['username'] as String? ?? '',
        email: map['email'] as String? ?? '',
        password: map['password'] as String? ?? '',
        state: map['state'] as String? ?? '',
        city: map['city'] as String? ?? '',
        locality: map['locality'] as String? ?? '');
  }

  //deserialization from json
  //if the given data is in json first convert it into map and then to user object using jsonDecode(fromMap)
  factory User.fromJson(String source) =>
      User.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
