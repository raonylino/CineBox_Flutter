import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScrean extends ConsumerStatefulWidget {
  const LoginScrean({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreanState();
}

class _LoginScreanState extends ConsumerState<LoginScrean> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text('Login'),
      ),
    );
  }
}
