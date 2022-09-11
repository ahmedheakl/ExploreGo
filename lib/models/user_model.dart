import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String photoUrl;
  String name;
  String email;

  User({
    required this.uid,
    required this.photoUrl,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toJson() =>
      {"uid": uid, "photoUrl": photoUrl, "name": name, "email": email};

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      uid: snapshot["uid"],
      photoUrl: snapshot["photoUrl"],
      name: snapshot["name"],
      email: snapshot["email"],
    );
  }
}
