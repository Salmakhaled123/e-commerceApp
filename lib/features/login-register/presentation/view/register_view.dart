import 'package:flutter/material.dart';
import 'package:shopyapp/features/login-register/presentation/view/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: RegisterViewBody(),
      ),
    );
  }
}
