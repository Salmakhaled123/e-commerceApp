import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:shopyapp/features/login-register/presentation/view/widgets/title_view.dart';
import 'package:shopyapp/features/login-register/presentation/view_model/login_register_cubit.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets/asset_data.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import 'custom_text_form_field.dart';
import 'login_register_conversion.dart';
class LoginViewBody extends StatefulWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late TextEditingController emailController;
  late TextEditingController passController;
  @override
  void initState() {
    emailController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }
  GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<LoginRegisterCubit, LoginRegisterState>(
  builder: (context, state) {
    var cubit=BlocProvider.of<LoginRegisterCubit>(context);
    return Form(key: formKey,
      child: Column(
        children: [
          Image.asset(AssetData.login, width: 250, height: 250),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.grey[200]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const TitleView(title: 'Login to your account'),

                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(validate: (value){
                      if(value!.isEmpty)
                      {
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
                    CustomTextFormField(validate: (value){
                      if(value!.isEmpty)
                      {
                        return 'please enter your password';
                      }
                    },
                      controller: passController,
                      hintText: 'Password',
                      prefix: Icons.password,
                      obscureText: cubit.suffix,
                      suffixIcon: IconButton(onPressed: (){
                        cubit.changeVisibility();
                      },
                          icon: cubit.suffix ? const Icon(Icons.visibility_off):
                      const Icon(Icons.visibility)),
                      type: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(formKey: formKey,text: 'Login',onPressed: ()async {
                      {
                        {
                          await cubit.signInUser(
                              emailController.text, passController.text);

                          if (formKey.currentState!.validate()) {
                            GoRouter.of(context).push(AppRouter.mainView);

                            ScaffoldMessenger.of(context).showSnackBar(const  SnackBar(content: Text('login successfully'),));

                          }
                        }
                      }
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    const   LoginRegisterConversion(text1:'Don\'t have an account' ,text2:'Register here' ,
                     location: AppRouter.registerView,)
                  ]),
                )),
          ),
        ],
      ),
    );
  },
);
  }
  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
}


