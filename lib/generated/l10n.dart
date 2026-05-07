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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Welcome to `
  String get welcome {
    return Intl.message('Welcome to ', name: 'welcome', desc: '', args: []);
  }

  /// `Salamaty`
  String get appName {
    return Intl.message('Salamaty', name: 'appName', desc: '', args: []);
  }

  /// `We're excited to have you\nonboard.`
  String get onboardingSubtitle {
    return Intl.message(
      'We\'re excited to have you\nonboard.',
      name: 'onboardingSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Find the nearest pharmacies and hospitals.`
  String get onboarding1Title {
    return Intl.message(
      'Find the nearest pharmacies and hospitals.',
      name: 'onboarding1Title',
      desc: '',
      args: [],
    );
  }

  /// `Quickly find the nearest pharmacies, hospitals, and labs based on your current location.`
  String get onboarding1Subtitle {
    return Intl.message(
      'Quickly find the nearest pharmacies, hospitals, and labs based on your current location.',
      name: 'onboarding1Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Scan and Analyze Your Prescriptions.`
  String get onboarding2Title {
    return Intl.message(
      'Scan and Analyze Your Prescriptions.',
      name: 'onboarding2Title',
      desc: '',
      args: [],
    );
  }

  /// `Upload or snap prescriptions to identify medicines and safe alternatives instantly.`
  String get onboarding2Subtitle {
    return Intl.message(
      'Upload or snap prescriptions to identify medicines and safe alternatives instantly.',
      name: 'onboarding2Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Manage Your Insurance Easily.`
  String get onboarding3Title {
    return Intl.message(
      'Manage Your Insurance Easily.',
      name: 'onboarding3Title',
      desc: '',
      args: [],
    );
  }

  /// `Quickly find medical facilities that accept your insurance for fast and easy access.`
  String get onboarding3Subtitle {
    return Intl.message(
      'Quickly find medical facilities that accept your insurance for fast and easy access.',
      name: 'onboarding3Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Please sign in to continue`
  String get signInSubtitle {
    return Intl.message(
      'Please sign in to continue',
      name: 'signInSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Signed in with Google successfully`
  String get googleSuccess {
    return Intl.message(
      'Signed in with Google successfully',
      name: 'googleSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Signed in successfully`
  String get loginSuccess {
    return Intl.message(
      'Signed in successfully',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Email not verified`
  String get emailNotVerified {
    return Intl.message(
      'Email not verified',
      name: 'emailNotVerified',
      desc: '',
      args: [],
    );
  }

  /// `Your email is not verified yet. You need to verify it using the OTP code.`
  String get verifyMessage {
    return Intl.message(
      'Your email is not verified yet. You need to verify it using the OTP code.',
      name: 'verifyMessage',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Verify Now`
  String get verifyNow {
    return Intl.message('Verify Now', name: 'verifyNow', desc: '', args: []);
  }

  /// `Please enter your email to receive a link to create a new password via email`
  String get forgotPasswordSubtitle {
    return Intl.message(
      'Please enter your email to receive a link to create a new password via email',
      name: 'forgotPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Your Email:`
  String get yourEmail {
    return Intl.message('Your Email:', name: 'yourEmail', desc: '', args: []);
  }

  /// `Enter your email`
  String get enterEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please sign up to continue`
  String get signUpSubtitle {
    return Intl.message(
      'Please sign up to continue',
      name: 'signUpSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPasswordTitle {
    return Intl.message(
      'Reset password',
      name: 'resetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your new password`
  String get resetPasswordSubtitle {
    return Intl.message(
      'Please enter your new password',
      name: 'resetPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Update Password`
  String get updatePassword {
    return Intl.message(
      'Update Password',
      name: 'updatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verificationTitle {
    return Intl.message(
      'Verification',
      name: 'verificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter OTP sent to your email to verify your account`
  String get verificationSubtitle {
    return Intl.message(
      'Please enter OTP sent to your email to verify your account',
      name: 'verificationSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive OTP code? `
  String get didNotReceiveOtp {
    return Intl.message(
      'Didn\'t receive OTP code? ',
      name: 'didNotReceiveOtp',
      desc: '',
      args: [],
    );
  }

  /// `Send Again`
  String get sendAgain {
    return Intl.message('Send Again', name: 'sendAgain', desc: '', args: []);
  }

  /// `Sending...`
  String get sending {
    return Intl.message('Sending...', name: 'sending', desc: '', args: []);
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `Please enter valid OTP`
  String get invalidOtp {
    return Intl.message(
      'Please enter valid OTP',
      name: 'invalidOtp',
      desc: '',
      args: [],
    );
  }

  /// `Account Verified`
  String get accountVerified {
    return Intl.message(
      'Account Verified',
      name: 'accountVerified',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been verified successfully.`
  String get accountVerifiedDesc {
    return Intl.message(
      'Your account has been verified successfully.',
      name: 'accountVerifiedDesc',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueText {
    return Intl.message('Continue', name: 'continueText', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Drug Store`
  String get drugStore {
    return Intl.message('Drug Store', name: 'drugStore', desc: '', args: []);
  }

  /// `Scan`
  String get scan {
    return Intl.message('Scan', name: 'scan', desc: '', args: []);
  }

  /// `Insurance`
  String get insurance {
    return Intl.message('Insurance', name: 'insurance', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Available Medicines`
  String get availableMedicines {
    return Intl.message(
      'Available Medicines',
      name: 'availableMedicines',
      desc: '',
      args: [],
    );
  }

  /// `IN STOCK`
  String get inStock {
    return Intl.message('IN STOCK', name: 'inStock', desc: '', args: []);
  }

  /// `Detected Medicines`
  String get detectedMedicines {
    return Intl.message(
      'Detected Medicines',
      name: 'detectedMedicines',
      desc: '',
      args: [],
    );
  }

  /// `Scan Again`
  String get scanAgain {
    return Intl.message('Scan Again', name: 'scanAgain', desc: '', args: []);
  }

  /// `AVAILABLE`
  String get available {
    return Intl.message('AVAILABLE', name: 'available', desc: '', args: []);
  }

  /// `View Details`
  String get viewDetails {
    return Intl.message(
      'View Details',
      name: 'viewDetails',
      desc: '',
      args: [],
    );
  }

  /// `found`
  String get found {
    return Intl.message('found', name: 'found', desc: '', args: []);
  }

  /// `Detected from prescription`
  String get detectedFromPrescription {
    return Intl.message(
      'Detected from prescription',
      name: 'detectedFromPrescription',
      desc: '',
      args: [],
    );
  }

  /// `Not Available Medicines`
  String get notAvailableMedicines {
    return Intl.message(
      'Not Available Medicines',
      name: 'notAvailableMedicines',
      desc: '',
      args: [],
    );
  }

  /// `OUT OF STOCK`
  String get outOfStock {
    return Intl.message('OUT OF STOCK', name: 'outOfStock', desc: '', args: []);
  }

  /// `Currently unavailable`
  String get currentlyUnavailable {
    return Intl.message(
      'Currently unavailable',
      name: 'currentlyUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `NOT AVAILABLE`
  String get notAvailable {
    return Intl.message(
      'NOT AVAILABLE',
      name: 'notAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Analyze Prescription`
  String get analyzePrescription {
    return Intl.message(
      'Analyze Prescription',
      name: 'analyzePrescription',
      desc: '',
      args: [],
    );
  }

  /// `View Detected Medicines`
  String get viewDetectedMedicines {
    return Intl.message(
      'View Detected Medicines',
      name: 'viewDetectedMedicines',
      desc: '',
      args: [],
    );
  }

  /// `Scan Prescription`
  String get scanPrescription {
    return Intl.message(
      'Scan Prescription',
      name: 'scanPrescription',
      desc: '',
      args: [],
    );
  }

  /// `Use your camera to scan your prescription or upload an image from your gallery.`
  String get scanSubtitle {
    return Intl.message(
      'Use your camera to scan your prescription or upload an image from your gallery.',
      name: 'scanSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Scan with Camera`
  String get scanWithCamera {
    return Intl.message(
      'Scan with Camera',
      name: 'scanWithCamera',
      desc: '',
      args: [],
    );
  }

  /// `Upload from Gallery`
  String get uploadFromGallery {
    return Intl.message(
      'Upload from Gallery',
      name: 'uploadFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Medicines`
  String get favoriteMedicines {
    return Intl.message(
      'Favorite Medicines',
      name: 'favoriteMedicines',
      desc: '',
      args: [],
    );
  }

  /// `Here are the medicines you have added to your favorites list`
  String get favoriteSubtitle {
    return Intl.message(
      'Here are the medicines you have added to your favorites list',
      name: 'favoriteSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `No Favorites Yet`
  String get noFavorites {
    return Intl.message(
      'No Favorites Yet',
      name: 'noFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Start adding medicines to your favorites`
  String get startAddingFavorites {
    return Intl.message(
      'Start adding medicines to your favorites',
      name: 'startAddingFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Removed from favorites successfully`
  String get removedFromFavorites {
    return Intl.message(
      'Removed from favorites successfully',
      name: 'removedFromFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Facilities`
  String get facilities {
    return Intl.message('Facilities', name: 'facilities', desc: '', args: []);
  }

  /// `See All`
  String get seeAll {
    return Intl.message('See All', name: 'seeAll', desc: '', args: []);
  }

  /// `Hello,`
  String get hello {
    return Intl.message('Hello,', name: 'hello', desc: '', args: []);
  }

  /// `Search...`
  String get search {
    return Intl.message('Search...', name: 'search', desc: '', args: []);
  }

  /// `Services`
  String get services {
    return Intl.message('Services', name: 'services', desc: '', args: []);
  }

  /// `Select Insurance`
  String get selectInsurance {
    return Intl.message(
      'Select Insurance',
      name: 'selectInsurance',
      desc: '',
      args: [],
    );
  }

  /// `Upload Prescription`
  String get uploadPrescription {
    return Intl.message(
      'Upload Prescription',
      name: 'uploadPrescription',
      desc: '',
      args: [],
    );
  }

  /// `Find Medicines`
  String get findMedicines {
    return Intl.message(
      'Find Medicines',
      name: 'findMedicines',
      desc: '',
      args: [],
    );
  }

  /// `See Details`
  String get seeDetails {
    return Intl.message('See Details', name: 'seeDetails', desc: '', args: []);
  }

  /// `No tips available`
  String get noTips {
    return Intl.message(
      'No tips available',
      name: 'noTips',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load tips`
  String get errorTips {
    return Intl.message(
      'Failed to load tips',
      name: 'errorTips',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `Medical Specialties`
  String get medicalSpecialties {
    return Intl.message(
      'Medical Specialties',
      name: 'medicalSpecialties',
      desc: '',
      args: [],
    );
  }

  /// `Cardiology`
  String get cardiology {
    return Intl.message('Cardiology', name: 'cardiology', desc: '', args: []);
  }

  /// `Ophthalmology`
  String get ophthalmology {
    return Intl.message(
      'Ophthalmology',
      name: 'ophthalmology',
      desc: '',
      args: [],
    );
  }

  /// `Nephrology`
  String get nephrology {
    return Intl.message('Nephrology', name: 'nephrology', desc: '', args: []);
  }

  /// `Pediatrics`
  String get pediatrics {
    return Intl.message('Pediatrics', name: 'pediatrics', desc: '', args: []);
  }

  /// `Orthopedics`
  String get orthopedics {
    return Intl.message('Orthopedics', name: 'orthopedics', desc: '', args: []);
  }

  /// `Neurology`
  String get neurology {
    return Intl.message('Neurology', name: 'neurology', desc: '', args: []);
  }

  /// `Obstetrics & Gynecology`
  String get obstetricsGynecology {
    return Intl.message(
      'Obstetrics & Gynecology',
      name: 'obstetricsGynecology',
      desc: '',
      args: [],
    );
  }

  /// `Dentistry`
  String get dentistry {
    return Intl.message('Dentistry', name: 'dentistry', desc: '', args: []);
  }

  /// `Multidisciplinary`
  String get multidisciplinary {
    return Intl.message(
      'Multidisciplinary',
      name: 'multidisciplinary',
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

  /// `Log out`
  String get logout {
    return Intl.message('Log out', name: 'logout', desc: '', args: []);
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `Message`
  String get message {
    return Intl.message('Message', name: 'message', desc: '', args: []);
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }

  /// `Username is required`
  String get usernameRequired {
    return Intl.message(
      'Username is required',
      name: 'usernameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailRequired {
    return Intl.message(
      'Email is required',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get invalidEmail {
    return Intl.message(
      'Enter a valid email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Message is required`
  String get messageRequired {
    return Intl.message(
      'Message is required',
      name: 'messageRequired',
      desc: '',
      args: [],
    );
  }

  /// `Message sent successfully ✓`
  String get sendSuccess {
    return Intl.message(
      'Message sent successfully ✓',
      name: 'sendSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send. Please try again.`
  String get sendFailed {
    return Intl.message(
      'Failed to send. Please try again.',
      name: 'sendFailed',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account? This action cannot be undone.`
  String get deleteAccountDesc {
    return Intl.message(
      'Are you sure you want to delete your account? This action cannot be undone.',
      name: 'deleteAccountDesc',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Your account has been deleted successfully`
  String get accountDeleted {
    return Intl.message(
      'Your account has been deleted successfully',
      name: 'accountDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get logoutDesc {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logoutDesc',
      desc: '',
      args: [],
    );
  }

  /// `You logged out successfully`
  String get logoutSuccess {
    return Intl.message(
      'You logged out successfully',
      name: 'logoutSuccess',
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

  /// `Nearby Services`
  String get nearbyServices {
    return Intl.message(
      'Nearby Services',
      name: 'nearbyServices',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Services`
  String get insuranceServices {
    return Intl.message(
      'Insurance Services',
      name: 'insuranceServices',
      desc: '',
      args: [],
    );
  }

  /// `A list of covered services near your location.`
  String get insuranceServicesSubtitle {
    return Intl.message(
      'A list of covered services near your location.',
      name: 'insuranceServicesSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `All Facilities`
  String get facilitiesScreenHeader {
    return Intl.message(
      'All Facilities',
      name: 'facilitiesScreenHeader',
      desc: '',
      args: [],
    );
  }

  /// `Filter by`
  String get filterBy {
    return Intl.message('Filter by', name: 'filterBy', desc: '', args: []);
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Labs`
  String get labs {
    return Intl.message('Labs', name: 'labs', desc: '', args: []);
  }

  /// `Hospitals`
  String get hospitals {
    return Intl.message('Hospitals', name: 'hospitals', desc: '', args: []);
  }

  /// `Pharmacies`
  String get pharmacies {
    return Intl.message('Pharmacies', name: 'pharmacies', desc: '', args: []);
  }

  /// `Side Effect`
  String get sideEffect {
    return Intl.message('Side Effect', name: 'sideEffect', desc: '', args: []);
  }

  /// `See Alternatives`
  String get seeAlternatives {
    return Intl.message(
      'See Alternatives',
      name: 'seeAlternatives',
      desc: '',
      args: [],
    );
  }

  /// `Find Pharmacies`
  String get findPharmacies {
    return Intl.message(
      'Find Pharmacies',
      name: 'findPharmacies',
      desc: '',
      args: [],
    );
  }

  /// `No nearby pharmacies found`
  String get noNearbyPharmacies {
    return Intl.message(
      'No nearby pharmacies found',
      name: 'noNearbyPharmacies',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Alternatives`
  String get medicineAlternatives {
    return Intl.message(
      'Medicine Alternatives',
      name: 'medicineAlternatives',
      desc: '',
      args: [],
    );
  }

  /// `Here are some alternatives for the medicine you are looking for`
  String get medicineAlternativesSubtitle {
    return Intl.message(
      'Here are some alternatives for the medicine you are looking for',
      name: 'medicineAlternativesSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Details`
  String get medicineDetails {
    return Intl.message(
      'Medicine Details',
      name: 'medicineDetails',
      desc: '',
      args: [],
    );
  }

  /// `Detailed information about the medicine, including side effects and alternatives`
  String get medicineDetailsSubtitle {
    return Intl.message(
      'Detailed information about the medicine, including side effects and alternatives',
      name: 'medicineDetailsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Nearby Pharmacies`
  String get nearbyPharmacies {
    return Intl.message(
      'Nearby Pharmacies',
      name: 'nearbyPharmacies',
      desc: '',
      args: [],
    );
  }

  /// `Here are some pharmacies near your location`
  String get nearbyPharmaciesSubtitle {
    return Intl.message(
      'Here are some pharmacies near your location',
      name: 'nearbyPharmaciesSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Your email is not verified yet. You need to verify it using OTP.`
  String get emailNotVerifiedDescription {
    return Intl.message(
      'Your email is not verified yet. You need to verify it using OTP.',
      name: 'emailNotVerifiedDescription',
      desc: '',
      args: [],
    );
  }

  /// `Signed in with Google successfully`
  String get signedInWithGoogle {
    return Intl.message(
      'Signed in with Google successfully',
      name: 'signedInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Signed in successfully`
  String get signedInSuccessfully {
    return Intl.message(
      'Signed in successfully',
      name: 'signedInSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Profile updated successfully`
  String get profileUpdatedSuccessfully {
    return Intl.message(
      'Profile updated successfully',
      name: 'profileUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Failed to update profile. Please try again.`
  String get failedToUpdateProfile {
    return Intl.message(
      'Failed to update profile. Please try again.',
      name: 'failedToUpdateProfile',
      desc: '',
      args: [],
    );
  }

  /// `Please complete all required fields`
  String get pleaseCompleteAllRequiredFields {
    return Intl.message(
      'Please complete all required fields',
      name: 'pleaseCompleteAllRequiredFields',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Birth Date`
  String get birthDate {
    return Intl.message('Birth Date', name: 'birthDate', desc: '', args: []);
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Select gender`
  String get selectGender {
    return Intl.message(
      'Select gender',
      name: 'selectGender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Select birth date`
  String get selectBirthDate {
    return Intl.message(
      'Select birth date',
      name: 'selectBirthDate',
      desc: '',
      args: [],
    );
  }

  /// `Birth day`
  String get birthday {
    return Intl.message('Birth day', name: 'birthday', desc: '', args: []);
  }

  /// `Insurance Profile`
  String get insuranceProfile {
    return Intl.message(
      'Insurance Profile',
      name: 'insuranceProfile',
      desc: '',
      args: [],
    );
  }

  /// `Select your insurance to view covered services.`
  String get selectInsuranceSubtitle {
    return Intl.message(
      'Select your insurance to view covered services.',
      name: 'selectInsuranceSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `You don't have an active insurance plan\nlinked to your account yet.`
  String get noInsuranceSelected {
    return Intl.message(
      'You don\'t have an active insurance plan\nlinked to your account yet.',
      name: 'noInsuranceSelected',
      desc: '',
      args: [],
    );
  }

  /// `Coverage & Benefits`
  String get coverageBenefits {
    return Intl.message(
      'Coverage & Benefits',
      name: 'coverageBenefits',
      desc: '',
      args: [],
    );
  }

  /// `Medicines`
  String get medicines {
    return Intl.message('Medicines', name: 'medicines', desc: '', args: []);
  }

  /// `Lab Tests`
  String get labTests {
    return Intl.message('Lab Tests', name: 'labTests', desc: '', args: []);
  }

  /// `Insurance ID`
  String get insuranceId {
    return Intl.message(
      'Insurance ID',
      name: 'insuranceId',
      desc: '',
      args: [],
    );
  }

  /// `Insurance ID Number`
  String get insuranceIdHint {
    return Intl.message(
      'Insurance ID Number',
      name: 'insuranceIdHint',
      desc: '',
      args: [],
    );
  }

  /// `Upload Your Insurance Photos`
  String get uploadInsurancePhotos {
    return Intl.message(
      'Upload Your Insurance Photos',
      name: 'uploadInsurancePhotos',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Card Front`
  String get insuranceCardFront {
    return Intl.message(
      'Insurance Card Front',
      name: 'insuranceCardFront',
      desc: '',
      args: [],
    );
  }

  /// `Upload the front side of your Insurance Card.`
  String get uploadFrontSide {
    return Intl.message(
      'Upload the front side of your Insurance Card.',
      name: 'uploadFrontSide',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Card Back`
  String get insuranceCardBack {
    return Intl.message(
      'Insurance Card Back',
      name: 'insuranceCardBack',
      desc: '',
      args: [],
    );
  }

  /// `Upload the back side of your Insurance Card.`
  String get uploadBackSide {
    return Intl.message(
      'Upload the back side of your Insurance Card.',
      name: 'uploadBackSide',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `Full Name`
  String get fullNameHint {
    return Intl.message('Full Name', name: 'fullNameHint', desc: '', args: []);
  }

  /// `Insurance Information`
  String get insuranceInformation {
    return Intl.message(
      'Insurance Information',
      name: 'insuranceInformation',
      desc: '',
      args: [],
    );
  }

  /// `Retrieving insurance information...`
  String get retrrievingInsuranceInfo {
    return Intl.message(
      'Retrieving insurance information...',
      name: 'retrrievingInsuranceInfo',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load insurance information. Please try again.`
  String get failedToLoadInsuranceInfo {
    return Intl.message(
      'Failed to load insurance information. Please try again.',
      name: 'failedToLoadInsuranceInfo',
      desc: '',
      args: [],
    );
  }

  /// `Retrieving insurance information details...`
  String get retrievingInsuranceInfoDetails {
    return Intl.message(
      'Retrieving insurance information details...',
      name: 'retrievingInsuranceInfoDetails',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load insurance information details. Please try again.`
  String get failedToLoadInsuranceInfoDetails {
    return Intl.message(
      'Failed to load insurance information details. Please try again.',
      name: 'failedToLoadInsuranceInfoDetails',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Select Insurance Plan`
  String get selectInsurancePlan {
    return Intl.message(
      'Select Insurance Plan',
      name: 'selectInsurancePlan',
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
