import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'editprofile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditprofileInitial());
  static EditProfileCubit get(context) => BlocProvider.of(context);
  TextEditingController fullnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
}
