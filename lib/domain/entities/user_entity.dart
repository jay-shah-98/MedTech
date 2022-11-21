class UserEntity {
  String name;
  String email;
  String phoneNumber;

  UserEntity({
    this.name = '',
    this.email = '',
    this.phoneNumber = '',
  });

  @override
  String toString() {
    return 'Name: $name, Email: $email, PhoneNumber: $phoneNumber';
  }
}
