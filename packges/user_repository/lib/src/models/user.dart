import 'package:user_repository/src/entites/entites.dart';

class MyUser {
  String userId;
  String email;
  String name;
  bool hasavtiveCart;

  MyUser(
      {required this.userId,
      required this.email,
      required this.hasavtiveCart,
      required this.name});

  static final empty =
      MyUser(userId: '', email: '', hasavtiveCart: false, name: '');

  MyUserEntity toEntity() {
    return MyUserEntity(
        userId: userId, email: email, name: name, hasactiveCart: hasavtiveCart);
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
        userId: entity.userId,
        email: entity.email,
        hasavtiveCart: entity.hasactiveCart,
        name: entity.name);
  }

  @override
  String toString() {
     return 'MyUser: $userId, $email, $name, $hasavtiveCart';
  }
}
