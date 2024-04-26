class User {
  String username;
  String password;
  String phone;
  String email;
  DateTime createTime;

  User({
    required this.username,
    required this.password,
    required this.phone,
    required this.email,
    required this.createTime,
  });
}

List<User> users = [
  User(
    username: 'user1',
    password: '123456',
    phone: '123456',
    email: 'user1@gmail.com',
    createTime: DateTime.now(),
  ),
  User(
    username: 'user2',
    password: '123456',
    phone: '123456',
    email: 'user2@gmail.com',
    createTime: DateTime.now(),
  ),
  // 添加更多的用户...
];
