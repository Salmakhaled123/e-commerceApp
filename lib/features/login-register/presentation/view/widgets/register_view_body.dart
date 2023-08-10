import 'package:flutter/material.dart';
import 'package:shopyapp/core/utils/assets/asset_data.dart';
import 'loginRegisterSection.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passController;
  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }
  GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(key: formKey,
      child: Column(
        children: [
          Image.asset(AssetData.register, width: 250, height: 250),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.grey[200]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LoginRegisterSection(nameController: nameController, emailController: emailController, passController: passController, formKey: formKey,text: 'Register'),
                )),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
}


