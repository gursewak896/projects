// class UserModel {
//   final int id;
//   final String email;
//   final String firstName;
//   final String lastName;
//   UserModel({
//     required this.id,
//     required this.email,
//     required this.firstName,
//     required this.lastName,
//   });
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json['id'],
//       email: json['email'],
//       firstName: json['first_name'] ?? 'First Name',
//       lastName: json['last_name'] ?? 'Last Name',
//     );
//   }
// }

class UserModel {
  final int id;
  final String name;
  final int year;
  UserModel({required this.id, required this.name, required this.year});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'] ?? 'Name',
        year: json['year'] ?? 'Year');
  }
}
