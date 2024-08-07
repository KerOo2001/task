class User {
  String username;
  String phone;
  String type; // admin or user

  User({required this.username, required this.phone, required this.type});

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'phone': phone,
      'type': type,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'],
      phone: map['phone'],
      type: map['type'],
    );
  }
}
