import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class EpiFirebase {
  /// authentication instance of firebase
  FirebaseAuth auth = FirebaseAuth.instance;

  /// firestore instance of firebase
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// messaging instance of firebase
  FirebaseMessaging messaging = FirebaseMessaging();

  /// storage instance of firebase
  FirebaseStorage storage = FirebaseStorage.instance;

  /// this method sign in the user using google
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await auth.signInWithCredential(credential);
  }
}
