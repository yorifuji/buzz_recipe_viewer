import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_stream_provider.g.dart';

@riverpod
Stream<User?> userStream(Ref ref) => FirebaseAuth.instance.authStateChanges();
