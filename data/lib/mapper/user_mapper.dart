import 'package:domain/models/user_model.dart';

import '../entities/entities.dart';
import 'base_mapper.dart';

class UserMapper implements Mapper<UserEntity, UserModel> {
  const UserMapper();

  @override
  UserModel fromEntity(UserEntity entity) {
    return UserModel(
      entity.email,
      entity.password,
    );
  }

  @override
  UserEntity toEntity(UserModel item) {
    return UserEntity(
      item.email,
      item.password,
    );
  }
}
