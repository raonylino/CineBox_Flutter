import 'package:cinebox/core/constants/app_routers.dart';
import 'package:cinebox/core/themes/resource.dart';
import 'package:cinebox/core/widgets/loader_message.dart';
import 'package:cinebox/ui/splash/commands/check_user_logged_command.dart';
import 'package:cinebox/ui/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with LoaderAndMessage {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async => ref.read(splashViewModelProvider).checkLoginAndRedirect(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(checkUserLoggedCommandProvider, (previous, next) {
      next.whenOrNull(
        data: (data) {
          final path = switch (data) {
            true => AppRouters.home,
            false => AppRouters.login,
            _ => '',
          };
          if (path.isNotEmpty && context.mounted) {
            showSuccessSnackbar('Usuário logado com sucesso');
            Navigator.pushNamedAndRemoveUntil(context, path, (route) => false);
          }
        },
        error: (error, stackTrace) {
          if (context.mounted) {
            showErrorSnackbar('Erro ao verificar usuário');
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRouters.login,
              (route) => false,
            );
          }
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
          Center(child: Image.asset(R.ASSETS_IMAGES_LOGO_PNG)),
        ],
      ),
    );
  }
}
