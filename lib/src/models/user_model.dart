//import 'package:meta/meta.dart';
class User {
  final String uid;
  final String token;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phoneNumber;
  final String userType;

  User(
      {this.email,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.userType,
      this.username,
      this.uid,
      this.token});
}
