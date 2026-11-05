# SmokeFree AI Android billing audit

Date: 2026-11-05. Reviewed source: main@430d715e8ea69644aab09bf6ebea62bae47e1cc5.
Scope: repository code and SDK 10.6.0 contract. No store purchase, release upload,
Play Console change, RevenueCat dashboard change, key change or merge to main.

## Conclusion

Zero reported revenue is not, by itself, proof that billing is broken. This audit
found demonstrable purchase-result and UX defects, but cannot attribute zero
revenue to them without live funnel and store configuration evidence. Active
subscriptions and trials in Play Console are necessary but not sufficient for
RevenueCat to load the intended plans. Trials can start with no collected payment;
license-test purchases do not establish real revenue.

## Verified repository findings

| Finding | Impact | Proposed fix |
| --- | --- | --- |
| purchasePackage ignored returned CustomerInfo and returned true on every non-throwing call | UI could say Premium was unlocked without active entitlements | Check actual returned entitlements; show an unconfirmed-access message instead of success |
| paymentPendingError shared the generic failure path | Users could retry a pending payment unnecessarily | Separate pending, cancellation, unconfirmed access and failure states |
| Each plan kept its own busy flag; Restore had none | Another plan or Restore could run while native purchase UI was open | One shared operation lock for all plans and Restore |
| Premium was fetched once per provider lifecycle, without SDK updates | Access/UI could stay stale after store-side updates | Listen for CustomerInfo updates; unregister listener on disposal; protect against stale initial fetch |
| Premium reads were not guarded when SDK initialization failed | AI-coach access checks could call an unconfigured SDK | Return non-Premium without invoking SDK when not ready |
| Offerings errors had no retry or restore action | A transient fetch error left the paywall stuck | Retry and Restore actions on load error; retry on empty current offering |
| Prices had no explicit billing period in the plan tile; no selected Android offer details | Annual price could be mistaken for a different period; a returned trial was not surfaced | Display localized store price/period and only the actual defaultOption free phase; never force a trial |
| Restore completion used context/ref after await without a mounted check | Navigating away during Restore could trigger an invalid UI update | Check mounted before showing result |
| Main manifest did not explicitly declare INTERNET (debug/profile do) | Release networking depended on merged transitive manifests | Declare INTERNET in the release/main manifest; not evidence that shipped builds lacked the permission |

The SDK's deprecated purchasePackage API is still functional. The proposal uses
purchase(PurchaseParams.package(...)), retaining the exact Offering/Package context
and SDK default offer selection. Deprecation alone is not a diagnosis of zero revenue.

## Product / entitlement mapping: verified and unverified

| Layer | Repository evidence | Remaining check |
| --- | --- | --- |
| Android application ID | com.smokefreeai.mobile | Match RevenueCat Android app + Play package |
| SDK | purchases_flutter and purchases_ui_flutter 10.6.0 | Compare with installed Play artifact, not just source |
| Source build number | pubspec.yaml: 1.0.6+21 | Verify exact production/testing version code in Play Console |
| Public client key | Android goog_ key present, not placeholder (value omitted) | Verify it belongs to intended RevenueCat project/app; prefix is not proof |
| Offering | getOfferings().current.availablePackages | Current Offering must contain intended Google products/base plans |
| Products/base plans | No hard-coded identifiers; received through Offering | Verify subscription ID + base-plan ID, status, regions and prices in both consoles |
| Trial | Existing purchase path already lets SDK choose defaultOption | Verify eligible offer is returned for an actual eligible Play account; app does not create eligibility |
| Entitlement | Existing code accepts any active entitlement | Confirm intended identifier + product attachments in RevenueCat before narrowing to a named entitlement |
| Customer identity | RevenueCat anonymous install identity; separate Firebase anonymous identity | Not inherently broken; Restore behavior/transfer policy and reinstall must be tested |

No entitlement ID was guessed, no SKU was invented, and no key was replaced.
Legacy any-active-entitlement behavior is deliberately preserved to avoid locking
out existing subscribers. If the project has multiple unrelated entitlements,
this must be narrowed only after the correct identifier is confirmed.

Other review observations: premium copy advertises features that are also
available free; this is a conversion/value-proposition concern, not proof of a
payment failure. The premium screen has Turkish copy in otherwise multilingual
UI; new state messages have TR/EN translations with generator fallback for other
locales. The general Apple EULA link is shown on Android too; a verified Android
terms URL is required before changing it. This patch does not add unsupported
feature locks or alter pricing, product IDs, trial eligibility or billing policy.

## Validation

Test sources: test/paywall/billing_flow_test.dart. Covers entitlement-confirmed
success, no-entitlement response, cancellation, pending payment, network failure
and retry, duplicate taps/restore exclusion, restore result, SDK updates,
listener disposal, stale-initial-response race, unconfigured SDK and store price
period formatting. The test uses synthetic customer/product identifiers, no keys
or actual payments.

Local git diff --check passed. Local Flutter execution was stopped by automatic
security review after its environment detection attempted to contact a cloud
metadata address. No bypass was attempted. A draft PR runs the repository's
non-deploying validation workflow on GitHub instead. CI result is recorded in
the PR discussion/summary after execution. This is not a physical-device Play
Billing test or an Android release build.

## Required acceptance before any release (not performed by this audit)

1. Verify RevenueCat project, correct goog_ app key, Google Play credentials /
   connection health, exact app package, Current Offering, each base plan and
   entitlement attachment. Do not paste credential values into chat or logs.
2. Use an authorized Android tester with a Play-installed internal-test build,
   licensed test account and eligible offer. No real charge without approval.
3. Test fresh eligible account vs prior subscriber: displayed currency, duration,
   trial and post-trial price must match Play checkout. Confirm cancellation,
   pending approval, completed purchase, restart and Restore without repurchase.
4. Check RevenueCat customer transaction/entitlement and Play order/subscription
   together; distinguish sandbox/test transactions, free trials and paid renewals.
5. Compare paywall views -> package load -> purchase attempt -> store outcome ->
   entitlement activation -> first paid renewal. Existing repository has no
   verified billing funnel telemetry; no production analytics event was invented.
6. Review and explicitly approve merge/build/release separately. Draft PR and
   branch commits do not change the installed application.

## Primary references

- https://www.revenuecat.com/docs/subscription-guidance/subscription-offers
- https://www.revenuecat.com/docs/customers/customer-info
- https://www.revenuecat.com/docs/getting-started/entitlements
- https://github.com/RevenueCat/purchases-flutter/tree/10.6.0
- https://developer.android.com/google/play/billing/test
