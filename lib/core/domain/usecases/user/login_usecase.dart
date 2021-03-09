import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lumi/core/domain/entities/user.dart';
import 'package:lumi/core/domain/repositories/user_repository.dart';

class LoginUseCaseParams {
  final String email;
  final String password;

  LoginUseCaseParams({this.email, this.password});
}

class LoginUseCaseResponse {
  final User user;

  LoginUseCaseResponse(this.user);
}

class LoginUseCase extends UseCase<LoginUseCaseResponse, LoginUseCaseParams> {
  final UserRepository userRepository;

  LoginUseCase(this.userRepository); // Constructor

  @override
  Future<Stream<LoginUseCaseResponse>> buildUseCaseStream(
      LoginUseCaseParams params) async {
    final StreamController<LoginUseCaseResponse> controller =
        StreamController();
    try {
      User user = await userRepository.login(params.email, params.password);

      controller.add(LoginUseCaseResponse(user));
      controller.close();
    } catch (e) {
      controller.addError(e);
    }

    return controller.stream;
  }
}
