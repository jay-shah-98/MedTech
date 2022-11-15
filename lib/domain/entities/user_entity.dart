class UserEntity {
  String name;
  String email;
  String phoneNumber;

  UserEntity(
      {required this.name, required this.email, required this.phoneNumber});

  @override
  String toString() {
    return 'Name: $name, Email: $email, PhoneNumber: $phoneNumber';
  }
}
