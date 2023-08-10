import 'package:flutter/material.dart';
import 'package:shopyapp/features/login-register/presentation/view/widgets/login_view_body.dart';
class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: LoginViewBody()),);
  }
}
