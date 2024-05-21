import 'package:nfc_card/generated/l10n.dart';

class ValidationService {
  String? validateEmail(String? value, context) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return ''; //S.of(context).emailVal;
    }
    return null;
  }

  String? validateMobile(String? value, context) {
    String pattern = r'(^5[0-9]{8}$)';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return ''; //S.of(context).enterPhone;
    } else if (!regExp.hasMatch(value)) {
      return ''; //S.of(context).wrongPhone;
    } else if (value.length < 9) {
      return ''; //S.of(context).wrongPhone;
    }
    return null;
  }

  String? validateEmailAndPhone(String? value, context) {
    RegExp phone = RegExp(r'(^05[0-9]{8}$)');
    RegExp email = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])+)$");
    if (value == null || value.isEmpty) {
      return S.of(context).usernameVal;
    } else if (!phone.hasMatch(value) && !email.hasMatch(value)) {
      return S.of(context).notvalid;
      // print('$value is a valid phone number');
    } else {
      print('doone');
      return null;
    }
  }

  String? validatePassword(String? value, context) {
    // RegExp upperCase = RegExp('(?=.*?[A-Z])');
    // RegExp lowerCase = RegExp('(?=.*[a-z])');
    // RegExp numric = RegExp(
    //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[+_%!@#\$&*~]).{8,}$');
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[+_%!@#\$&*~]).{8,}$');
    if (value == null || value.isEmpty) {
      return S.of(context).passwordVal;
    } else if (value.trim().length < 8) {
      return S.of(context).passwordValLength;
    }
    // else if (!upperCase.hasMatch(value)) {
    //   return 'please enter uppercase letter or lowercase letter or special letter';
    // } else if (!lowerCase.hasMatch(value)) {
    //   return 'please enter uppercase letter or lowercase letter or special letter';
    // } else if (!numric.hasMatch(value)) {
    //   return 'please enter uppercase letter or lowercase letter or special letter';
    // }
    else {
      return null;
    }
  }
  String? validateRePassword(String? value, context,String value2) {
    // RegExp upperCase = RegExp('(?=.*?[A-Z])');
    // RegExp lowerCase = RegExp('(?=.*[a-z])');
    // RegExp numric = RegExp(
    //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[+_%!@#\$&*~]).{8,}$');
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[+_%!@#\$&*~]).{8,}$');
    if (value == null || value.isEmpty) {
      return S.of(context).passwordVal;
    } else if (value.trim().length < 8) {
      return S.of(context).passwordValLength;
    }else if(value!= value2){ return S.of(context).notMatch;}
    // else if (!upperCase.hasMatch(value)) {
    //   return 'please enter uppercase letter or lowercase letter or special letter';
    // } else if (!lowerCase.hasMatch(value)) {
    //   return 'please enter uppercase letter or lowercase letter or special letter';
    // } else if (!numric.hasMatch(value)) {
    //   return 'please enter uppercase letter or lowercase letter or special letter';
    // }
    else {
      return null;
    }
  }
}
