import 'package:flutter_riverpod/flutter_riverpod.dart';

/// `main()` içinde `Firebase.initializeApp()` başarılı olduysa `true`
/// olarak override edilir.
///
/// AI Koç gibi Firebase'e bağımlı ekranlar bunu kontrol eder — proje
/// henüz kurulmadıysa (bkz. docs/runbooks/firebase.md) uygulama ÇÖKMEZ,
/// yalnızca o ekran dürüst bir "yakında" mesajı gösterir.
final firebaseReadyProvider = Provider<bool>((ref) => false);
