import 'package:cinebox/config/result/result.dart';
import 'package:cinebox/data/repositories/repositories_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_with_google_command.g.dart';

@riverpod
class LoginWithGoogleCommand extends _$LoginWithGoogleCommand {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> execute() async {
    state = const AsyncLoading();
    final authReposotory = ref.read(authRepositoryProvider);

    final result = await authReposotory.signIn();

    switch (result) {
      case Success<Unit>():
        state = const AsyncData(null);
        break;
      case Failure<Unit>():
        state = AsyncError(
          'Erro ao realizar login, entre em contato com o suporte',
          StackTrace.current,
        );
        break;
    }
  }
}
