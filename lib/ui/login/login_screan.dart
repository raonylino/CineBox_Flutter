import 'package:cinebox/core/constants/app_routers.dart';
import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:cinebox/ui/core/widgets/loader_message.dart';
import 'package:cinebox/ui/login/commads/login_with_google_command.dart';
import 'package:cinebox/ui/login/login_view_model.dart';
import 'package:cinebox/ui/login/widgets/sign_in_google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScrean extends ConsumerStatefulWidget {
  const LoginScrean({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreanState();
}

class _LoginScreanState extends ConsumerState<LoginScrean>
    with LoaderAndMessage {
  @override
  Widget build(BuildContext context) {
    ref.listen(loginWithGoogleCommandProvider, (previous, state) {
      state.whenOrNull(
        data: (_) {
          Navigator.pushReplacementNamed(context, AppRouters.home);
        },
        error: (error, stackTrace) {
          showErrorSnackbar('Erro ao realizar login');
        },
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            R.ASSETS_IMAGES_BG_LOGIN_PNG,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            constraints: BoxConstraints.expand(),
            color: Colors.black45,
          ),
          Container(
            constraints: BoxConstraints.expand(),
            child: Column(
              spacing: 48,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Image.asset(R.ASSETS_IMAGES_LOGO_PNG),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final state = ref.watch(loginWithGoogleCommandProvider);
                      return SignInGoogleButton(
                        isLoading: state.isLoading,
                        onPressed: () {
                          final viewModel = ref.read(loginViewModelProvider);
                          viewModel.googleLogin();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
