import 'package:flutter/material.dart';
import 'package:shopyapp/features/profile/presentation/view/widgets/profile_view_body.dart';
class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body:
    SafeArea(child: ProfileViewBody()),);
  }
}
