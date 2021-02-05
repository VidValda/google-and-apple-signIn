import 'package:google_sign_in/google_sign_in.dart';

class GoogleService {
  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      "email",
    ],
  );

  static Future<GoogleSignInAccount> singInWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      final googleKey = await account.authentication;
      print(account);
      print(googleKey.idToken);

      //TODO: llamar un rest service con nuestro backend

      return account;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future signOut() async {
    try {
      await _googleSignIn.signOut();
    } catch (e) {}
  }
}
