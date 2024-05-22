class User {
  String username;
  String password;
  String phone;
  String email;
  String role;
  DateTime createTime;

  User({
    required this.username,
    required this.password,
    required this.phone,
    required this.email,
    required this.role,
    required this.createTime,
  });
}

List<User> users = [
  User(
    username: 'admin',
    password: '123',
    phone: '123456',
    email: 'user1@gmail.com',
    role: 'ADMIN',
    createTime: DateTime.now(),
  ),
  User(
    username: 'user1',
    password: '123',
    phone: '123456',
    email: 'user2@gmail.com',
    role: 'CUSTOMER',
    createTime: DateTime.now(),
  ),
  User(
    username: '',
    password: '',
    phone: '',
    email: '',
    role: 'GUEST',
    createTime: DateTime.now(),
  ),
  // 添加更多的用户...
];
