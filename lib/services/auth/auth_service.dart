import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService 
{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //get current user
  User? getCurrentUSer() 
  {
    return _auth.currentUser;
  }
  //sign in 
  Future<UserCredential> signInWithEmailAndPassword(String email , String password) async 
  {
    try 
    {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password,);
        //save user info in a seperate doc
  _firestore.collection("Users").doc(userCredential.user!.uid).set({'uid': userCredential.user!.uid , 'email': email,});
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);

    }
  }
  //sign up 
  Future<UserCredential> signUpWithEmailPassword(String email, password) async 
  {
    try 
    {
     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
       //save user info in a seperate doc
  _firestore.collection("Users").doc(userCredential.user!.uid).set({'uid': userCredential.user!.uid , 'email': email,});
     return userCredential;
    } on FirebaseAuthException catch (e) 
    {
      throw Exception(e.code);

    }
  }

  //sign out 
  Future<void> signOut() async 
  {
    return await _auth.signOut();
  }
}