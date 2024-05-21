import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  static AuthCubit get(context) => BlocProvider.of(context);
  AuthCubit() : super(AuthInitial());
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordReController = TextEditingController();
  TextEditingController repasswordReController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? countryCode = '+966';
  Future<void> authLogin() async {
    // emit(LoginLoading());

    // result.fold((failure) {
    //   emit(LoginFailure(failure.errorMsg));
    // }, (response) {
    //   emit(LoginSuccess(response));

    // });
  }

  Future<void> authRegister() async {
    // emit(RegisterLoading());

    // result.fold((failure) {
    //   emit(RegisterFailure(failure.errorMsg));
    // }, (response) {
    //   emit(RegisterSuccess(response));

    // });
  }
}
