class UserModel {
  final String? id;
  final String? img;
  final String? name;
  final String? email;
  final String? pass;
  final bool? emailVerified;

  UserModel({
    required this.id,
    required this.img,
    required this.name,
    required this.email,
    this.pass,
    required this.emailVerified
  });

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, email: $email, pass: $pass}';
  }
}