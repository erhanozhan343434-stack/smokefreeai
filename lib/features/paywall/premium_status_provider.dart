import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:smokefree/core/config/purchases_ready_provider.dart';
import 'package:smokefree/features/paywall/billing_client.dart';

final customerInfoProvider = StreamProvider.autoDispose<CustomerInfo>((ref) {
  if (!ref.watch(purchasesReadyProvider)) return const Stream.empty();
  final client = ref.watch(billingClientProvider);
  final controller = StreamController<CustomerInfo>();
  var receivedUpdate = false;
  var disposed = false;
  void listener(CustomerInfo info) {
    if (disposed) return;
    receivedUpdate = true;
    controller.add(info);
  }

  client.addListener(listener);
  unawaited(client.getCustomerInfo().then((info) {
    // A slow initial response must not overwrite a newer SDK update.
    if (!disposed && !receivedUpdate) controller.add(info);
  }, onError: (Object error, StackTrace stack) {
    if (!disposed && !receivedUpdate) controller.addError(error, stack);
  }));
  ref.onDispose(() {
    disposed = true;
    client.removeListener(listener);
    unawaited(controller.close());
  });
  return controller.stream;
});

final isPremiumProvider = FutureProvider.autoDispose<bool>((ref) async {
  if (!ref.watch(purchasesReadyProvider)) return false;
  return hasPremiumAccess(await ref.watch(customerInfoProvider.future));
});
