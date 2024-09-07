import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.g.dart';

class User {
  const User(this.id, this.name, this.email);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'] as String,
      json['name'] as String,
      json['email'] as String,
    );
  }

  Map<String, dynamic> get toJson => {'id': id, 'name': name, 'email': email};

  final String id;
  final String name;
  final String email;
}

extension UserConverter on User {
  static User from(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) =>
      User.fromJson(snapshot.data()!..['id'] = snapshot.id);

  static Map<String, Object?> to(
    User user,
    SetOptions? options,
  ) =>
      user.toJson..remove('id');
}

@riverpod
Stream<List<User>> usersStream(UsersStreamRef ref, int limit) =>
    FirebaseFirestore.instance
        .collection('users2')
        .limit(limit)
        .withConverter<User>(
          fromFirestore: UserConverter.from,
          toFirestore: UserConverter.to,
        )
        .snapshots()
        .map((snapshot) => snapshot.docs.map((e) => e.data()).toList());
