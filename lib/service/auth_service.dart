import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:examapp/Model/user.dart' as model;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
class AuthService{
  final FirebaseAuth _firebaseAuth =FirebaseAuth.instance;

  //login with facebook




//login with google
  final GoogleSignIn _googleSignIn=GoogleSignIn();
  Future <User> googleOauthLogin()async{
    GoogleSignInAccount googleSignInAccount=await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;
    OAuthCredential oAuthCredential= GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken
    );
    UserCredential userCredential=await _firebaseAuth.signInWithCredential(oAuthCredential);
    User user =userCredential.user;
    return user;
  }

//signup new user

  Stream<String> get onAuthStateChanged=>_firebaseAuth.authStateChanges().map((User user) => user?.uid);
  Future<String> creatUserWithEmailAndPassword(String email,String password,String firstName,String lastName,String photoUrl)async{
    final currentUser= await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    String name=firstName+' '+lastName;

    await FirebaseAuth.instance.currentUser.updateProfile(displayName: name,photoURL: photoUrl);
    return FirebaseAuth.instance.currentUser.uid;

  }
//singin user
Future <String> singInWithEmailAndPassword(String email,String password) async{
    return(await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user.uid;

}

//user data
  Future getUserData()async{
    return await FirebaseAuth.instance.currentUser;
  }

//logout user
singOut(){
    return _firebaseAuth.signOut();
}





}