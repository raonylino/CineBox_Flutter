import 'package:cinebox/ui/login/commads/login_with_google_command.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_view_model.g.dart';

class LoginViewModel {
  final LoginWithGoogleCommand loginWithGoogleCommand;

  LoginViewModel({required this.loginWithGoogleCommand});

  void googleLogin() => loginWithGoogleCommand.execute();
}

@riverpod
LoginViewModel loginViewModel(Ref ref) {
  return LoginViewModel(
    loginWithGoogleCommand: ref.watch(loginWithGoogleCommandProvider.notifier),
  );
}
