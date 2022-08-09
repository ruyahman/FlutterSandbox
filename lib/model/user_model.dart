class User {
  final String name;
  final String password;
 
  const User({
    required this.name,
    required this.password
  });
 
  factory User.make(String name, String password) {
    return User(name: name, password: password);
  }
}