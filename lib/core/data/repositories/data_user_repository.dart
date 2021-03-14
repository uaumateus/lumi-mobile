import 'package:lumi/core/domain/entities/user.dart';
import 'package:lumi/core/domain/repositories/user_repository.dart';
import 'package:lumi/network/network.dart';

class DataUserRepository extends UserRepository {
  User _user = User();
  static Network _network;

  User get user => _user;

  // singleton impl
  static DataUserRepository _instance = DataUserRepository._internal();

  DataUserRepository._internal();

  factory DataUserRepository({Network network}) {
    _network = network ?? Network();
    return _instance;
  }
  
  @override
  Future<User> login(String email, String password) async {
    Map response = await _network.post('auth/login', body: {'email': email, 'password': password});

    _user = User.fromJson(response);

    return _user;    
  }
}
