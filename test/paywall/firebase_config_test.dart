import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:smokefree/firebase_options.dart';

void main() {
  test('Android Firebase options match the mobile package native config', () {
    final json = jsonDecode(File('android/app/google-services.json').readAsStringSync()) as Map<String, dynamic>;
    final clients = (json['client'] as List).cast<Map<String, dynamic>>();
    final mobile = clients.singleWhere((client) =>
      (client['client_info'] as Map)['android_client_info']['package_name'] == 'com.smokefreeai.mobile');
    final options = DefaultFirebaseOptions.android;
    expect(options.projectId, 'smokefreeai-99f98');
    expect(options.appId == mobile['client_info']['mobilesdk_app_id'], isTrue,
      reason: 'Flutter and native Firebase Android app identities must match');
    // Compare secrets without including their values in failure messages.
    expect(options.apiKey == (mobile['api_key'] as List).first['current_key'], isTrue,
      reason: 'Android Firebase client key must match native configuration');
  });
}
