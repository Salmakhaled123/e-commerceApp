import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shopyapp/core/utils/cache.dart';

part 'login_register_state.dart';

class LoginRegisterCubit extends Cubit<LoginRegisterState> {
  LoginRegisterCubit() : super(LoginRegisterInitial());
 bool suffix=false;
 changeVisibility()
 {
   suffix=!suffix;
   emit(CheckVisibility());
 }
 Future registerUser(String email,String password)async
 {
   emit(RegisterLoading());
   try {

     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
         email: email,
         password: password
     );
    await CacheHelper.saveData('uId', userCredential.user!.uid);
     emit(RegisterSuccess());
   } on FirebaseAuthException catch (e) {
     if (e.code == 'weak-password') {
       print('The password provided is too weak.');
     } else if (e.code == 'email-already-in-use') {
       print('The account already exists for that email.');
     }
     emit(RegisterFailure(e.toString()));
   } catch (e) {
     print(e);
     emit(RegisterFailure(e.toString()));
   }
 }
 signInUser(String email,String password)async
 {
   emit(LoginLoading());
   try {
     UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: email,
         password: password,
     );
     print(userCredential.user!.uid);
     emit(LoginSuccess());
   } on FirebaseAuthException catch (e) {
     if (e.code == 'user-not-found') {
       print('No user found for that email.');
     } else if (e.code == 'wrong-password') {
       print('Wrong password provided for that user.');
     }
     emit(LoginFailure(e.toString()));
   }
 }
}
