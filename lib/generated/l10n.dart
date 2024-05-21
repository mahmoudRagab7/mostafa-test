// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `username`
  String get username {
    return Intl.message(
      'username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message(
      'Remember me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Or Sign In With`
  String get orSignInWith {
    return Intl.message(
      'Or Sign In With',
      name: 'orSignInWith',
      desc: '',
      args: [],
    );
  }

  /// `Username is required`
  String get usernameVal {
    return Intl.message(
      'Username is required',
      name: 'usernameVal',
      desc: '',
      args: [],
    );
  }

  /// `Not Valid`
  String get notvalid {
    return Intl.message(
      'Not Valid',
      name: 'notvalid',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordVal {
    return Intl.message(
      'Password is required',
      name: 'passwordVal',
      desc: '',
      args: [],
    );
  }

  /// `Password Must be at least 8 characters`
  String get passwordValLength {
    return Intl.message(
      'Password Must be at least 8 characters',
      name: 'passwordValLength',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get createNewAccount {
    return Intl.message(
      'Create New Account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `When Sign Up you agree on`
  String get whenSignUp {
    return Intl.message(
      'When Sign Up you agree on',
      name: 'whenSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get termsAndCondition {
    return Intl.message(
      'Terms and Conditions',
      name: 'termsAndCondition',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Rewrite the password`
  String get rePassword {
    return Intl.message(
      'Rewrite the password',
      name: 'rePassword',
      desc: '',
      args: [],
    );
  }

  /// `Or Sign In With`
  String get orSignWith {
    return Intl.message(
      'Or Sign In With',
      name: 'orSignWith',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Mobile Number`
  String get phoneVal {
    return Intl.message(
      'Invalid Mobile Number',
      name: 'phoneVal',
      desc: '',
      args: [],
    );
  }

  /// `Recovery Password?`
  String get recoveryPassword {
    return Intl.message(
      'Recovery Password?',
      name: 'recoveryPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Phone Number to send you otp`
  String get enterPhoneNo {
    return Intl.message(
      'Enter Phone Number to send you otp',
      name: 'enterPhoneNo',
      desc: '',
      args: [],
    );
  }

  /// `Send OTP`
  String get endOTP {
    return Intl.message(
      'Send OTP',
      name: 'endOTP',
      desc: '',
      args: [],
    );
  }

  /// `Enter OTP`
  String get enterOTP {
    return Intl.message(
      'Enter OTP',
      name: 'enterOTP',
      desc: '',
      args: [],
    );
  }

  /// `Check your message`
  String get checkURMessages {
    return Intl.message(
      'Check your message',
      name: 'checkURMessages',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Resend After`
  String get resendAfter {
    return Intl.message(
      'Resend After',
      name: 'resendAfter',
      desc: '',
      args: [],
    );
  }

  /// `resend`
  String get resend {
    return Intl.message(
      'resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Reassign Password`
  String get reassignPassword {
    return Intl.message(
      'Reassign Password',
      name: 'reassignPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Password`
  String get enterPassword {
    return Intl.message(
      'Enter Password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reassign`
  String get reassign {
    return Intl.message(
      'Reassign',
      name: 'reassign',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get notMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'notMatch',
      desc: '',
      args: [],
    );
  }

  /// `About to finish`
  String get aboutToFinish {
    return Intl.message(
      'About to finish',
      name: 'aboutToFinish',
      desc: '',
      args: [],
    );
  }

  /// `Check Otp`
  String get checkOTP {
    return Intl.message(
      'Check Otp',
      name: 'checkOTP',
      desc: '',
      args: [],
    );
  }

  /// `Change phone number`
  String get changePhone {
    return Intl.message(
      'Change phone number',
      name: 'changePhone',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone number`
  String get enterPhone {
    return Intl.message(
      'Enter phone number',
      name: 'enterPhone',
      desc: '',
      args: [],
    );
  }

  /// `Change number`
  String get changeNumber {
    return Intl.message(
      'Change number',
      name: 'changeNumber',
      desc: '',
      args: [],
    );
  }

  /// `Account Created Successfully`
  String get accountCreation {
    return Intl.message(
      'Account Created Successfully',
      name: 'accountCreation',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Password Creation Successfully`
  String get passwordCreation {
    return Intl.message(
      'Password Creation Successfully',
      name: 'passwordCreation',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Add link`
  String get addLink {
    return Intl.message(
      'Add link',
      name: 'addLink',
      desc: '',
      args: [],
    );
  }

  /// `Activate Card`
  String get activateCard {
    return Intl.message(
      'Activate Card',
      name: 'activateCard',
      desc: '',
      args: [],
    );
  }

  /// `My Links`
  String get myLinks {
    return Intl.message(
      'My Links',
      name: 'myLinks',
      desc: '',
      args: [],
    );
  }

  /// `Links`
  String get links {
    return Intl.message(
      'Links',
      name: 'links',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Fullname`
  String get fullname {
    return Intl.message(
      'Fullname',
      name: 'fullname',
      desc: '',
      args: [],
    );
  }

  /// `Write Fullname`
  String get writeFullname {
    return Intl.message(
      'Write Fullname',
      name: 'writeFullname',
      desc: '',
      args: [],
    );
  }

  /// `Write Username`
  String get writeUsername {
    return Intl.message(
      'Write Username',
      name: 'writeUsername',
      desc: '',
      args: [],
    );
  }

  /// `job`
  String get job {
    return Intl.message(
      'job',
      name: 'job',
      desc: '',
      args: [],
    );
  }

  /// `Example: Graphic Designer`
  String get jobEx {
    return Intl.message(
      'Example: Graphic Designer',
      name: 'jobEx',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Personal Link`
  String get personalLink {
    return Intl.message(
      'Personal Link',
      name: 'personalLink',
      desc: '',
      args: [],
    );
  }

  /// `Write About yourself`
  String get writeAboutUrSelf {
    return Intl.message(
      'Write About yourself',
      name: 'writeAboutUrSelf',
      desc: '',
      args: [],
    );
  }

  /// `What you want to say about yourself or your job`
  String get whatYouWantToSayAboutYourselfOrYourjob {
    return Intl.message(
      'What you want to say about yourself or your job',
      name: 'whatYouWantToSayAboutYourselfOrYourjob',
      desc: '',
      args: [],
    );
  }

  /// `Update Personal Profile`
  String get updatePersonalProfile {
    return Intl.message(
      'Update Personal Profile',
      name: 'updatePersonalProfile',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `App URL`
  String get urlApp {
    return Intl.message(
      'App URL',
      name: 'urlApp',
      desc: '',
      args: [],
    );
  }

  /// `Delete URL`
  String get deleteUrl {
    return Intl.message(
      'Delete URL',
      name: 'deleteUrl',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Save Edit`
  String get saveEdit {
    return Intl.message(
      'Save Edit',
      name: 'saveEdit',
      desc: '',
      args: [],
    );
  }

  /// `Search for Link here....`
  String get searchForLink {
    return Intl.message(
      'Search for Link here....',
      name: 'searchForLink',
      desc: '',
      args: [],
    );
  }

  /// `add`
  String get add {
    return Intl.message(
      'add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Activate the`
  String get activate {
    return Intl.message(
      'Activate the',
      name: 'activate',
      desc: '',
      args: [],
    );
  }

  /// `Select activation type`
  String get selectActivation {
    return Intl.message(
      'Select activation type',
      name: 'selectActivation',
      desc: '',
      args: [],
    );
  }

  /// `Activate by`
  String get activateBy {
    return Intl.message(
      'Activate by',
      name: 'activateBy',
      desc: '',
      args: [],
    );
  }

  /// `QR`
  String get qr {
    return Intl.message(
      'QR',
      name: 'qr',
      desc: '',
      args: [],
    );
  }

  /// `Put Card near to the device`
  String get putCard {
    return Intl.message(
      'Put Card near to the device',
      name: 'putCard',
      desc: '',
      args: [],
    );
  }

  /// `Put QR in the reader`
  String get putqr {
    return Intl.message(
      'Put QR in the reader',
      name: 'putqr',
      desc: '',
      args: [],
    );
  }

  /// `Ready to activate now`
  String get readyToActivate {
    return Intl.message(
      'Ready to activate now',
      name: 'readyToActivate',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Share personal profile`
  String get sharePersonalProfile {
    return Intl.message(
      'Share personal profile',
      name: 'sharePersonalProfile',
      desc: '',
      args: [],
    );
  }

  /// `Add to home`
  String get addToHome {
    return Intl.message(
      'Add to home',
      name: 'addToHome',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Personal Card`
  String get personalCard {
    return Intl.message(
      'Personal Card',
      name: 'personalCard',
      desc: '',
      args: [],
    );
  }

  /// `Preview`
  String get preview {
    return Intl.message(
      'Preview',
      name: 'preview',
      desc: '',
      args: [],
    );
  }

  /// `Activate Product`
  String get activateProduct {
    return Intl.message(
      'Activate Product',
      name: 'activateProduct',
      desc: '',
      args: [],
    );
  }

  /// `Set up account`
  String get setUpAccount {
    return Intl.message(
      'Set up account',
      name: 'setUpAccount',
      desc: '',
      args: [],
    );
  }

  /// `About Application`
  String get aboutApp {
    return Intl.message(
      'About Application',
      name: 'aboutApp',
      desc: '',
      args: [],
    );
  }

  /// `Rate Application`
  String get rateApp {
    return Intl.message(
      'Rate Application',
      name: 'rateApp',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Terms`
  String get terms {
    return Intl.message(
      'Terms',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// `Conditions`
  String get conditions {
    return Intl.message(
      'Conditions',
      name: 'conditions',
      desc: '',
      args: [],
    );
  }

  /// `Who are we?`
  String get whoAreWe {
    return Intl.message(
      'Who are we?',
      name: 'whoAreWe',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contactUS {
    return Intl.message(
      'Contact us',
      name: 'contactUS',
      desc: '',
      args: [],
    );
  }

  /// `Share app`
  String get shareLink {
    return Intl.message(
      'Share app',
      name: 'shareLink',
      desc: '',
      args: [],
    );
  }

  /// `Share App with`
  String get shareLinkBy {
    return Intl.message(
      'Share App with',
      name: 'shareLinkBy',
      desc: '',
      args: [],
    );
  }

  /// `ok`
  String get ok {
    return Intl.message(
      'ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
