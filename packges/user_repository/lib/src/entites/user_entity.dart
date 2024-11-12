class MyUserEntity {
  String userId;
  String email;
  String name;
  bool hasactiveCart;

  MyUserEntity(
      {required this.userId,
      required this.email,
      required this.hasactiveCart,
      required this.name});

  Map<String, Object> toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      '.hasactiveCart': hasactiveCart
    };
  }

  static MyUserEntity fromJson(Map<String, dynamic> doc) {
    return MyUserEntity(
        userId: doc['userId'],
        email: doc['email'],
        hasactiveCart: doc['hasactiveCart'],
        name: doc['name']);
  }
}
