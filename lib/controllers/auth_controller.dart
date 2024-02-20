
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_study_app/firebase_ref/references.dart';
import 'package:flutter_study_app/screens/home/home_screen.dart';
import 'package:flutter_study_app/screens/login/login_screen.dart';
import 'package:flutter_study_app/widget/dialogs/dialogue_widget.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  FirebaseAuth? auth;
  

  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  void initAuth()  async {
    await Future.delayed(Duration(seconds: 2));
    auth = FirebaseAuth.instance;
    // if (_auth.currentUser != null) {
    _authStateChanges = auth!.authStateChanges();
    _authStateChanges.listen((User? user){
      _user.value = user;
    });
    navigateToIntroduction();
    // }
    
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _authAccount = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
          idToken: _authAccount.idToken,
          accessToken: _authAccount.accessToken
        );

        await auth!.signInWithCredential(_credential);
        await saveUser(account);
        navigateToHomePage();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }
  
  saveUser(GoogleSignInAccount account) {
    userRef.doc(account.email).set({
      "email" : account.email,
      "name" : account.displayName,
      "profilepic" : account.photoUrl
    });
  }

  void showLoginAlertDialog(){
    Get.dialog(Dialogs.questionStartDialogue(onTap: (){
      Get.back();
      navigateToLoginPage();
    }),
    barrierDismissible: false
    );
  }

  void navigateToLoginPage(){
    Get.toNamed(LoginScreen.routeName);
  }

  void navigateToHomePage(){
    Get.toNamed(HomeScreen.routeName);
  }

  bool isLoggedIn(){
    return auth!.currentUser != null;
  }

  User? getUser(){
    _user.value = auth?.currentUser;
    return _user.value;
  }

  Future<void> signOut() async{
    print("Çıkış");
    try {
      await auth!.signOut();
      navigateToHomePage();
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }
}