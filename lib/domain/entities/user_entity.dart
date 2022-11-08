class UserEntity {
  final String name;
  final String email;
  final String phoneNumber;

  UserEntity(
      {required this.name, required this.email, required this.phoneNumber});

  @override
  String toString() {
    return 'Name: $name, Email: $email, PhoneNumber: $phoneNumber';
  }
}
