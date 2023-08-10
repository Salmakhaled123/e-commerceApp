import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:shopyapp/features/login-register/presentation/view/widgets/title_view.dart';
import 'package:shopyapp/features/login-register/presentation/view_model/login_register_cubit.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import 'custom_text_form_field.dart';
import 'login_register_conversion.dart';

class LoginRegisterSection extends StatelessWidget {
  const LoginRegisterSection({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.passController,
    required this.formKey, required this.text,

  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passController;
  final GlobalKey<FormState> formKey;
  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginRegisterCubit, LoginRegisterState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<LoginRegisterCubit>(context);
        return ListView(children: [
          const SizedBox(
            height: 10,
          ),
          const TitleView(title: 'Create new account'),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            validate: (value) {
              if (value!.isEmpty) {
                return 'please enter your name';
              }
            },
            controller: nameController,
            hintText: 'Name',
            prefix: Icons.person,
            obscureText: false,
            type: TextInputType.name,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            validate: (value) {
              if (value!.isEmpty) {
                return 'please enter your email';
              }
              return null;
            },
            controller: emailController,
            hintText: 'Email',
            prefix: Icons.email,


            obscureText: false,
            type: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            type: TextInputType.text,
            validate: (value) {
              if (value!.isEmpty) {
                return 'please enter your password';
              }
            },
            controller: passController,
            hintText: 'Password',
            prefix: Icons.password,
            obscureText: cubit.suffix,
            suffixIcon: IconButton(onPressed: () {
              cubit.changeVisibility();
            },
                icon: cubit.suffix ?
                const Icon(Icons.visibility_off) :
                const Icon(Icons.visibility)),


          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<LoginRegisterCubit, LoginRegisterState>(
            builder: (context, state) {
              return CustomButton(
                formKey: formKey, text: text, onPressed: ()async
              {
              await   cubit.registerUser(
                      emailController.text, passController.text);

                  if (formKey.currentState!.validate())
                  {
                    GoRouter.of(context).push(AppRouter.mainView);
                    ScaffoldMessenger.of(context).showSnackBar(const  SnackBar(content: Text('registered successfully'),));
                  }
                }
              ,
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const LoginRegisterConversion(text1: 'Already have an account',
              text2: 'Login here',
              location: AppRouter.loginView)
        ]);
      },
    );
  }
}
