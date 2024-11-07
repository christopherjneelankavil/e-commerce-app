import 'dart:convert';

class User{
  final String id;
  final String fullName;
  final String username;
  final String email;
  final String password;
  final String state;
  final String city;
  final String locality;

  User({required this.id, required this.fullName, required this.username, required this.email, required this.password, required this.state, required this.city, required this.locality});

  //serialization to Map
  Map<String,dynamic> toMap() {
    return <String,dynamic> {
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
}